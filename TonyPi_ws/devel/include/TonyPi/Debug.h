// Generated by gencpp from file TonyPi/Debug.msg
// DO NOT EDIT!


#ifndef TONYPI_MESSAGE_DEBUG_H
#define TONYPI_MESSAGE_DEBUG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace TonyPi
{
template <class ContainerAllocator>
struct Debug_
{
  typedef Debug_<ContainerAllocator> Type;

  Debug_()
    : header()
    , offset()
    , states()
    , pos()
    , target1()
    , target2()
    , target3()
    , target4()
    , target5()
    , target6()
    , target7()
    , target8()
    , target9()
    , target10()
    , IsInPosition()
    , currentLine(0)  {
      offset.assign(0.0);

      states.assign(0.0);

      pos.assign(0.0);

      target1.assign(0);

      target2.assign(0);

      target3.assign(0);

      target4.assign(0);

      target5.assign(0);

      target6.assign(0);

      target7.assign(0);

      target8.assign(0);

      target9.assign(0);

      target10.assign(0);
  }
  Debug_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , offset()
    , states()
    , pos()
    , target1()
    , target2()
    , target3()
    , target4()
    , target5()
    , target6()
    , target7()
    , target8()
    , target9()
    , target10()
    , IsInPosition(_alloc)
    , currentLine(0)  {
  (void)_alloc;
      offset.assign(0.0);

      states.assign(0.0);

      pos.assign(0.0);

      target1.assign(0);

      target2.assign(0);

      target3.assign(0);

      target4.assign(0);

      target5.assign(0);

      target6.assign(0);

      target7.assign(0);

      target8.assign(0);

      target9.assign(0);

      target10.assign(0);
  }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef boost::array<float, 10>  _offset_type;
  _offset_type offset;

   typedef boost::array<float, 10>  _states_type;
  _states_type states;

   typedef boost::array<float, 10>  _pos_type;
  _pos_type pos;

   typedef boost::array<int64_t, 10>  _target1_type;
  _target1_type target1;

   typedef boost::array<int64_t, 10>  _target2_type;
  _target2_type target2;

   typedef boost::array<int64_t, 10>  _target3_type;
  _target3_type target3;

   typedef boost::array<int64_t, 10>  _target4_type;
  _target4_type target4;

   typedef boost::array<int64_t, 10>  _target5_type;
  _target5_type target5;

   typedef boost::array<int64_t, 10>  _target6_type;
  _target6_type target6;

   typedef boost::array<int64_t, 10>  _target7_type;
  _target7_type target7;

   typedef boost::array<int64_t, 10>  _target8_type;
  _target8_type target8;

   typedef boost::array<int64_t, 10>  _target9_type;
  _target9_type target9;

   typedef boost::array<int64_t, 10>  _target10_type;
  _target10_type target10;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _IsInPosition_type;
  _IsInPosition_type IsInPosition;

   typedef int64_t _currentLine_type;
  _currentLine_type currentLine;





  typedef boost::shared_ptr< ::TonyPi::Debug_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::TonyPi::Debug_<ContainerAllocator> const> ConstPtr;

}; // struct Debug_

typedef ::TonyPi::Debug_<std::allocator<void> > Debug;

typedef boost::shared_ptr< ::TonyPi::Debug > DebugPtr;
typedef boost::shared_ptr< ::TonyPi::Debug const> DebugConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::TonyPi::Debug_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::TonyPi::Debug_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::TonyPi::Debug_<ContainerAllocator1> & lhs, const ::TonyPi::Debug_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.offset == rhs.offset &&
    lhs.states == rhs.states &&
    lhs.pos == rhs.pos &&
    lhs.target1 == rhs.target1 &&
    lhs.target2 == rhs.target2 &&
    lhs.target3 == rhs.target3 &&
    lhs.target4 == rhs.target4 &&
    lhs.target5 == rhs.target5 &&
    lhs.target6 == rhs.target6 &&
    lhs.target7 == rhs.target7 &&
    lhs.target8 == rhs.target8 &&
    lhs.target9 == rhs.target9 &&
    lhs.target10 == rhs.target10 &&
    lhs.IsInPosition == rhs.IsInPosition &&
    lhs.currentLine == rhs.currentLine;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::TonyPi::Debug_<ContainerAllocator1> & lhs, const ::TonyPi::Debug_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace TonyPi

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::TonyPi::Debug_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::TonyPi::Debug_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::TonyPi::Debug_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::TonyPi::Debug_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::TonyPi::Debug_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::TonyPi::Debug_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::TonyPi::Debug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1f9d5ddd258f9002ec426a81913f3ad7";
  }

  static const char* value(const ::TonyPi::Debug_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1f9d5ddd258f9002ULL;
  static const uint64_t static_value2 = 0xec426a81913f3ad7ULL;
};

