// Auto-generated. Do not edit!

// (in-package tug_navigation_tools.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class AccelerationStamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.acceleration = null;
      this.time_steps = null;
      this.velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('acceleration')) {
        this.acceleration = initObj.acceleration
      }
      else {
        this.acceleration = [];
      }
      if (initObj.hasOwnProperty('time_steps')) {
        this.time_steps = initObj.time_steps
      }
      else {
        this.time_steps = [];
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AccelerationStamped
    // Serialize message field [acceleration]
    bufferOffset = _arraySerializer.float64(obj.acceleration, buffer, bufferOffset, null);
    // Serialize message field [time_steps]
    bufferOffset = _arraySerializer.float64(obj.time_steps, buffer, bufferOffset, null);
    // Serialize message field [velocity]
    bufferOffset = _arraySerializer.float64(obj.velocity, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AccelerationStamped
    let len;
    let data = new AccelerationStamped(null);
    // Deserialize message field [acceleration]
    data.acceleration = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [time_steps]
    data.time_steps = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [velocity]
    data.velocity = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.acceleration.length;
    length += 8 * object.time_steps.length;
    length += 8 * object.velocity.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tug_navigation_tools/AccelerationStamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd18a36833bccd99a0ea7160cc1ef0909';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] acceleration
    float64[] time_steps
    float64[] velocity
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AccelerationStamped(null);
    if (msg.acceleration !== undefined) {
      resolved.acceleration = msg.acceleration;
    }
    else {
      resolved.acceleration = []
    }

    if (msg.time_steps !== undefined) {
      resolved.time_steps = msg.time_steps;
    }
    else {
      resolved.time_steps = []
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = []
    }

    return resolved;
    }
};

module.exports = AccelerationStamped;
