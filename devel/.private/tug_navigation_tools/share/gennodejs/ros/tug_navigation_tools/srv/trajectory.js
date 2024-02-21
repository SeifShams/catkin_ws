// Auto-generated. Do not edit!

// (in-package tug_navigation_tools.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let nav_msgs = _finder('nav_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class trajectoryRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = new nav_msgs.msg.Path();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type trajectoryRequest
    // Serialize message field [path]
    bufferOffset = nav_msgs.msg.Path.serialize(obj.path, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type trajectoryRequest
    let len;
    let data = new trajectoryRequest(null);
    // Deserialize message field [path]
    data.path = nav_msgs.msg.Path.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += nav_msgs.msg.Path.getMessageSize(object.path);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/trajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '58d6f138c7de7ef47c75d4b7e5df5472';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    nav_msgs/Path path
    
    ================================================================================
    MSG: nav_msgs/Path
    #An array of poses that represents a Path for a robot to follow
    Header header
    geometry_msgs/PoseStamped[] poses
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new trajectoryRequest(null);
    if (msg.path !== undefined) {
      resolved.path = nav_msgs.msg.Path.Resolve(msg.path)
    }
    else {
      resolved.path = new nav_msgs.msg.Path()
    }

    return resolved;
    }
};

class trajectoryResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reply = null;
    }
    else {
      if (initObj.hasOwnProperty('reply')) {
        this.reply = initObj.reply
      }
      else {
        this.reply = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type trajectoryResponse
    // Serialize message field [reply]
    bufferOffset = _serializer.bool(obj.reply, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type trajectoryResponse
    let len;
    let data = new trajectoryResponse(null);
    // Deserialize message field [reply]
    data.reply = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/trajectoryResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '06d4f276c51f7469624c6fbcbf0e7869';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool reply
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new trajectoryResponse(null);
    if (msg.reply !== undefined) {
      resolved.reply = msg.reply;
    }
    else {
      resolved.reply = false
    }

    return resolved;
    }
};

module.exports = {
  Request: trajectoryRequest,
  Response: trajectoryResponse,
  md5sum() { return '9c140831c8ebdf2162ee01b665104ff7'; },
  datatype() { return 'tug_navigation_tools/trajectory'; }
};
