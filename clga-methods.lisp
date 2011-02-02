;;;; clga-methods.lisp
;;;; Copyright (c) 2011 Robert Smith

;;;; All of the "default" method implementations for built-in CL
;;;; operators/types.

(in-package :cl/ga)

;;(defmethod + (&rest args))
(defmethod unary-+ ((x number))
  (cl:+ x))

(defmethod binary-+ ((x number) (y number))
  (cl:+ x y))

;;; derived
(defun + (&rest numbers)
  (cond ((null numbers) 0) ;; Can we make 0 generic?
        ((null (cdr numbers)) (unary-+ (car number)))
        (t (reduce #'binary-+ numbers))))

(defmethod unary-- ((x number))
  (cl:- x))

(defmethod binary-- ((x number) (y number))
  (cl:- x y))

;;; derived
(defun - (number &rest more-numbers)
  (if (null more-numbers)
      (unary-- number)
      (reduce #'binary-- more-numbers :initial-value number)))

(defmethod unary-* ((x number))
  (cl:* x))

(defmethod binary-* ((x number) (y number))
  (cl:* x y))

;;; derived
(defun * (&rest numbers)
  (cond ((null numbers) 1) ;; Can we make 1 generic?
        ((null (cdr numbers)) (unary-* (car number)))
        (t (reduce #'binary-* numbers))))

(defmethod unary-/ ((y number))
  (cl:/ y))

(defmethod binary-/ ((x number) (y number))
  (cl:/ x y))

;;; derived
(defun / (number &rest more-numbers)
  (if (null more-numbers)
      (unary-/ number)
      (reduce #'binary-/ more-numbers :initial-value number)))

;;; derived
(defun 1+ (number)
  (+ number 1)) ;; Can we make 1 generic?

;;; derived
(defun 1- (number)
  (- number 1)) ;; Can we make 1 generic?

;;; derived
(defmacro incf (place &optional (delta-form 1)) ;; Can we make 1 generic?
  `(setf ,place (+ ,place ,delta-form)))

;;; derived
(defmacro incf (place &optional (delta-form 1)) ;; Can we make 1 generic?
  `(setf ,place (- ,place ,delta-form)))

(defmethod zerop (number)
  ;; TODO
  )

(defmethod plusp (number)
  ;; TODO
  )

(defmethod minusp (number)
  ;; TODO
  )

(defmethod evenp (number)
  ;; TODO
  )

(defmethod oddp (number)
  ;; TODO
  )

(defmethod abs (number)
  ;; TODO
  )

(defmethod sqrt (number)
  ;; TODO
  )

(defmethod log (number &optional (base nil base-p))
  ;; TODO
  )

(defmethod exp (number)
  ;; TODO
  )

(defmethod sin (number)
  ;; TODO
  )

(defmethod cos (number)
  ;; TODO
  )

(defmethod tan (number)
  ;; TODO
  )

(defmethod asin (number)
  ;; TODO
  )

(defmethod acos (number)
  ;; TODO
  )

(defmethod atan (y &optional (x nil xp))
  ;; TODO
  )

(defmethod sinh (number)
  ;; TODO
  )

(defmethod cosh (number)
  ;; TODO
  )

(defmethod tanh (number)
  ;; TODO
  )

(defmethod asinh (number)
  ;; TODO
  )

(defmethod acosh (number)
  ;; TODO
  )

(defmethod atanh (number)
  ;; TODO
  )

(defmethod expt (base power)
  ;; TODO
  )

(defmethod mod (number divisor)
  ;; TODO
  )

(defmethod rem (number divisor)
  ;; TODO
  )

(defmethod binary-= (number1 number2)
  ;; TODO
  )

;;; derived
(defun = (number &rest more-numbers)
  ;; TODO
  )

(defmethod binary-/= (number1 number2)
  ;; TODO
  )

;;; derived
(defun /= (number &rest more-numbers)
  ;; TODO
  )

(defmethod binary-< (number1 number2)
  ;; TODO
  )

;;; derived
(defun < (number &rest more-numbers)
  ;; TODO
  )

(defmethod binary-> (number1 number2)
  ;; TODO
  )

;;; derived
(defun > (number &rest more-numbers)
  ;; TODO
  )

(defmethod binary-<= (number1 number2)
  ;; TODO
  )

;;; derived
(defun <= (number &rest more-numbers)
  ;; TODO
  )

(defmethod binary->= (number1 number2)
  ;; TODO
  )

;;; derived
(defun >= (number &rest more-numbers)
  ;; TODO
  )

(defmethod complex (realpart &optional (imagpart 0))
  ;; TODO
  )

(defmethod integer-decode-float (x)
  ;; TODO
  )

(defmethod decode-float (f)
  ;; TODO
  )

(defmethod scale-float (f ex)
  ;; TODO
  )

(defmethod float (number &optional (other nil otherp))
  ;; TODO
  )

(defmethod floor (number &optional (divisor 1))
  ;; TODO
  )

(defmethod ffloor (number &optional (divisor 1))
  ;; TODO
  )

(defmethod ceiling (number &optional (divisor 1))
  ;; TODO
  )

(defmethod fceiling (number &optional (divisor 1))
  ;; TODO
  )

(defmethod truncate (number &optional (divisor 1))
  ;; TODO
  )

(defmethod ftruncate (number &optional (divisor 1))
  ;; TODO
  )

(defmethod round (number &optional (divisor 1))
  ;; TODO
  )

(defmethod fround (number &optional (divisor 1))
  ;; TODO
  )

(defmethod realpart (number)
  ;; TODO
  )

(defmethod imagpart (number)
  ;; TODO
  )

(defmethod conjugate (number)
  ;; TODO
  )

(defmethod float-sign (float1 &optional (float2 (float 1 float1)))
  ;; TODO
  )

;;; derived
(defun max (number &rest more-numbers)
  ;; TODO
  )

;;; derived
(defun min (number &rest more-numbers)
  ;; TODO
  )

(defmethod cis (theta)
  ;; TODO
  )

(defmethod phase (number)
  ;; TODO
  )

(defmethod signum (number)
  ;; TODO
  )

(defmethod coerce (obj output-type-spec)
  ;; TODO
  )

(defmethod random (arg &optional (state *random-state*))
  ;; TODO
  )

(defmethod realp (object)
  ;; TODO
  )

(defmethod complexp (object)
  ;; TODO
  )

(defmethod numberp (object)
  ;; TODO
  )

(defmethod float-digits (f)
  ;; TODO
  )

(defmethod rational (x)
  ;; TODO
  )

(defmethod rationalize (x)
  ;; TODO
  )
