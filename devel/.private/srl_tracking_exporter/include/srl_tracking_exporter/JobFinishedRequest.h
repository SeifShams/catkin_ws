// Generated by gencpp from file srl_tracking_exporter/JobFinishedRequest.msg
// DO NOT EDIT!


#ifndef SRL_TRACKING_EXPORTER_MESSAGE_JOBFINISHEDREQUEST_H
#define SRL_TRACKING_EXPORTER_MESSAGE_JOBFINISHEDREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace srl_tracking_exporter
{
template <class ContainerAllocator>
struct JobFinishedRequest_
{
  typedef JobFinishedRequest_<ContainerAllocator> Type;

  JobFinishedRequest_()
    : job_name()  {
    }
  JobFinishedRequest_(const ContainerAllocator& _alloc)
    : job_name(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _job_name_type;
  _job_name_type job_name;





  typedef boost::shared_ptr< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> const> ConstPtr;

}; // struct JobFinishedRequest_

typedef ::srl_tracking_exporter::JobFinishedRequest_<std::allocator<void> > JobFinishedRequest;

typedef boost::shared_ptr< ::srl_tracking_exporter::JobFinishedRequest > JobFinishedRequestPtr;
typedef boost::shared_ptr< ::srl_tracking_exporter::JobFinishedRequest const> JobFinishedRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator1> & lhs, const ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator2> & rhs)
{
  return lhs.job_name == rhs.job_name;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator1> & lhs, const ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace srl_tracking_exporter

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d920fe80478d88b925da2abe2df35139";
  }

  static const char* value(const ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd920fe80478d88b9ULL;
  static const uint64_t static_value2 = 0x25da2abe2df35139ULL;
};

template<class ContainerAllocator>
struct DataType< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "srl_tracking_exporter/JobFinishedRequest";
  }

  static const char* value(const ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string job_name\n"
;
  }

  static const char* value(const ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.job_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct JobFinishedRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::srl_tracking_exporter::JobFinishedRequest_<ContainerAllocator>& v)
  {
    s << indent << "job_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.job_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SRL_TRACKING_EXPORTER_MESSAGE_JOBFINISHEDREQUEST_H