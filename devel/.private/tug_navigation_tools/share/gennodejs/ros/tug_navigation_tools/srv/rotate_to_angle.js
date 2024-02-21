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

class rotate_to_angleRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.desired_phi = null;
    }
    else {
      if (initObj.hasOwnProperty('desired_phi')) {
        this.desired_phi = initObj.desired_phi
      }
      else {
        this.desired_phi = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rotate_to_angleRequest
    // Serialize message field [desired_phi]
    bufferOffset = _serializer.float64(obj.desired_phi, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rotate_to_angleRequest
    let len;
    let data = new rotate_to_angleRequest(null);
    // Deserialize message field [desired_phi]
    data.desired_phi = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/rotate_to_angleRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e0dbfda91b67897009c61f944e40620f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 desired_phi
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rotate_to_angleRequest(null);
    if (msg.desired_phi !== undefined) {
      resolved.desired_phi = msg.desired_phi;
    }
    else {
      resolved.desired_phi = 0.0
    }

    return resolved;
    }
};

class rotate_to_angleResponse {
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
    // Serializes a message object of type rotate_to_angleResponse
    // Serialize message field [reached]
    bufferOffset = _serializer.bool(obj.reached, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rotate_to_angleResponse
    let len;
    let data = new rotate_to_angleResponse(null);
    // Deserialize message field [reached]
    data.reached = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/rotate_to_angleResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '80204a6ff2622a7071680d5597cbd3aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool reached
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rotate_to_angleResponse(null);
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
  Request: rotate_to_angleRequest,
  Response: rotate_to_angleResponse,
  md5sum() { return 'bd2782be2069801f5722cbaf3da80be1'; },
  datatype() { return 'tug_navigation_tools/rotate_to_angle'; }
};
