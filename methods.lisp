;;;; methods.lisp
;;;; Copyright (c) 2011 Robert Smith

;;;; All of the "default" method implementations for built-in CL
;;;; operators/types.

;;;; NOTE: We use CL:FLOAT as the argument specifier instead of just
;;;; FLOAT because FLOAT is shadowed by :CL/GA. For consistency, we
;;;; use CL:<class> for the rest of the names as well, except T.

;;;; TODO:
;;;;  - Bit manipulation functions (BOOLE, logicals, ASH, etc)
;;;;  - Some of the integer functions (PARSE-INTEGER, INTEGER-LENGTH)
;;;;  ? Byte functions? (BYTE, BYTE-SIZE, BYTE-POSITION)
;;;;  - A few more float functions I think (FLOAT-foo)
;;;;  - NUMERATOR, DENOMINATOR
;;;;  ? UPGRADED-COMPLEX-PART-TYPE
;;;;  ? MAKE-RANDOM-STATE, RANDOM-STATE-P

(in-package :cl/ga)

(defmacro defun-folded (name binaryf
                        &key
                          (unary-function '#'identity)
                          (nullary-function nil nullary-function-p)
                          (initial-value nil initial-value-p))
  `(defun ,name ,(if initial-value-p
                     `(&rest numbers)
                     `(number &rest numbers))
     ,(cond
        (initial-value-p
         `(cond
            ((null numbers) ,initial-value)
            ((null (cdr numbers)) (funcall ,unary-function (car numbers)))
            (t (reduce ,binaryf numbers :initial-value ,initial-value))))
        
        (nullary-function-p
         `(if (null numbers)
              (funcall ,unary-function number)
              (reduce ,binaryf (cons number numbers)
                      :initial-value (funcall ,nullary-function number))))
        
        (t `(if (null numbers)
                (funcall ,unary-function number)
                (reduce ,binaryf numbers :initial-value number))))))

(defmethod nullary-+ ((type cl:number))
  0)

(defmethod unary-+ ((x cl:number))
  (cl:+ x))

(defmethod binary-+ ((x cl:number) (y cl:number))
  (cl:+ x y))

