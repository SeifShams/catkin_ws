// Generated by gencpp from file tug_neo_locate_station/LocateStationRequest.msg
// DO NOT EDIT!


#ifndef TUG_NEO_LOCATE_STATION_MESSAGE_LOCATESTATIONREQUEST_H
#define TUG_NEO_LOCATE_STATION_MESSAGE_LOCATESTATIONREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tug_neo_locate_station
{
template <class ContainerAllocator>
struct LocateStationRequest_
{
  typedef LocateStationRequest_<ContainerAllocator> Type;

  LocateStationRequest_()
    {
    }
  LocateStationRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> const> ConstPtr;

}; // struct LocateStationRequest_

typedef ::tug_neo_locate_station::LocateStationRequest_<std::allocator<void> > LocateStationRequest;

typedef boost::shared_ptr< ::tug_neo_locate_station::LocateStationRequest > LocateStationRequestPtr;
typedef boost::shared_ptr< ::tug_neo_locate_station::LocateStationRequest const> LocateStationRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace tug_neo_locate_station

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tug_neo_locate_station/LocateStationRequest";
  }

  static const char* value(const ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LocateStationRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::tug_neo_locate_station::LocateStationRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // TUG_NEO_LOCATE_STATION_MESSAGE_LOCATESTATIONREQUEST_H