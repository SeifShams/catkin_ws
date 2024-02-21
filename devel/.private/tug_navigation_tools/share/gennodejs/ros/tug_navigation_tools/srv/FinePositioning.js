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


//-----------------------------------------------------------

class FinePositioningRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.wall_position = null;
      this.goal_distance = null;
      this.initial_distance = null;
    }
    else {
      if (initObj.hasOwnProperty('wall_position')) {
        this.wall_position = initObj.wall_position
      }
      else {
        this.wall_position = 0;
      }
      if (initObj.hasOwnProperty('goal_distance')) {
        this.goal_distance = initObj.goal_distance
      }
      else {
        this.goal_distance = 0.0;
      }
      if (initObj.hasOwnProperty('initial_distance')) {
        this.initial_distance = initObj.initial_distance
      }
      else {
        this.initial_distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FinePositioningRequest
    // Serialize message field [wall_position]
    bufferOffset = _serializer.int64(obj.wall_position, buffer, bufferOffset);
    // Serialize message field [goal_distance]
    bufferOffset = _serializer.float64(obj.goal_distance, buffer, bufferOffset);
    // Serialize message field [initial_distance]
    bufferOffset = _serializer.float64(obj.initial_distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FinePositioningRequest
    let len;
    let data = new FinePositioningRequest(null);
    // Deserialize message field [wall_position]
    data.wall_position = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [goal_distance]
    data.goal_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [initial_distance]
    data.initial_distance = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/FinePositioningRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '54d2ff4bee42cc5981d182691496ff5b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # indicator on which side of the Eisenschwein the wall is positioned: 1 = starboard; -1 = port 
    int64 wall_position
    
    # distance between border of table and Eisenschwein
    float64 goal_distance
    float64 initial_distance
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FinePositioningRequest(null);
    if (msg.wall_position !== undefined) {
      resolved.wall_position = msg.wall_position;
    }
    else {
      resolved.wall_position = 0
    }

    if (msg.goal_distance !== undefined) {
      resolved.goal_distance = msg.goal_distance;
    }
    else {
      resolved.goal_distance = 0.0
    }

    if (msg.initial_distance !== undefined) {
      resolved.initial_distance = msg.initial_distance;
    }
    else {
      resolved.initial_distance = 0.0
    }

    return resolved;
    }
};

class FinePositioningResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reached = null;
    }
    else {
      if (initObj.hasOwnProperty('reached')) {
        this.reached = initObj.reached
      }
      else {
        this.reached = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FinePositioningResponse
    // Serialize message field [reached]
    bufferOffset = _serializer.bool(obj.reached, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FinePositioningResponse
    let len;
    let data = new FinePositioningResponse(null);
    // Deserialize message field [reached]
    data.reached = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/FinePositioningResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '80204a6ff2622a7071680d5597cbd3aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # returns whether position was reached successfully
    bool reached
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FinePositioningResponse(null);
    if (msg.reached !== undefined) {
      resolved.reached = msg.reached;
    }
    else {
      resolved.reached = false
    }

    return resolved;
    }
};

module.exports = {
  Request: FinePositioningRequest,
  Response: FinePositioningResponse,
  md5sum() { return '171c107e3dd8cdfa8ae691b15d06b1d1'; },
  datatype() { return 'tug_navigation_tools/FinePositioning'; }
};
