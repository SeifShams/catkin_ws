// Generated by gencpp from file srl_laser_segmentation/LaserscanSegmentation.msg
// DO NOT EDIT!


#ifndef SRL_LASER_SEGMENTATION_MESSAGE_LASERSCANSEGMENTATION_H
#define SRL_LASER_SEGMENTATION_MESSAGE_LASERSCANSEGMENTATION_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <srl_laser_segmentation/LaserscanSegment.h>

namespace srl_laser_segmentation
{
template <class ContainerAllocator>
struct LaserscanSegmentation_
{
  typedef LaserscanSegmentation_<ContainerAllocator> Type;

  LaserscanSegmentation_()
    : header()
    , segments()  {
    }
  LaserscanSegmentation_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , segments(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::srl_laser_segmentation::LaserscanSegment_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::srl_laser_segmentation::LaserscanSegment_<ContainerAllocator> >> _segments_type;
  _segments_type segments;





  typedef boost::shared_ptr< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> const> ConstPtr;

}; // struct LaserscanSegmentation_

typedef ::srl_laser_segmentation::LaserscanSegmentation_<std::allocator<void> > LaserscanSegmentation;

typedef boost::shared_ptr< ::srl_laser_segmentation::LaserscanSegmentation > LaserscanSegmentationPtr;
typedef boost::shared_ptr< ::srl_laser_segmentation::LaserscanSegmentation const> LaserscanSegmentationConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator1> & lhs, const ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.segments == rhs.segments;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator1> & lhs, const ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace srl_laser_segmentation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4220e7e74ca923add2cd78d176946e12";
  }

  static const char* value(const ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4220e7e74ca923adULL;
  static const uint64_t static_value2 = 0xd2cd78d176946e12ULL;
};

template<class ContainerAllocator>
struct DataType< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "srl_laser_segmentation/LaserscanSegmentation";
  }

  static const char* value(const ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# A LaserscanSegmentation divides the points of a sensor_msgs/Laserscan into segments of (usually neighbouring)\n"
"# points. Each segment is assigned a label, which uniquely identifies the segment. Laserscan points that\n"
"# are considered as scene background are not part of any segment.\n"
"# LaserscanSegmentation messages can be used as an input to a classifier such as a person detector, or for annotating\n"
"# sensor_msgs/Laserscan messages with groundtruth person tracks (in that case, a segment's label denotes a person track ID,\n"
"# that is used consistently across multiple frames).\n"
"\n"
"# Standard message header\n"
"# The timestamp of this header must be equal to the timestamp of the corresponding Laserscan message,\n"
"# and can thus be used for synchronization of Laserscan and LaserscanSegmentation messages.\n"
"std_msgs/Header     header\n"
"\n"
"# All segments of interest of the current laser scan. Anything that is not part of a LaserscanSegment is\n"
"# implicitly defined as scene background. \n"
"LaserscanSegment[]  segments\n"
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
"\n"
"================================================================================\n"
"MSG: srl_laser_segmentation/LaserscanSegment\n"
"# The segment label assigned to this set of laser points, usually unique per sensor_msgs/Laserscan.\n"
"# If the LaserscanSegmentation message is used to annotate groundtruth person tracks, each label\n"
"# corresponds to the ID of a tracked person.\n"
"# Note that laser points which are considered as background are not part of any LaserscanSegment!\n"
"int16       label\n"
"\n"
"# Indices of the measurements in the sensor_msgs/Laserscan ranges[] and intensities[] arrays\n"
"# that are part of this segment. For example, if measurement_indices contains the values\n"
"# 0, 1 and 2 and the value of 'label' is 16, then the first three laser measurements (usually the\n"
"# three left-most laser points in polar coordinates) are assigned to segment 16.\n"
"uint16[]    measurement_indices\n"
;
  }

  static const char* value(const ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.segments);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LaserscanSegmentation_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::srl_laser_segmentation::LaserscanSegmentation_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "segments[]" << std::endl;
    for (size_t i = 0; i < v.segments.size(); ++i)
    {
      s << indent << "  segments[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::srl_laser_segmentation::LaserscanSegment_<ContainerAllocator> >::stream(s, indent + "    ", v.segments[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SRL_LASER_SEGMENTATION_MESSAGE_LASERSCANSEGMENTATION_H
