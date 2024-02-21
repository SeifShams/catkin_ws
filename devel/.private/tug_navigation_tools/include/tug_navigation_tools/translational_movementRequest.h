// Generated by gencpp from file tug_navigation_tools/translational_movementRequest.msg
// DO NOT EDIT!


#ifndef TUG_NAVIGATION_TOOLS_MESSAGE_TRANSLATIONAL_MOVEMENTREQUEST_H
#define TUG_NAVIGATION_TOOLS_MESSAGE_TRANSLATIONAL_MOVEMENTREQUEST_H


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
struct translational_movementRequest_
{
  typedef translational_movementRequest_<ContainerAllocator> Type;

  translational_movementRequest_()
    : back_and_forth(0.0)
    , side_to_side(0.0)  {
    }
  translational_movementRequest_(const ContainerAllocator& _alloc)
    : back_and_forth(0.0)
    , side_to_side(0.0)  {
  (void)_alloc;
    }



   typedef double _back_and_forth_type;
  _back_and_forth_type back_and_forth;

   typedef double _side_to_side_type;
  _side_to_side_type side_to_side;





  typedef boost::shared_ptr< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> const> ConstPtr;

}; // struct translational_movementRequest_

typedef ::tug_navigation_tools::translational_movementRequest_<std::allocator<void> > translational_movementRequest;

typedef boost::shared_ptr< ::tug_navigation_tools::translational_movementRequest > translational_movementRequestPtr;
typedef boost::shared_ptr< ::tug_navigation_tools::translational_movementRequest const> translational_movementRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator1> & lhs, const ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator2> & rhs)
{
  return lhs.back_and_forth == rhs.back_and_forth &&
    lhs.side_to_side == rhs.side_to_side;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator1> & lhs, const ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace tug_navigation_tools

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "039a9ef5cf199afe113bc15928a75435";
  }

  static const char* value(const ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x039a9ef5cf199afeULL;
  static const uint64_t static_value2 = 0x113bc15928a75435ULL;
};

template<class ContainerAllocator>
struct DataType< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tug_navigation_tools/translational_movementRequest";
  }

  static const char* value(const ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 back_and_forth\n"
"float64 side_to_side\n"
;
  }

  static const char* value(const ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.back_and_forth);
      stream.next(m.side_to_side);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct translational_movementRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tug_navigation_tools::translational_movementRequest_<ContainerAllocator>& v)
  {
    s << indent << "back_and_forth: ";
    Printer<double>::stream(s, indent + "  ", v.back_and_forth);
    s << indent << "side_to_side: ";
    Printer<double>::stream(s, indent + "  ", v.side_to_side);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TUG_NAVIGATION_TOOLS_MESSAGE_TRANSLATIONAL_MOVEMENTREQUEST_H