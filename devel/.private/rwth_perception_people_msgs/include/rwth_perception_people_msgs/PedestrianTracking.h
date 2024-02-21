// Generated by gencpp from file rwth_perception_people_msgs/PedestrianTracking.msg
// DO NOT EDIT!


#ifndef RWTH_PERCEPTION_PEOPLE_MSGS_MESSAGE_PEDESTRIANTRACKING_H
#define RWTH_PERCEPTION_PEOPLE_MSGS_MESSAGE_PEDESTRIANTRACKING_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace rwth_perception_people_msgs
{
template <class ContainerAllocator>
struct PedestrianTracking_
{
  typedef PedestrianTracking_<ContainerAllocator> Type;

  PedestrianTracking_()
    : header()
    , traj_x()
    , traj_y()
    , traj_z()
    , traj_x_camera()
    , traj_y_camera()
    , traj_z_camera()
    , dir()
    , speed(0.0)
    , id(0)
    , score(0.0)  {
    }
  PedestrianTracking_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , traj_x(_alloc)
    , traj_y(_alloc)
    , traj_z(_alloc)
    , traj_x_camera(_alloc)
    , traj_y_camera(_alloc)
    , traj_z_camera(_alloc)
    , dir(_alloc)
    , speed(0.0)
    , id(0)
    , score(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _traj_x_type;
  _traj_x_type traj_x;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _traj_y_type;
  _traj_y_type traj_y;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _traj_z_type;
  _traj_z_type traj_z;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _traj_x_camera_type;
  _traj_x_camera_type traj_x_camera;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _traj_y_camera_type;
  _traj_y_camera_type traj_y_camera;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _traj_z_camera_type;
  _traj_z_camera_type traj_z_camera;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _dir_type;
  _dir_type dir;

   typedef double _speed_type;
  _speed_type speed;

   typedef int64_t _id_type;
  _id_type id;

   typedef double _score_type;
  _score_type score;





  typedef boost::shared_ptr< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> const> ConstPtr;

}; // struct PedestrianTracking_

typedef ::rwth_perception_people_msgs::PedestrianTracking_<std::allocator<void> > PedestrianTracking;

typedef boost::shared_ptr< ::rwth_perception_people_msgs::PedestrianTracking > PedestrianTrackingPtr;
typedef boost::shared_ptr< ::rwth_perception_people_msgs::PedestrianTracking const> PedestrianTrackingConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator1> & lhs, const ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.traj_x == rhs.traj_x &&
    lhs.traj_y == rhs.traj_y &&
    lhs.traj_z == rhs.traj_z &&
    lhs.traj_x_camera == rhs.traj_x_camera &&
    lhs.traj_y_camera == rhs.traj_y_camera &&
    lhs.traj_z_camera == rhs.traj_z_camera &&
    lhs.dir == rhs.dir &&
    lhs.speed == rhs.speed &&
    lhs.id == rhs.id &&
    lhs.score == rhs.score;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator1> & lhs, const ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace rwth_perception_people_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> >
{
  static const char* value()
  {
    return "09aa33b8051238d8dd3261c282a34984";
  }

  static const char* value(const ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x09aa33b8051238d8ULL;
  static const uint64_t static_value2 = 0xdd3261c282a34984ULL;
};

template<class ContainerAllocator>
struct DataType< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rwth_perception_people_msgs/PedestrianTracking";
  }

  static const char* value(const ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"# position projected on the GP in world coordinates\n"
"float64[] traj_x \n"
"float64[] traj_y \n"
"float64[] traj_z\n"
"# position projected on the GP in camera coordinates\n"
"float64[] traj_x_camera \n"
"float64[] traj_y_camera \n"
"float64[] traj_z_camera \n"
"float64[] dir 	\n"
"float64 speed 	\n"
"int64 id  \n"
"float64 score\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.traj_x);
      stream.next(m.traj_y);
      stream.next(m.traj_z);
      stream.next(m.traj_x_camera);
      stream.next(m.traj_y_camera);
      stream.next(m.traj_z_camera);
      stream.next(m.dir);
      stream.next(m.speed);
      stream.next(m.id);
      stream.next(m.score);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PedestrianTracking_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rwth_perception_people_msgs::PedestrianTracking_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "traj_x[]" << std::endl;
    for (size_t i = 0; i < v.traj_x.size(); ++i)
    {
      s << indent << "  traj_x[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.traj_x[i]);
    }
    s << indent << "traj_y[]" << std::endl;
    for (size_t i = 0; i < v.traj_y.size(); ++i)
    {
      s << indent << "  traj_y[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.traj_y[i]);
    }
    s << indent << "traj_z[]" << std::endl;
    for (size_t i = 0; i < v.traj_z.size(); ++i)
    {
      s << indent << "  traj_z[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.traj_z[i]);
    }
    s << indent << "traj_x_camera[]" << std::endl;
    for (size_t i = 0; i < v.traj_x_camera.size(); ++i)
    {
      s << indent << "  traj_x_camera[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.traj_x_camera[i]);
    }
    s << indent << "traj_y_camera[]" << std::endl;
    for (size_t i = 0; i < v.traj_y_camera.size(); ++i)
    {
      s << indent << "  traj_y_camera[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.traj_y_camera[i]);
    }
    s << indent << "traj_z_camera[]" << std::endl;
    for (size_t i = 0; i < v.traj_z_camera.size(); ++i)
    {
      s << indent << "  traj_z_camera[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.traj_z_camera[i]);
    }
    s << indent << "dir[]" << std::endl;
    for (size_t i = 0; i < v.dir.size(); ++i)
    {
      s << indent << "  dir[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.dir[i]);
    }
    s << indent << "speed: ";
    Printer<double>::stream(s, indent + "  ", v.speed);
    s << indent << "id: ";
    Printer<int64_t>::stream(s, indent + "  ", v.id);
    s << indent << "score: ";
    Printer<double>::stream(s, indent + "  ", v.score);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RWTH_PERCEPTION_PEOPLE_MSGS_MESSAGE_PEDESTRIANTRACKING_H
