// Generated by gencpp from file tug_navigation_tools/translational_movementResponse.msg
// DO NOT EDIT!


#ifndef TUG_NAVIGATION_TOOLS_MESSAGE_TRANSLATIONAL_MOVEMENTRESPONSE_H
#define TUG_NAVIGATION_TOOLS_MESSAGE_TRANSLATIONAL_MOVEMENTRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tug_navigation_tools
{
template <class ContainerAllocator>
struct translational_movementResponse_
{
  typedef translational_movementResponse_<ContainerAllocator> Type;

  translational_movementResponse_()
    : reached(false)  {
    }
  translational_movementResponse_(const ContainerAllocator& _alloc)
    : reached(false)  {
  (void)_alloc;
    }



   typedef uint8_t _reached_type;
  _reached_type reached;





  typedef boost::shared_ptr< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> const> ConstPtr;

}; // struct translational_movementResponse_

typedef ::tug_navigation_tools::translational_movementResponse_<std::allocator<void> > translational_movementResponse;

typedef boost::shared_ptr< ::tug_navigation_tools::translational_movementResponse > translational_movementResponsePtr;
typedef boost::shared_ptr< ::tug_navigation_tools::translational_movementResponse const> translational_movementResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator1> & lhs, const ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator2> & rhs)
{
  return lhs.reached == rhs.reached;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator1> & lhs, const ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace tug_navigation_tools

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "80204a6ff2622a7071680d5597cbd3aa";
  }

  static const char* value(const ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x80204a6ff2622a70ULL;
  static const uint64_t static_value2 = 0x71680d5597cbd3aaULL;
};

template<class ContainerAllocator>
struct DataType< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tug_navigation_tools/translational_movementResponse";
  }

  static const char* value(const ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool reached\n"
"\n"
;
  }

  static const char* value(const ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.reached);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct translational_movementResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tug_navigation_tools::translational_movementResponse_<ContainerAllocator>& v)
  {
    s << indent << "reached: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.reached);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TUG_NAVIGATION_TOOLS_MESSAGE_TRANSLATIONAL_MOVEMENTRESPONSE_H