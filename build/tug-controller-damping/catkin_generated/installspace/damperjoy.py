#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist 

#define initial values
v_alt_l_x=0;
v_alt_l_y=0;
v_alt_l_z=0;
v_alt_a_x=0;
v_alt_a_y=0;
v_alt_a_z=0;

pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)# define Publisher

def callback(data):
	u_l_x=data.linear.x;#splitting values
	u_l_y=data.linear.y;
	u_l_z=data.linear.z;
	u_a_x=data.angular.x;
	u_a_y=data.angular.y;
	u_a_z=data.angular.z;
	
	#define global Variables
	global v_alt_l_x;
	global v_alt_l_y;
	global v_alt_l_z;
	global v_alt_a_x;
	global v_alt_a_y;
	global v_alt_a_z;
	
	#discrete computation of transfer; 0.02 kann be changed
	v_neu_l_x=v_alt_l_x+(u_l_x-v_alt_l_x)*(0.02/(1+0.02));
	v_neu_l_y=v_alt_l_y+(u_l_y-v_alt_l_y)*(0.02/(1+0.02));
	v_neu_l_z=v_alt_l_z+(u_l_z-v_alt_l_z)*(0.02/(1+0.02));
	v_neu_a_x=v_alt_a_x+(u_a_x-v_alt_a_x)*(0.02/(1+0.02));
	v_neu_a_y=v_alt_a_y+(u_a_y-v_alt_a_y)*(0.02/(1+0.02));
	v_neu_a_z=v_alt_a_z+(u_a_z-v_alt_a_z)*(0.02/(1+0.02));

	pubMsg=Twist();# define pubMsg as Twist
	pubMsg.linear.x=v_neu_l_x;
	pubMsg.linear.y=v_neu_l_y;
	pubMsg.linear.z=v_neu_l_z;
	pubMsg.angular.x=v_neu_a_x;
	pubMsg.angular.y=v_neu_a_y;
	pubMsg.angular.z=v_neu_a_z;
	
	v_alt_l_x=v_neu_l_x;#save old velocities
	v_alt_l_y=v_neu_l_y;
	v_alt_l_z=v_neu_l_z;
	v_alt_a_x=v_neu_a_x;
	v_alt_a_y=v_neu_a_y;
	v_alt_a_z=v_neu_a_z;
	
	pub.publish(pubMsg)
	
def damper():
    rospy.init_node('damperjoy', anonymous=True)
    rospy.Subscriber("/damper", Twist, callback)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()
   

if __name__ == '__main__':
    try:
        damper();
    except rospy.ROSInterruptException:
        pass
        
        


      
