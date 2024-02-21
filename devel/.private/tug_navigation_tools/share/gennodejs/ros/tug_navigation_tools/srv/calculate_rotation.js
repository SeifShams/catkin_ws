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

class calculate_rotationRequest {
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
    // Serializes a message object of type calculate_rotationRequest
    // Serialize message field [path]
    bufferOffset = nav_msgs.msg.Path.serialize(obj.path, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type calculate_rotationRequest
    let len;
    let data = new calculate_rotationRequest(null);
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
    return 'tug_navigation_tools/calculate_rotationRequest';
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
    const resolved = new calculate_rotationRequest(null);
    if (msg.path !== undefined) {
      resolved.path = nav_msgs.msg.Path.Resolve(msg.path)
    }
    else {
      resolved.path = new nav_msgs.msg.Path()
    }

    return resolved;
    }
};

class calculate_rotationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type calculate_rotationResponse
    // Serialize message field [angle]
    bufferOffset = _serializer.float64(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type calculate_rotationResponse
    let len;
    let data = new calculate_rotationResponse(null);
    // Deserialize message field [angle]
    data.angle = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/calculate_rotationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4edb55038e2b888976a0c0c56935341c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new calculate_rotationResponse(null);
    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: calculate_rotationRequest,
  Response: calculate_rotationResponse,
  md5sum() { return 'd61b10bf9711ffd345b1e65c96b513fa'; },
  datatype() { return 'tug_navigation_tools/calculate_rotation'; }
};
