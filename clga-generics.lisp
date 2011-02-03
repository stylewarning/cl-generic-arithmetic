;;;; clga-generics.lisp
;;;; Copyright (c) 2011 Robert Smith

(in-package :cl/ga)

;;(defgeneric + (&rest args))
(defgeneric unary-+ (x))
(defgeneric binary-+ (x y))

;;(defgeneric - (&rest args))
(defgeneric unary-- (x))
(defgeneric binary-- (x y))

;;(defgeneric * (&rest args))
(defgeneric unary-* (x))
(defgeneric binary-* (x y))

;;(defgeneric / (&rest args))
(defgeneric unary-/ (y))
(defgeneric binary-/ (x y))

(defgeneric 1+ (number))

(defgeneric 1- (number))

(defgeneric zerop (number))

(defgeneric plusp (number))

(defgeneric minusp (number))

(defgeneric evenp (number))

(defgeneric oddp (number))

(defgeneric abs (number))

(defgeneric sqrt (number))

(defgeneric log (number &optional (base nil base-p)))

(defgeneric exp (number))

(defgeneric sin (number))

(defgeneric cos (number))

(defgeneric tan (number))

(defgeneric asin (number))

(defgeneric acos (number))

(defgeneric atan (y &optional (x nil xp)))

(defgeneric sinh (number))

(defgeneric cosh (number))

(defgeneric tanh (number))

(defgeneric asinh (number))

(defgeneric acosh (number))

(defgeneric atanh (number))

(defgeneric expt (base power))

(defgeneric mod (number divisor))

(defgeneric rem (number divisor))

;;(defgeneric = (number &rest more-numbers))
(defgeneric binary-= (number1 number2))

;;(defgeneric /= (number &rest more-numbers))
(defgeneric binary-/= (number1 number2))

;;(defgeneric < (number &rest more-numbers))
(defgeneric binary-< (number1 number2))

;;(defgeneric > (number &rest more-numbers))
(defgeneric binary-> (number1 number2))

;;(defgeneric <= (number &rest more-numbers))
(defgeneric binary-<= (number1 number2))

;;(defgeneric >= (number &rest more-numbers))
(defgeneric binary->= (number1 number2))

(defgeneric complex (realpart &optional (imagpart 0)))

(defgeneric integer-decode-float (x))

(defgeneric decode-float (f))

(defgeneric scale-float (f ex))

(defgeneric float (number &optional (other nil otherp)))

(defgeneric floor (number &optional (divisor 1)))

(defgeneric ffloor (number &optional (divisor 1)))

(defgeneric ceiling (number &optional (divisor 1)))

(defgeneric fceiling (number &optional (divisor 1)))

(defgeneric truncate (number &optional (divisor 1)))

(defgeneric ftruncate (number &optional (divisor 1)))

(defgeneric round (number &optional (divisor 1)))

(defgeneric fround (number &optional (divisor 1)))

(defgeneric realpart (number))

(defgeneric imagpart (number))

(defgeneric conjugate (number))

(defgeneric float-sign (float1 &optional (float2 (float 1 float1))))

;;(defgeneric max (number &rest more-numbers))

;;(defgeneric min (number &rest more-numbers))

;;(defgeneric cis (theta))

(defgeneric phase (number))

(defgeneric signum (number))

(defgeneric coerce (obj output-type-spec))

(defgeneric random (arg &optional (state *random-state*)))

(defgeneric realp (object))

(defgeneric complexp (object))

(defgeneric numberp (object))

;;(defgeneric incf (&rest args))

;;(defgeneric decf (&rest args))

(defgeneric float-digits (f))

(defgeneric rational (x))

(defgeneric rationalize (x))




