// Generated by gencpp from file tug_navigation_tools/parking_position.msg
// DO NOT EDIT!


#ifndef TUG_NAVIGATION_TOOLS_MESSAGE_PARKING_POSITION_H
#define TUG_NAVIGATION_TOOLS_MESSAGE_PARKING_POSITION_H

#include <ros/service_traits.h>


#include <tug_navigation_tools/parking_positionRequest.h>
#include <tug_navigation_tools/parking_positionResponse.h>


namespace tug_navigation_tools
{

struct parking_position
{

typedef parking_positionRequest Request;
typedef parking_positionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct parking_position
} // namespace tug_navigation_tools


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::tug_navigation_tools::parking_position > {
  static const char* value()
  {
    return "9cccc68cdb448b7a1440e1b408ee11bd";
  }

  static const char* value(const ::tug_navigation_tools::parking_position&) { return value(); }
};

template<>
struct DataType< ::tug_navigation_tools::parking_position > {
  static const char* value()
  {
    return "tug_navigation_tools/parking_position";
  }

  static const char* value(const ::tug_navigation_tools::parking_position&) { return value(); }
};


// service_traits::MD5Sum< ::tug_navigation_tools::parking_positionRequest> should match
// service_traits::MD5Sum< ::tug_navigation_tools::parking_position >
template<>
struct MD5Sum< ::tug_navigation_tools::parking_positionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::tug_navigation_tools::parking_position >::value();
  }
  static const char* value(const ::tug_navigation_tools::parking_positionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::tug_navigation_tools::parking_positionRequest> should match
// service_traits::DataType< ::tug_navigation_tools::parking_position >
template<>
struct DataType< ::tug_navigation_tools::parking_positionRequest>
{
  static const char* value()
  {
    return DataType< ::tug_navigation_tools::parking_position >::value();
  }
  static const char* value(const ::tug_navigation_tools::parking_positionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::tug_navigation_tools::parking_positionResponse> should match
// service_traits::MD5Sum< ::tug_navigation_tools::parking_position >
template<>
struct MD5Sum< ::tug_navigation_tools::parking_positionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::tug_navigation_tools::parking_position >::value();
  }
  static const char* value(const ::tug_navigation_tools::parking_positionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::tug_navigation_tools::parking_positionResponse> should match
// service_traits::DataType< ::tug_navigation_tools::parking_position >
template<>
struct DataType< ::tug_navigation_tools::parking_positionResponse>
{
  static const char* value()
  {
    return DataType< ::tug_navigation_tools::parking_position >::value();
  }
  static const char* value(const ::tug_navigation_tools::parking_positionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TUG_NAVIGATION_TOOLS_MESSAGE_PARKING_POSITION_H
