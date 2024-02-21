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

class translational_movementRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.back_and_forth = null;
      this.side_to_side = null;
    }
    else {
      if (initObj.hasOwnProperty('back_and_forth')) {
        this.back_and_forth = initObj.back_and_forth
      }
      else {
        this.back_and_forth = 0.0;
      }
      if (initObj.hasOwnProperty('side_to_side')) {
        this.side_to_side = initObj.side_to_side
      }
      else {
        this.side_to_side = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type translational_movementRequest
    // Serialize message field [back_and_forth]
    bufferOffset = _serializer.float64(obj.back_and_forth, buffer, bufferOffset);
    // Serialize message field [side_to_side]
    bufferOffset = _serializer.float64(obj.side_to_side, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type translational_movementRequest
    let len;
    let data = new translational_movementRequest(null);
    // Deserialize message field [back_and_forth]
    data.back_and_forth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [side_to_side]
    data.side_to_side = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/translational_movementRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '039a9ef5cf199afe113bc15928a75435';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 back_and_forth
    float64 side_to_side
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new translational_movementRequest(null);
    if (msg.back_and_forth !== undefined) {
      resolved.back_and_forth = msg.back_and_forth;
    }
    else {
      resolved.back_and_forth = 0.0
    }

    if (msg.side_to_side !== undefined) {
      resolved.side_to_side = msg.side_to_side;
    }
    else {
      resolved.side_to_side = 0.0
    }

    return resolved;
    }
};

class translational_movementResponse {
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
    // Serializes a message object of type translational_movementResponse
    // Serialize message field [reached]
    bufferOffset = _serializer.bool(obj.reached, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type translational_movementResponse
    let len;
    let data = new translational_movementResponse(null);
    // Deserialize message field [reached]
    data.reached = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tug_navigation_tools/translational_movementResponse';
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
    const resolved = new translational_movementResponse(null);
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
  Request: translational_movementRequest,
  Response: translational_movementResponse,
  md5sum() { return '0394d208a08b3715c1bf38023b0d4e4e'; },
  datatype() { return 'tug_navigation_tools/translational_movement'; }
};
