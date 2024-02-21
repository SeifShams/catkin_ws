// Generated by gencpp from file tug_navigation_tools/AccelerationStamped.msg
// DO NOT EDIT!


#ifndef TUG_NAVIGATION_TOOLS_MESSAGE_ACCELERATIONSTAMPED_H
#define TUG_NAVIGATION_TOOLS_MESSAGE_ACCELERATIONSTAMPED_H


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
struct AccelerationStamped_
{
  typedef AccelerationStamped_<ContainerAllocator> Type;

  AccelerationStamped_()
    : acceleration()
    , time_steps()
    , velocity()  {
    }
  AccelerationStamped_(const ContainerAllocator& _alloc)
    : acceleration(_alloc)
    , time_steps(_alloc)
    , velocity(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _acceleration_type;
  _acceleration_type acceleration;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _time_steps_type;
  _time_steps_type time_steps;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _velocity_type;
  _velocity_type velocity;





  typedef boost::shared_ptr< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> const> ConstPtr;

}; // struct AccelerationStamped_

typedef ::tug_navigation_tools::AccelerationStamped_<std::allocator<void> > AccelerationStamped;

typedef boost::shared_ptr< ::tug_navigation_tools::AccelerationStamped > AccelerationStampedPtr;
typedef boost::shared_ptr< ::tug_navigation_tools::AccelerationStamped const> AccelerationStampedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator1> & lhs, const ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator2> & rhs)
{
  return lhs.acceleration == rhs.acceleration &&
    lhs.time_steps == rhs.time_steps &&
    lhs.velocity == rhs.velocity;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator1> & lhs, const ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace tug_navigation_tools

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d18a36833bccd99a0ea7160cc1ef0909";
  }

  static const char* value(const ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd18a36833bccd99aULL;
  static const uint64_t static_value2 = 0x0ea7160cc1ef0909ULL;
};

template<class ContainerAllocator>
struct DataType< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tug_navigation_tools/AccelerationStamped";
  }

  static const char* value(const ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] acceleration\n"
"float64[] time_steps\n"
"float64[] velocity\n"
;
  }

  static const char* value(const ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.acceleration);
      stream.next(m.time_steps);
      stream.next(m.velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AccelerationStamped_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tug_navigation_tools::AccelerationStamped_<ContainerAllocator>& v)
  {
    s << indent << "acceleration[]" << std::endl;
    for (size_t i = 0; i < v.acceleration.size(); ++i)
    {
      s << indent << "  acceleration[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.acceleration[i]);
    }
    s << indent << "time_steps[]" << std::endl;
    for (size_t i = 0; i < v.time_steps.size(); ++i)
    {
      s << indent << "  time_steps[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.time_steps[i]);
    }
    s << indent << "velocity[]" << std::endl;
    for (size_t i = 0; i < v.velocity.size(); ++i)
    {
      s << indent << "  velocity[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.velocity[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TUG_NAVIGATION_TOOLS_MESSAGE_ACCELERATIONSTAMPED_H