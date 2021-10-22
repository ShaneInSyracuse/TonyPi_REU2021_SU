// Auto-generated. Do not edit!

// (in-package TonyPi.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Debug {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.offset = null;
      this.states = null;
      this.pos = null;
      this.target1 = null;
      this.target2 = null;
      this.target3 = null;
      this.target4 = null;
      this.target5 = null;
      this.target6 = null;
      this.target7 = null;
      this.target8 = null;
      this.target9 = null;
      this.target10 = null;
      this.IsInPosition = null;
      this.currentLine = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('offset')) {
        this.offset = initObj.offset
      }
      else {
        this.offset = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('states')) {
        this.states = initObj.states
      }
      else {
        this.states = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target1')) {
        this.target1 = initObj.target1
      }
      else {
        this.target1 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target2')) {
        this.target2 = initObj.target2
      }
      else {
        this.target2 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target3')) {
        this.target3 = initObj.target3
      }
      else {
        this.target3 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target4')) {
        this.target4 = initObj.target4
      }
      else {
        this.target4 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target5')) {
        this.target5 = initObj.target5
      }
      else {
        this.target5 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target6')) {
        this.target6 = initObj.target6
      }
      else {
        this.target6 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target7')) {
        this.target7 = initObj.target7
      }
      else {
        this.target7 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target8')) {
        this.target8 = initObj.target8
      }
      else {
        this.target8 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target9')) {
        this.target9 = initObj.target9
      }
      else {
        this.target9 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('target10')) {
        this.target10 = initObj.target10
      }
      else {
        this.target10 = new Array(10).fill(0);
      }
      if (initObj.hasOwnProperty('IsInPosition')) {
        this.IsInPosition = initObj.IsInPosition
      }
      else {
        this.IsInPosition = '';
      }
      if (initObj.hasOwnProperty('currentLine')) {
        this.currentLine = initObj.currentLine
      }
      else {
        this.currentLine = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Debug
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Check that the constant length array field [offset] has the right length
    if (obj.offset.length !== 10) {
      throw new Error('Unable to serialize array field offset - length must be 10')
    }
    // Serialize message field [offset]
    bufferOffset = _arraySerializer.float32(obj.offset, buffer, bufferOffset, 10);
    // Check that the constant length array field [states] has the right length
    if (obj.states.length !== 10) {
      throw new Error('Unable to serialize array field states - length must be 10')
    }
    // Serialize message field [states]
    bufferOffset = _arraySerializer.float32(obj.states, buffer, bufferOffset, 10);
    // Check that the constant length array field [pos] has the right length
    if (obj.pos.length !== 10) {
      throw new Error('Unable to serialize array field pos - length must be 10')
    }
    // Serialize message field [pos]
    bufferOffset = _arraySerializer.float32(obj.pos, buffer, bufferOffset, 10);
    // Check that the constant length array field [target1] has the right length
    if (obj.target1.length !== 10) {
      throw new Error('Unable to serialize array field target1 - length must be 10')
    }
    // Serialize message field [target1]
    bufferOffset = _arraySerializer.int64(obj.target1, buffer, bufferOffset, 10);
    // Check that the constant length array field [target2] has the right length
    if (obj.target2.length !== 10) {
      throw new Error('Unable to serialize array field target2 - length must be 10')
    }
    // Serialize message field [target2]
    bufferOffset = _arraySerializer.int64(obj.target2, buffer, bufferOffset, 10);
    // Check that the constant length array field [target3] has the right length
    if (obj.target3.length !== 10) {
      throw new Error('Unable to serialize array field target3 - length must be 10')
    }
    // Serialize message field [target3]
    bufferOffset = _arraySerializer.int64(obj.target3, buffer, bufferOffset, 10);
    // Check that the constant length array field [target4] has the right length
    if (obj.target4.length !== 10) {
      throw new Error('Unable to serialize array field target4 - length must be 10')
    }
    // Serialize message field [target4]
    bufferOffset = _arraySerializer.int64(obj.target4, buffer, bufferOffset, 10);
    // Check that the constant length array field [target5] has the right length
    if (obj.target5.length !== 10) {
      throw new Error('Unable to serialize array field target5 - length must be 10')
    }
    // Serialize message field [target5]
    bufferOffset = _arraySerializer.int64(obj.target5, buffer, bufferOffset, 10);
    // Check that the constant length array field [target6] has the right length
    if (obj.target6.length !== 10) {
      throw new Error('Unable to serialize array field target6 - length must be 10')
    }
    // Serialize message field [target6]
    bufferOffset = _arraySerializer.int64(obj.target6, buffer, bufferOffset, 10);
    // Check that the constant length array field [target7] has the right length
    if (obj.target7.length !== 10) {
      throw new Error('Unable to serialize array field target7 - length must be 10')
    }
    // Serialize message field [target7]
    bufferOffset = _arraySerializer.int64(obj.target7, buffer, bufferOffset, 10);
    // Check that the constant length array field [target8] has the right length
    if (obj.target8.length !== 10) {
      throw new Error('Unable to serialize array field target8 - length must be 10')
    }
    // Serialize message field [target8]
    bufferOffset = _arraySerializer.int64(obj.target8, buffer, bufferOffset, 10);
    // Check that the constant length array field [target9] has the right length
    if (obj.target9.length !== 10) {
      throw new Error('Unable to serialize array field target9 - length must be 10')
    }
    // Serialize message field [target9]
    bufferOffset = _arraySerializer.int64(obj.target9, buffer, bufferOffset, 10);
    // Check that the constant length array field [target10] has the right length
    if (obj.target10.length !== 10) {
      throw new Error('Unable to serialize array field target10 - length must be 10')
    }
    // Serialize message field [target10]
    bufferOffset = _arraySerializer.int64(obj.target10, buffer, bufferOffset, 10);
    // Serialize message field [IsInPosition]
    bufferOffset = _serializer.string(obj.IsInPosition, buffer, bufferOffset);
    // Serialize message field [currentLine]
    bufferOffset = _serializer.int64(obj.currentLine, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Debug
    let len;
    let data = new Debug(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [offset]
    data.offset = _arrayDeserializer.float32(buffer, bufferOffset, 10)
    // Deserialize message field [states]
    data.states = _arrayDeserializer.float32(buffer, bufferOffset, 10)
    // Deserialize message field [pos]
    data.pos = _arrayDeserializer.float32(buffer, bufferOffset, 10)
    // Deserialize message field [target1]
    data.target1 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [target2]
    data.target2 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [target3]
    data.target3 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [target4]
    data.target4 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [target5]
    data.target5 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [target6]
    data.target6 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [target7]
    data.target7 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [target8]
    data.target8 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [target9]
    data.target9 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [target10]
    data.target10 = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    // Deserialize message field [IsInPosition]
    data.IsInPosition = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [currentLine]
    data.currentLine = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.IsInPosition);
    return length + 932;
  }

  static datatype() {
    // Returns string type for a message object
    return 'TonyPi/Debug';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1f9d5ddd258f9002ec426a81913f3ad7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32[10] offset
    float32[10] states
    float32[10] pos
    int64[10] target1
    int64[10] target2
    int64[10] target3
    int64[10] target4
    int64[10] target5
    int64[10] target6
    int64[10] target7
    int64[10] target8
    int64[10] target9
    int64[10] target10
    string IsInPosition
    int64 currentLine
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Debug(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.offset !== undefined) {
      resolved.offset = msg.offset;
    }
    else {
      resolved.offset = new Array(10).fill(0)
    }

    if (msg.states !== undefined) {
      resolved.states = msg.states;
    }
    else {
      resolved.states = new Array(10).fill(0)
    }

    if (msg.pos !== undefined) {
      resolved.pos = msg.pos;
    }
    else {
      resolved.pos = new Array(10).fill(0)
    }

    if (msg.target1 !== undefined) {
      resolved.target1 = msg.target1;
    }
    else {
      resolved.target1 = new Array(10).fill(0)
    }

    if (msg.target2 !== undefined) {
      resolved.target2 = msg.target2;
    }
    else {
      resolved.target2 = new Array(10).fill(0)
    }

    if (msg.target3 !== undefined) {
      resolved.target3 = msg.target3;
    }
    else {
      resolved.target3 = new Array(10).fill(0)
    }

    if (msg.target4 !== undefined) {
      resolved.target4 = msg.target4;
    }
    else {
      resolved.target4 = new Array(10).fill(0)
    }

    if (msg.target5 !== undefined) {
      resolved.target5 = msg.target5;
    }
    else {
      resolved.target5 = new Array(10).fill(0)
    }

    if (msg.target6 !== undefined) {
      resolved.target6 = msg.target6;
    }
    else {
      resolved.target6 = new Array(10).fill(0)
    }

    if (msg.target7 !== undefined) {
      resolved.target7 = msg.target7;
    }
    else {
      resolved.target7 = new Array(10).fill(0)
    }

    if (msg.target8 !== undefined) {
      resolved.target8 = msg.target8;
    }
    else {
      resolved.target8 = new Array(10).fill(0)
    }

    if (msg.target9 !== undefined) {
      resolved.target9 = msg.target9;
    }
    else {
      resolved.target9 = new Array(10).fill(0)
    }

    if (msg.target10 !== undefined) {
      resolved.target10 = msg.target10;
    }
    else {
      resolved.target10 = new Array(10).fill(0)
    }

    if (msg.IsInPosition !== undefined) {
      resolved.IsInPosition = msg.IsInPosition;
    }
    else {
      resolved.IsInPosition = ''
    }

    if (msg.currentLine !== undefined) {
      resolved.currentLine = msg.currentLine;
    }
    else {
      resolved.currentLine = 0
    }

    return resolved;
    }
};

module.exports = Debug;
