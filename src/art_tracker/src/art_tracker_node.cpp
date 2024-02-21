#include <iostream>
#include <ros/ros.h>
#include "DTrackSDK.hpp"
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>

#include <geometry_msgs/TransformStamped.h>

// global DTrackSDK
static DTrackSDK* dt = NULL;

// prototypes
static void get_transform();
static bool data_error_to_console();
static void messages_to_console();


/**
 * \brief Main.
 */
int main( int argc, char** argv )
{

	// Initialize ROS node
	ros::init(argc, argv, "art_tracker");
	ros::NodeHandle nh;
	std::string port;	
    nh.param<std::string>("/art_tracker_node/port", port, "port");

	if ( port == "" )
	{
		std::cout << "Usage: example_universal [<server host/ip>:]" << port << std::endl;
		return -1;
	}
	else
    	ROS_INFO("The port loaded is: %s", port.c_str());


	dt = new DTrackSDK( (const char *)port.c_str());

	if ( ! dt->isDataInterfaceValid() )
	{
		std::cout << "DTrackSDK init error" << std::endl;
		delete dt;
		return -3;
	}
	std::cout << "connected to ATC '" << argv[ 1 ] << "', listening at local data port " << dt->getDataPort() << std::endl;

	if ( dt->isCommandInterfaceValid() )  // ensure full access for DTrack2/DTRACK3 commands, if in communicating mode
	{
		if ( ! dt->isCommandInterfaceFullAccess() )
		{
			std::cout << "Full access to ATC required!" << std::endl;  // maybe DTrack2/3 frontend is still connected to ATC
			data_error_to_console();
			messages_to_console();
			delete dt;
			return -10;
		}
	}

	// measurement:

	if ( dt->isCommandInterfaceValid() )
	{
		if ( ! dt->startMeasurement() )  // start measurement
		{
			std::cout << "Measurement start failed!" << std::endl;
			data_error_to_console();
			messages_to_console();
			delete dt;
			return -4;
		}
	}

	int count = 0;
	while ( count++ < 1000 )  // collect 1000 frames
	{
		if ( dt->receive() )
		{
			get_transform();
		}
		else
		{
			data_error_to_console();
			if ( dt->isCommandInterfaceValid() )  messages_to_console();
		}

		if ( ( count % 100 == 1 ) && dt->isCommandInterfaceValid() )
			messages_to_console();
	}

	if ( dt->isCommandInterfaceValid() )
	{
		dt->stopMeasurement();  // stop measurement
		messages_to_console();
	}


	delete dt;  // clean up

	// Start ROS loop
  	ros::spin();
	return 0;
}


/**
 * \brief Prints current tracking data to console.
 */
static void get_transform()
{
	static tf2_ros::TransformBroadcaster tf_broadcaster;
	geometry_msgs::TransformStamped transformStamped;

	std::cout.precision( 3 );
	std::cout.setf( std::ios::fixed, std::ios::floatfield );

	// Standard bodies:
	for ( int i = 0; i < dt->getNumBody(); i++ )
	{
		const DTrackBody* body = dt->getBody( i );
		if ( body == NULL )
		{
			std::cout << "DTrackSDK fatal error: invalid body id " << i << std::endl;
			break;
		}

		if ( body->isTracked() )
		{
			
			// if (body->id == 1)
			// 	frame_id = "depth_front_camera_base";
			// else
			std::string frame_id = "";
			frame_id = "bod_" + std::to_string(body->id);

			// Define the transformation parameters
    		transformStamped.header.stamp = ros::Time::now();
    		transformStamped.header.frame_id = "world"; // Parent frame ID
    		transformStamped.child_frame_id = frame_id;
			transformStamped.transform.translation.x = body->loc[ 0 ] / 1000;     // Translation x
    		transformStamped.transform.translation.y = body->loc[ 1 ] / 1000;     // Translation y
    		transformStamped.transform.translation.z = body->loc[ 2 ] / 1000;     // Translation z

    		// Create a quaternion using the provided values
			DTrackQuaternion q = body->getQuaternion();
			transformStamped.transform.rotation.x = q.x;
    		transformStamped.transform.rotation.y = q.y;
    		transformStamped.transform.rotation.z = q.z;
    		transformStamped.transform.rotation.w = q.w;

      		
			tf_broadcaster.sendTransform(transformStamped);

			//ROS_INFO(frame_id);
			if (frame_id == "bod_1")
				{

					// Create a geometry_msgs::TransformStamped message to represent the transform
    				geometry_msgs::TransformStamped transform_msg;
    				transform_msg.header.stamp = ros::Time::now();
    				transform_msg.header.frame_id = "bod_1";
    				transform_msg.child_frame_id = "depth_front_camera_base";
    				transform_msg.transform.translation.x = 0.0 + 0.053; // Adjust the translation values as needed
    				transform_msg.transform.translation.y = 0.0 - 0.014;
    				transform_msg.transform.translation.z = 0.0 - 0.043;
    				transform_msg.transform.rotation.x = 0.0;    // Adjust the rotation values as needed
    				transform_msg.transform.rotation.y = 0.0;
    				transform_msg.transform.rotation.z = 0.0;
    				transform_msg.transform.rotation.w = 1.0;

    				// Publish the static transform
    				tf_broadcaster.sendTransform(transform_msg);
				}

    		// Print the transform data using std::cout
        	//std::cout << "Transform:\n" << transformStamped << std::endl;
		}
	}
}

    /**
 * \brief Prints error messages to console.
 *
 * @return No error occured?
 */
static bool data_error_to_console()
{
	bool ret = true;

	if ( dt->getLastDataError() != DTrackSDK::ERR_NONE )
	{
		if ( dt->getLastDataError() == DTrackSDK::ERR_TIMEOUT )
		{
			std::cout << "--- timeout while waiting for tracking data" << std::endl;
		}
		else if ( dt->getLastDataError() == DTrackSDK::ERR_NET )
		{
			std::cout << "--- error while receiving tracking data" << std::endl;
		}
		else if ( dt->getLastDataError() == DTrackSDK::ERR_PARSE )
		{
			std::cout << "--- error while parsing tracking data" << std::endl;
		}

		ret = false;
	}

	if ( dt->getLastServerError() != DTrackSDK::ERR_NONE )
	{
		if ( dt->getLastServerError() == DTrackSDK::ERR_TIMEOUT )
		{
			std::cout << "--- timeout while waiting for Controller command" << std::endl;
		}
		else if ( dt->getLastServerError() == DTrackSDK::ERR_NET )
		{
			std::cout << "--- error while receiving Controller command" << std::endl;
		}
		else if ( dt->getLastServerError() == DTrackSDK::ERR_PARSE )
		{
			std::cout << "--- error while parsing Controller command" << std::endl;
		}

		ret = false;
	}

	return ret;
}

/**
 * \brief Prints ATC messages to console.
 */
static void messages_to_console()
{
	while ( dt->getMessage() )
	{
		std::cout << "ATC message: \"" << dt->getMessageStatus() << "\" \"" << dt->getMessageMsg() << "\"" << std::endl;
	}
}
