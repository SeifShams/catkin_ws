// Generated by gencpp from file srl_tracking_exporter/JobFinishedResponse.msg
// DO NOT EDIT!


#ifndef SRL_TRACKING_EXPORTER_MESSAGE_JOBFINISHEDRESPONSE_H
#define SRL_TRACKING_EXPORTER_MESSAGE_JOBFINISHEDRESPONSE_H


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
struct JobFinishedResponse_
{
  typedef JobFinishedResponse_<ContainerAllocator> Type;

  JobFinishedResponse_()
    {
    }
  JobFinishedResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> const> ConstPtr;

}; // struct JobFinishedResponse_

typedef ::srl_tracking_exporter::JobFinishedResponse_<std::allocator<void> > JobFinishedResponse;

typedef boost::shared_ptr< ::srl_tracking_exporter::JobFinishedResponse > JobFinishedResponsePtr;
typedef boost::shared_ptr< ::srl_tracking_exporter::JobFinishedResponse const> JobFinishedResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace srl_tracking_exporter

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "srl_tracking_exporter/JobFinishedResponse";
  }

  static const char* value(const ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct JobFinishedResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::srl_tracking_exporter::JobFinishedResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // SRL_TRACKING_EXPORTER_MESSAGE_JOBFINISHEDRESPONSE_H