template<class ContainerAllocator>
struct DataType< ::TonyPi::Debug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "TonyPi/Debug";
  }

  static const char* value(const ::TonyPi::Debug_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::TonyPi::Debug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"float32[10] offset\n"
"float32[10] states\n"
"float32[10] pos\n"
"int64[10] target1\n"
"int64[10] target2\n"
"int64[10] target3\n"
"int64[10] target4\n"
"int64[10] target5\n"
"int64[10] target6\n"
"int64[10] target7\n"
"int64[10] target8\n"
"int64[10] target9\n"
"int64[10] target10\n"
"string IsInPosition\n"
"int64 currentLine\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::TonyPi::Debug_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::TonyPi::Debug_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.offset);
      stream.next(m.states);
      stream.next(m.pos);
      stream.next(m.target1);
      stream.next(m.target2);
      stream.next(m.target3);
      stream.next(m.target4);
      stream.next(m.target5);
      stream.next(m.target6);
      stream.next(m.target7);
      stream.next(m.target8);
      stream.next(m.target9);
      stream.next(m.target10);
      stream.next(m.IsInPosition);
      stream.next(m.currentLine);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Debug_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::TonyPi::Debug_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::TonyPi::Debug_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "offset[]" << std::endl;
    for (size_t i = 0; i < v.offset.size(); ++i)
    {
      s << indent << "  offset[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.offset[i]);
    }
    s << indent << "states[]" << std::endl;
    for (size_t i = 0; i < v.states.size(); ++i)
    {
      s << indent << "  states[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.states[i]);
    }
    s << indent << "pos[]" << std::endl;
    for (size_t i = 0; i < v.pos.size(); ++i)
    {
      s << indent << "  pos[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.pos[i]);
    }
    s << indent << "target1[]" << std::endl;
    for (size_t i = 0; i < v.target1.size(); ++i)
    {
      s << indent << "  target1[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target1[i]);
    }
    s << indent << "target2[]" << std::endl;
    for (size_t i = 0; i < v.target2.size(); ++i)
    {
      s << indent << "  target2[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target2[i]);
    }
    s << indent << "target3[]" << std::endl;
    for (size_t i = 0; i < v.target3.size(); ++i)
    {
      s << indent << "  target3[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target3[i]);
    }
    s << indent << "target4[]" << std::endl;
    for (size_t i = 0; i < v.target4.size(); ++i)
    {
      s << indent << "  target4[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target4[i]);
    }
    s << indent << "target5[]" << std::endl;
    for (size_t i = 0; i < v.target5.size(); ++i)
    {
      s << indent << "  target5[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target5[i]);
    }
    s << indent << "target6[]" << std::endl;
    for (size_t i = 0; i < v.target6.size(); ++i)
    {
      s << indent << "  target6[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target6[i]);
    }
    s << indent << "target7[]" << std::endl;
    for (size_t i = 0; i < v.target7.size(); ++i)
    {
      s << indent << "  target7[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target7[i]);
    }
    s << indent << "target8[]" << std::endl;
    for (size_t i = 0; i < v.target8.size(); ++i)
    {
      s << indent << "  target8[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target8[i]);
    }
    s << indent << "target9[]" << std::endl;
    for (size_t i = 0; i < v.target9.size(); ++i)
    {
      s << indent << "  target9[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target9[i]);
    }
    s << indent << "target10[]" << std::endl;
    for (size_t i = 0; i < v.target10.size(); ++i)
    {
      s << indent << "  target10[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.target10[i]);
    }
    s << indent << "IsInPosition: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.IsInPosition);
    s << indent << "currentLine: ";
    Printer<int64_t>::stream(s, indent + "  ", v.currentLine);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TONYPI_MESSAGE_DEBUG_H