;;; derived
(defun-folded + #'binary-+
  :unary-function #'unary-+
  :nullary-function #'nullary-+)

(defmethod unary-- ((x cl:number))
  (cl:- x))

(defmethod binary-- ((x cl:number) (y cl:number))
  (cl:- x y))

;;; derived
(defun-folded - #'binary--
  :unary-function #'unary--)

(defmethod nullary-* ((type cl:number))
  1)

(defmethod unary-* ((x cl:number))
  (cl:* x))

(defmethod binary-* ((x cl:number) (y cl:number))
  (cl:* x y))

;;; derived
(defun-folded * #'binary-*
  :unary-function #'unary-*
  :nullary-function #'nullary-*)

(defmethod unary-/ ((y cl:number))
  (cl:/ y))

(defmethod binary-/ ((x cl:number) (y cl:number))
  (cl:/ x y))

;;; derived
(defun-folded / #'binary-/
  :unary-function #'unary-/)

;;; not derived, since 1+ is naturally synonymous to "successor"
(defmethod 1+ ((n cl:number))
  (cl:1+ n))

;;; not derived, since 1- is naturally synonymous to "predecessor"
(defmethod 1- ((n cl:number))
  (cl:1- n))

;;; XXX FIXME: The following two macros are problematic because PLACE
;;; would be evaluated more then once in the event it's a macro. However,
;;; 
;;;   (define-modify-macro incf (&optional (y 1)) +)
;;; 
;;; would force the use of the INTEGER class 1 as the second argument
;;; to the macro, which is problematic for typical usage.

;;; derived
(defmacro incf (place &optional (delta-form nil delta-p))
  (if delta-p
      `(setf ,place (+ ,place ,delta-form))
      `(setf ,place (1+ ,place))))

;;; derived
(defmacro decf (place &optional (delta-form nil delta-p))
  (if delta-p
      `(setf ,place (- ,place ,delta-form))
      `(setf ,place (1- ,place))))

;;; XXX: We can make these derived if we are able to talk about zero
;;; and unit elements of a domain
(defmethod zerop ((n cl:number))
  (cl:zerop n))

(defmethod plusp ((n cl:number))
  (cl:plusp n))

(defmethod minusp ((n cl:number))
  (cl:minusp n))

(defmethod evenp ((n cl:number))
  (cl:evenp n))

(defmethod oddp ((n cl:number))
  (cl:oddp n))

(defmethod abs ((n cl:number))
  (cl:abs n))

(defmethod sqrt ((n cl:number))
  (cl:sqrt n))

(defmethod isqrt ((n cl:number))
  (cl:isqrt n))

(defmethod unary-lcm ((x cl:integer))
  (cl:lcm x))

(defmethod binary-lcm ((x cl:integer) (y cl:integer))
  (cl:lcm x y))

;; derived
(defun-folded lcm #'binary-lcm
  :unary-function #'unary-lcm
  ;; FIXME: Dangerous to assume 1...
  :initial-value 1)

(defmethod unary-gcd ((x cl:integer))
  (cl:gcd x))

(defmethod binary-gcd ((x cl:integer) (y cl:integer))
  (cl:gcd x y))

;; derived
(defun-folded gcd #'binary-gcd
  :unary-function #'unary-gcd
  ;; FIXME: Dangerous to assume 0...
  :initial-value 0)

(defmethod log ((n cl:number) &optional (base nil base-p))
  ;; Can we specialize BASE?
  (if base-p
      (cl:log n base)
      (cl:log n)))

(defmethod exp ((n cl:number))
  (cl:exp n))

(defmethod sin ((n cl:number))
  (cl:sin n))

(defmethod cos ((n cl:number))
  (cl:cos n))

(defmethod tan ((n cl:number))
  (cl:tan n))

(defmethod asin ((n cl:number))
  (cl:asin n))

(defmethod acos ((n cl:number))
  (cl:acos n))

(defmethod atan ((y cl:number) &optional (x nil xp))
  (if xp (cl:atan y x) (cl:atan y)))

(defmethod sinh ((n cl:number))
  (cl:sinh n))

(defmethod cosh ((n cl:number))
  (cl:cosh n))

(defmethod tanh ((n cl:number))
  (cl:tanh n))

(defmethod asinh ((n cl:number))
  (cl:asinh n))

(defmethod acosh ((n cl:number))
  (cl:acosh n))

(defmethod atanh ((n cl:number))
  (cl:atanh n))

(defmethod expt ((base cl:number) (power cl:number))
  (cl:expt base power))

(defmethod mod ((n cl:number) (d cl:number))
  (cl:mod n d))

(defmethod rem ((n cl:number) (d cl:number))
  (cl:rem n d))

(defmethod binary-= ((n1 cl:number) (n2 cl:number))
  (cl:= n1 n2))

;;; derived
;; XXX: Should this *always* be true for one argument? How about if it
;; was overloaded with NaN? Should we have a UNARY-= ?
(defun-folded = #'binary-=
  :unary-function (constantly t))

(defmethod binary-/= ((n1 cl:number) (n2 cl:number))
  (cl:/= n1 n2))

;;; derived
(defun-folded /= #'binary-/=
  :unary-function (constantly t))

(defmethod binary-< ((n1 cl:number) (n2 cl:number))
  (cl:< n1 n2))

;;; derived
(defun-folded < #'binary-<
  :unary-function (constantly t))

(defmethod binary-> ((n1 cl:number) (n2 cl:number))
  (cl:> n1 n2))

;;; derived
(defun-folded > #'binary->
  :unary-function (constantly t))

(defmethod binary-<= ((n1 cl:number) (n2 cl:number))
  (cl:<= n1 n2))

;;; derived
(defun-folded <= #'binary-<=
  :unary-function (constantly t))

(defmethod binary->= ((n1 cl:number) (n2 cl:number))
  (cl:>= n1 n2))

;;; derived
(defun-folded >= #'binary->=
  :unary-function (constantly t))

(defmethod complex ((realpart cl:real) &optional (imagpart 0))
  (cl:complex realpart imagpart))

(defmethod integer-decode-float ((f cl:float))
  (cl:integer-decode-float f))

(defmethod decode-float ((f cl:float))
  (cl:decode-float f))

(defmethod scale-float ((f cl:float) (ex cl:integer))
  (cl:scale-float f ex))

(defmethod float-sign ((float1 cl:float) &optional (float2 (float 1 float1)))
  (cl:float-sign float1 float2))

(defmethod float-digits ((f cl:float))
  (cl:float-digits f))

(defmethod float ((n cl:real) &optional (other nil otherp))
  (if otherp ; in CL:FLOAT, does otherp matter?
      (cl:float n other)
      (cl:float n)))

(defmethod floor ((n cl:real) &optional (divisor 1))
  (cl:floor n divisor))

(defmethod ffloor ((n cl:real) &optional (divisor 1))
  (cl:ffloor n divisor))

(defmethod ceiling ((n cl:real) &optional (divisor 1))
  (cl:ceiling n divisor))

(defmethod fceiling ((n cl:real) &optional (divisor 1))
  (cl:fceiling n divisor))

(defmethod truncate ((n cl:real) &optional (divisor 1))
  (cl:truncate n divisor))

(defmethod ftruncate ((n cl:real) &optional (divisor 1))
  (cl:ftruncate n divisor))

(defmethod round ((n cl:real) &optional (divisor 1))
  (cl:round n divisor))

(defmethod fround ((n cl:real) &optional (divisor 1))
  (cl:fround n divisor))

(defmethod realpart ((n cl:number))
  (cl:realpart n))

(defmethod imagpart ((n cl:number))
  (cl:imagpart n))

(defmethod conjugate ((n cl:number))
  (cl:conjugate n))

;;; derived
(defun-folded max #'(lambda (x y) (if (> x y) x y)))

;;; derived
(defun-folded min #'(lambda (x y) (if (> x y) x y)))

;;; default
(defmethod cis ((theta t))
  (let ((cosine (cos theta))
        (sine   (sin theta)))
    (sqrt (+ (* sine sine)
             (* cosine cosine)))))

(defmethod cis ((theta real))
  (cl:cis theta))

(defmethod phase ((n cl:number))
  (cl:phase n))

(defmethod signum ((n cl:number))
  (cl:signum n))

;; CLHS says OBJ must be an object, OUTPUT-TYPE-SPEC a type
;; specifier. Can we specify the types of these arguments more
;; specifically?
(defmethod coerce ((obj t) (output-type-spec t))
  (cl:coerce obj output-type-spec))

;; ARG must be INTEGER or FLOAT, per CLHS
(defmethod random ((arg cl:integer) &optional (state *random-state*))
  (cl:random arg state))

;; ARG must be INTEGER or FLOAT, per CLHS
(defmethod random ((arg cl:float) &optional (state *random-state*))
  (cl:random arg state))

(defmethod integerp ((object t))
  (cl:integerp object))

(defmethod rationalp ((object t))
  (cl:rationalp object))

(defmethod realp ((object t))
  (cl:realp object))

(defmethod floatp ((object t))
  (cl:floatp object))

(defmethod complexp ((object t))
  (cl:complexp object))

(defmethod numberp ((object t))
  (cl:numberp object))

(defmethod rational ((x cl:real))
  (cl:rational x))

(defmethod rationalize ((x cl:real))
  (cl:rationalize x))
