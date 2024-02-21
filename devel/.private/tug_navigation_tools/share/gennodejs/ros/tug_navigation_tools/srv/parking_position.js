// Auto-generated. Do not edit!

// (in-package tug_navigation_tools.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class parking_positionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.distance = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type parking_positionRequest
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type parking_positionRequest
    let len;
    let data = new parking_positionRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/parking_positionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68b34e16807f733f1339ca745bc48a1b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # x-position of the table
    float64 x
    
    # y-position of the table
    float64 y
    
    # distance between border of table and Eisenschwein
    float64 distance
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new parking_positionRequest(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    return resolved;
    }
};

class parking_positionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.new_parking_position = null;
      this.position_found = null;
    }
    else {
      if (initObj.hasOwnProperty('new_parking_position')) {
        this.new_parking_position = initObj.new_parking_position
      }
      else {
        this.new_parking_position = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('position_found')) {
        this.position_found = initObj.position_found
      }
      else {
        this.position_found = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type parking_positionResponse
    // Serialize message field [new_parking_position]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.new_parking_position, buffer, bufferOffset);
    // Serialize message field [position_found]
    bufferOffset = _serializer.bool(obj.position_found, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type parking_positionResponse
    let len;
    let data = new parking_positionResponse(null);
    // Deserialize message field [new_parking_position]
    data.new_parking_position = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [position_found]
    data.position_found = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 57;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/parking_positionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8a9fe4115560c8688867b11b9f935c33';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # parking position of the Eisenschwein, only valid if position_found is true
    geometry_msgs/Pose new_parking_position
    
    # information whether a potential parking position was found or not
    bool position_found
    
    
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
    const resolved = new parking_positionResponse(null);
    if (msg.new_parking_position !== undefined) {
      resolved.new_parking_position = geometry_msgs.msg.Pose.Resolve(msg.new_parking_position)
    }
    else {
      resolved.new_parking_position = new geometry_msgs.msg.Pose()
    }

    if (msg.position_found !== undefined) {
      resolved.position_found = msg.position_found;
    }
    else {
      resolved.position_found = false
    }

    return resolved;
    }
};

module.exports = {
  Request: parking_positionRequest,
  Response: parking_positionResponse,
  md5sum() { return '9cccc68cdb448b7a1440e1b408ee11bd'; },
  datatype() { return 'tug_navigation_tools/parking_position'; }
};
