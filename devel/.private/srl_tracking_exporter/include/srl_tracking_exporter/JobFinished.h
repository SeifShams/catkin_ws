// Generated by gencpp from file srl_tracking_exporter/JobFinished.msg
// DO NOT EDIT!


#ifndef SRL_TRACKING_EXPORTER_MESSAGE_JOBFINISHED_H
#define SRL_TRACKING_EXPORTER_MESSAGE_JOBFINISHED_H

#include <ros/service_traits.h>


#include <srl_tracking_exporter/JobFinishedRequest.h>
#include <srl_tracking_exporter/JobFinishedResponse.h>


namespace srl_tracking_exporter
{

struct JobFinished
{

typedef JobFinishedRequest Request;
typedef JobFinishedResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct JobFinished
} // namespace srl_tracking_exporter


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::srl_tracking_exporter::JobFinished > {
  static const char* value()
  {
    return "d920fe80478d88b925da2abe2df35139";
  }

  static const char* value(const ::srl_tracking_exporter::JobFinished&) { return value(); }
};

template<>
struct DataType< ::srl_tracking_exporter::JobFinished > {
  static const char* value()
  {
    return "srl_tracking_exporter/JobFinished";
  }

  static const char* value(const ::srl_tracking_exporter::JobFinished&) { return value(); }
};


// service_traits::MD5Sum< ::srl_tracking_exporter::JobFinishedRequest> should match
// service_traits::MD5Sum< ::srl_tracking_exporter::JobFinished >
template<>
struct MD5Sum< ::srl_tracking_exporter::JobFinishedRequest>
{
  static const char* value()
  {
    return MD5Sum< ::srl_tracking_exporter::JobFinished >::value();
  }
  static const char* value(const ::srl_tracking_exporter::JobFinishedRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::srl_tracking_exporter::JobFinishedRequest> should match
// service_traits::DataType< ::srl_tracking_exporter::JobFinished >
template<>
struct DataType< ::srl_tracking_exporter::JobFinishedRequest>
{
  static const char* value()
  {
    return DataType< ::srl_tracking_exporter::JobFinished >::value();
  }
  static const char* value(const ::srl_tracking_exporter::JobFinishedRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::srl_tracking_exporter::JobFinishedResponse> should match
// service_traits::MD5Sum< ::srl_tracking_exporter::JobFinished >
template<>
struct MD5Sum< ::srl_tracking_exporter::JobFinishedResponse>
{
  static const char* value()
  {
    return MD5Sum< ::srl_tracking_exporter::JobFinished >::value();
  }
  static const char* value(const ::srl_tracking_exporter::JobFinishedResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::srl_tracking_exporter::JobFinishedResponse> should match
// service_traits::DataType< ::srl_tracking_exporter::JobFinished >
template<>
struct DataType< ::srl_tracking_exporter::JobFinishedResponse>
{
  static const char* value()
  {
    return DataType< ::srl_tracking_exporter::JobFinished >::value();
  }
  static const char* value(const ::srl_tracking_exporter::JobFinishedResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SRL_TRACKING_EXPORTER_MESSAGE_JOBFINISHED_H
