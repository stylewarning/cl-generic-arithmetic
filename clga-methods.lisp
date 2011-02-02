;;;; clga-methods.lisp
;;;; Copyright (c) 2011 Robert Smith

(in-package :cl/ga)

;;(defmethod + (&rest args))
(defmethod unary-+ (x))
(defmethod binary-+ (x y))

;;(defmethod - (&rest args))
(defmethod unary-- (x))
(defmethod binary-- (x y))

;;(defmethod * (&rest args))
(defmethod unary-* (x))
(defmethod binary-* (x y))

;;(defmethod / (&rest args))
(defmethod unary-/ (y))
(defmethod binary-/ (x y))

(defmethod 1+ (number))

(defmethod 1- (number))

(defmethod zerop (number))

(defmethod plusp (number))

(defmethod minusp (number))

(defmethod evenp (number))

(defmethod oddp (number))

(defmethod abs (number))

(defmethod sqrt (number))

(defmethod log (number &optional (base nil base-p)))

(defmethod exp (number))

(defmethod sin (number))

(defmethod cos (number))

(defmethod tan (number))

(defmethod asin (number))

(defmethod acos (number))

(defmethod atan (y &optional (x nil xp)))

(defmethod sinh (number))

(defmethod cosh (number))

(defmethod tanh (number))

(defmethod asinh (number))

(defmethod acosh (number))

(defmethod atanh (number))

(defmethod expt (base power))

(defmethod mod (number divisor))

(defmethod rem (number divisor))

;;(defmethod = (number &rest more-numbers))
(defmethod binary-= (number1 number2))

;;(defmethod /= (number &rest more-numbers))
(defmethod binary-/= (number1 number2))

;;(defmethod < (number &rest more-numbers))
(defmethod binary-< (number1 number2))

;;(defmethod > (number &rest more-numbers))
(defmethod binary-> (number1 number2))

;;(defmethod <= (number &rest more-numbers))
(defmethod binary-<= (number1 number2))

;;(defmethod >= (number &rest more-numbers))
(defmethod binary->= (number1 number2))

(defmethod complex (realpart &optional (imagpart 0)))

(defmethod integer-decode-float (x))

(defmethod decode-float (f))

(defmethod scale-float (f ex))

(defmethod float (number &optional (other nil otherp)))

(defmethod floor (number &optional (divisor 1)))

(defmethod ffloor (number &optional (divisor 1)))

(defmethod ceiling (number &optional (divisor 1)))

(defmethod fceiling (number &optional (divisor 1)))

(defmethod truncate (number &optional (divisor 1)))

(defmethod ftruncate (number &optional (divisor 1)))

(defmethod round (number &optional (divisor 1)))

(defmethod fround (number &optional (divisor 1)))

(defmethod realpart (number))

(defmethod imagpart (number))

(defmethod conjugate (number))

(defmethod float-sign (float1 &optional (float2 (float 1 float1))))

;;(defmethod max (number &rest more-numbers))

;;(defmethod min (number &rest more-numbers))

(defmethod cis (theta))

(defmethod phase (number))

(defmethod signum (number))

(defmethod coerce (obj output-type-spec))

(defmethod random (arg &optional (state *random-state*)))

(defmethod realp (object))

(defmethod complexp (object))

(defmethod numberp (object))

;;(defmethod incf (&rest args))

;;(defmethod decf (&rest args))

(defmethod float-digits (f))

(defmethod rational (x))

(defmethod rationalize (x))