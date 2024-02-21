// Generated by gencpp from file tug_navigation_tools/rotate_to_angle.msg
// DO NOT EDIT!


#ifndef TUG_NAVIGATION_TOOLS_MESSAGE_ROTATE_TO_ANGLE_H
#define TUG_NAVIGATION_TOOLS_MESSAGE_ROTATE_TO_ANGLE_H

#include <ros/service_traits.h>


#include <tug_navigation_tools/rotate_to_angleRequest.h>
#include <tug_navigation_tools/rotate_to_angleResponse.h>


namespace tug_navigation_tools
{

struct rotate_to_angle
{

typedef rotate_to_angleRequest Request;
typedef rotate_to_angleResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct rotate_to_angle
} // namespace tug_navigation_tools


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::tug_navigation_tools::rotate_to_angle > {
  static const char* value()
  {
    return "bd2782be2069801f5722cbaf3da80be1";
  }

  static const char* value(const ::tug_navigation_tools::rotate_to_angle&) { return value(); }
};

template<>
struct DataType< ::tug_navigation_tools::rotate_to_angle > {
  static const char* value()
  {
    return "tug_navigation_tools/rotate_to_angle";
  }

  static const char* value(const ::tug_navigation_tools::rotate_to_angle&) { return value(); }
};


// service_traits::MD5Sum< ::tug_navigation_tools::rotate_to_angleRequest> should match
// service_traits::MD5Sum< ::tug_navigation_tools::rotate_to_angle >
template<>
struct MD5Sum< ::tug_navigation_tools::rotate_to_angleRequest>
{
  static const char* value()
  {
    return MD5Sum< ::tug_navigation_tools::rotate_to_angle >::value();
  }
  static const char* value(const ::tug_navigation_tools::rotate_to_angleRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::tug_navigation_tools::rotate_to_angleRequest> should match
// service_traits::DataType< ::tug_navigation_tools::rotate_to_angle >
template<>
struct DataType< ::tug_navigation_tools::rotate_to_angleRequest>
{
  static const char* value()
  {
    return DataType< ::tug_navigation_tools::rotate_to_angle >::value();
  }
  static const char* value(const ::tug_navigation_tools::rotate_to_angleRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::tug_navigation_tools::rotate_to_angleResponse> should match
// service_traits::MD5Sum< ::tug_navigation_tools::rotate_to_angle >
template<>
struct MD5Sum< ::tug_navigation_tools::rotate_to_angleResponse>
{
  static const char* value()
  {
    return MD5Sum< ::tug_navigation_tools::rotate_to_angle >::value();
  }
  static const char* value(const ::tug_navigation_tools::rotate_to_angleResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::tug_navigation_tools::rotate_to_angleResponse> should match
// service_traits::DataType< ::tug_navigation_tools::rotate_to_angle >
template<>
struct DataType< ::tug_navigation_tools::rotate_to_angleResponse>
{
  static const char* value()
  {
    return DataType< ::tug_navigation_tools::rotate_to_angle >::value();
  }
  static const char* value(const ::tug_navigation_tools::rotate_to_angleResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TUG_NAVIGATION_TOOLS_MESSAGE_ROTATE_TO_ANGLE_H