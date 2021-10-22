;; Auto-generated. Do not edit!


(when (boundp 'TonyPi::Debug)
  (if (not (find-package "TONYPI"))
    (make-package "TONYPI"))
  (shadow 'Debug (find-package "TONYPI")))
(unless (find-package "TONYPI::DEBUG")
  (make-package "TONYPI::DEBUG"))

(in-package "ROS")
;;//! \htmlinclude Debug.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass TonyPi::Debug
  :super ros::object
  :slots (_header _offset _states _pos _target1 _target2 _target3 _target4 _target5 _target6 _target7 _target8 _target9 _target10 _IsInPosition _currentLine ))

(defmethod TonyPi::Debug
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:offset __offset) (make-array 10 :initial-element 0.0 :element-type :float))
    ((:states __states) (make-array 10 :initial-element 0.0 :element-type :float))
    ((:pos __pos) (make-array 10 :initial-element 0.0 :element-type :float))
    ((:target1 __target1) (make-array 10 :initial-element 0 :element-type :integer))
    ((:target2 __target2) (make-array 10 :initial-element 0 :element-type :integer))
    ((:target3 __target3) (make-array 10 :initial-element 0 :element-type :integer))
    ((:target4 __target4) (make-array 10 :initial-element 0 :element-type :integer))
    ((:target5 __target5) (make-array 10 :initial-element 0 :element-type :integer))
    ((:target6 __target6) (make-array 10 :initial-element 0 :element-type :integer))
    ((:target7 __target7) (make-array 10 :initial-element 0 :element-type :integer))
    ((:target8 __target8) (make-array 10 :initial-element 0 :element-type :integer))
    ((:target9 __target9) (make-array 10 :initial-element 0 :element-type :integer))
    ((:target10 __target10) (make-array 10 :initial-element 0 :element-type :integer))
    ((:IsInPosition __IsInPosition) "")
    ((:currentLine __currentLine) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _offset __offset)
   (setq _states __states)
   (setq _pos __pos)
   (setq _target1 __target1)
   (setq _target2 __target2)
   (setq _target3 __target3)
   (setq _target4 __target4)
   (setq _target5 __target5)
   (setq _target6 __target6)
   (setq _target7 __target7)
   (setq _target8 __target8)
   (setq _target9 __target9)
   (setq _target10 __target10)
   (setq _IsInPosition (string __IsInPosition))
   (setq _currentLine (round __currentLine))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:offset
   (&optional __offset)
   (if __offset (setq _offset __offset)) _offset)
  (:states
   (&optional __states)
   (if __states (setq _states __states)) _states)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:target1
   (&optional __target1)
   (if __target1 (setq _target1 __target1)) _target1)
  (:target2
   (&optional __target2)
   (if __target2 (setq _target2 __target2)) _target2)
  (:target3
   (&optional __target3)
   (if __target3 (setq _target3 __target3)) _target3)
  (:target4
   (&optional __target4)
   (if __target4 (setq _target4 __target4)) _target4)
  (:target5
   (&optional __target5)
   (if __target5 (setq _target5 __target5)) _target5)
  (:target6
   (&optional __target6)
   (if __target6 (setq _target6 __target6)) _target6)
  (:target7
   (&optional __target7)
   (if __target7 (setq _target7 __target7)) _target7)
  (:target8
   (&optional __target8)
   (if __target8 (setq _target8 __target8)) _target8)
  (:target9
   (&optional __target9)
   (if __target9 (setq _target9 __target9)) _target9)
  (:target10
   (&optional __target10)
   (if __target10 (setq _target10 __target10)) _target10)
  (:IsInPosition
   (&optional __IsInPosition)
   (if __IsInPosition (setq _IsInPosition __IsInPosition)) _IsInPosition)
  (:currentLine
   (&optional __currentLine)
   (if __currentLine (setq _currentLine __currentLine)) _currentLine)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[10] _offset
    (* 4    10)
    ;; float32[10] _states
    (* 4    10)
    ;; float32[10] _pos
    (* 4    10)
    ;; int64[10] _target1
    (* 8    10)
    ;; int64[10] _target2
    (* 8    10)
    ;; int64[10] _target3
    (* 8    10)
    ;; int64[10] _target4
    (* 8    10)
    ;; int64[10] _target5
    (* 8    10)
    ;; int64[10] _target6
    (* 8    10)
    ;; int64[10] _target7
    (* 8    10)
    ;; int64[10] _target8
    (* 8    10)
    ;; int64[10] _target9
    (* 8    10)
    ;; int64[10] _target10
    (* 8    10)
    ;; string _IsInPosition
    4 (length _IsInPosition)
    ;; int64 _currentLine
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[10] _offset
     (dotimes (i 10)
       (sys::poke (elt _offset i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[10] _states
     (dotimes (i 10)
       (sys::poke (elt _states i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[10] _pos
     (dotimes (i 10)
       (sys::poke (elt _pos i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int64[10] _target1
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target1 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target1 i)) (= (length ((elt _target1 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target1 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target1 i) . bv) 1) -1) s))
             ((and (class (elt _target1 i)) (= (length ((elt _target1 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target1 i) . bv) 0) s)
              (write-long (if (>= (elt _target1 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target1 i) s)(write-long (if (>= (elt _target1 i) 0) 0 #xffffffff) s)))
       )
     ;; int64[10] _target2
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target2 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target2 i)) (= (length ((elt _target2 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target2 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target2 i) . bv) 1) -1) s))
             ((and (class (elt _target2 i)) (= (length ((elt _target2 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target2 i) . bv) 0) s)
              (write-long (if (>= (elt _target2 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target2 i) s)(write-long (if (>= (elt _target2 i) 0) 0 #xffffffff) s)))
       )
     ;; int64[10] _target3
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target3 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target3 i)) (= (length ((elt _target3 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target3 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target3 i) . bv) 1) -1) s))
             ((and (class (elt _target3 i)) (= (length ((elt _target3 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target3 i) . bv) 0) s)
              (write-long (if (>= (elt _target3 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target3 i) s)(write-long (if (>= (elt _target3 i) 0) 0 #xffffffff) s)))
       )
     ;; int64[10] _target4
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target4 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target4 i)) (= (length ((elt _target4 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target4 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target4 i) . bv) 1) -1) s))
             ((and (class (elt _target4 i)) (= (length ((elt _target4 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target4 i) . bv) 0) s)
              (write-long (if (>= (elt _target4 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target4 i) s)(write-long (if (>= (elt _target4 i) 0) 0 #xffffffff) s)))
       )
     ;; int64[10] _target5
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target5 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target5 i)) (= (length ((elt _target5 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target5 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target5 i) . bv) 1) -1) s))
             ((and (class (elt _target5 i)) (= (length ((elt _target5 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target5 i) . bv) 0) s)
              (write-long (if (>= (elt _target5 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target5 i) s)(write-long (if (>= (elt _target5 i) 0) 0 #xffffffff) s)))
       )
     ;; int64[10] _target6
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target6 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target6 i)) (= (length ((elt _target6 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target6 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target6 i) . bv) 1) -1) s))
             ((and (class (elt _target6 i)) (= (length ((elt _target6 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target6 i) . bv) 0) s)
              (write-long (if (>= (elt _target6 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target6 i) s)(write-long (if (>= (elt _target6 i) 0) 0 #xffffffff) s)))
       )
     ;; int64[10] _target7
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target7 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target7 i)) (= (length ((elt _target7 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target7 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target7 i) . bv) 1) -1) s))
             ((and (class (elt _target7 i)) (= (length ((elt _target7 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target7 i) . bv) 0) s)
              (write-long (if (>= (elt _target7 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target7 i) s)(write-long (if (>= (elt _target7 i) 0) 0 #xffffffff) s)))
       )
     ;; int64[10] _target8
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target8 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target8 i)) (= (length ((elt _target8 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target8 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target8 i) . bv) 1) -1) s))
             ((and (class (elt _target8 i)) (= (length ((elt _target8 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target8 i) . bv) 0) s)
              (write-long (if (>= (elt _target8 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target8 i) s)(write-long (if (>= (elt _target8 i) 0) 0 #xffffffff) s)))
       )
     ;; int64[10] _target9
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target9 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target9 i)) (= (length ((elt _target9 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target9 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target9 i) . bv) 1) -1) s))
             ((and (class (elt _target9 i)) (= (length ((elt _target9 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target9 i) . bv) 0) s)
              (write-long (if (>= (elt _target9 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target9 i) s)(write-long (if (>= (elt _target9 i) 0) 0 #xffffffff) s)))
       )
     ;; int64[10] _target10
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _target10 i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _target10 i)) (= (length ((elt _target10 i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _target10 i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _target10 i) . bv) 1) -1) s))
             ((and (class (elt _target10 i)) (= (length ((elt _target10 i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _target10 i) . bv) 0) s)
              (write-long (if (>= (elt _target10 i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _target10 i) s)(write-long (if (>= (elt _target10 i) 0) 0 #xffffffff) s)))
       )
     ;; string _IsInPosition
       (write-long (length _IsInPosition) s) (princ _IsInPosition s)
     ;; int64 _currentLine
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _currentLine (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _currentLine) (= (length (_currentLine . bv)) 2)) ;; bignum
              (write-long (ash (elt (_currentLine . bv) 0) 0) s)
              (write-long (ash (elt (_currentLine . bv) 1) -1) s))
             ((and (class _currentLine) (= (length (_currentLine . bv)) 1)) ;; big1
              (write-long (elt (_currentLine . bv) 0) s)
              (write-long (if (>= _currentLine 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _currentLine s)(write-long (if (>= _currentLine 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[10] _offset
   (dotimes (i (length _offset))
     (setf (elt _offset i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[10] _states
   (dotimes (i (length _states))
     (setf (elt _states i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[10] _pos
   (dotimes (i (length _pos))
     (setf (elt _pos i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; int64[10] _target1
   (dotimes (i (length _target1))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target1 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target1 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; int64[10] _target2
   (dotimes (i (length _target2))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target2 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target2 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; int64[10] _target3
   (dotimes (i (length _target3))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target3 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target3 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; int64[10] _target4
   (dotimes (i (length _target4))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target4 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target4 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; int64[10] _target5
   (dotimes (i (length _target5))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target5 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target5 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; int64[10] _target6
   (dotimes (i (length _target6))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target6 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target6 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; int64[10] _target7
   (dotimes (i (length _target7))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target7 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target7 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; int64[10] _target8
   (dotimes (i (length _target8))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target8 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target8 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; int64[10] _target9
   (dotimes (i (length _target9))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target9 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target9 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; int64[10] _target10
   (dotimes (i (length _target10))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _target10 i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _target10 i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;; string _IsInPosition
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _IsInPosition (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _currentLine
#+(or :alpha :irix6 :x86_64)
      (setf _currentLine (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _currentLine (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get TonyPi::Debug :md5sum-) "1f9d5ddd258f9002ec426a81913f3ad7")
(setf (get TonyPi::Debug :datatype-) "TonyPi/Debug")
(setf (get TonyPi::Debug :definition-)
      "Header header
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

")



(provide :TonyPi/Debug "1f9d5ddd258f9002ec426a81913f3ad7")


