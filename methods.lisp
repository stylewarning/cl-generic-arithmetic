;;;; clga-methods.lisp
;;;; Copyright (c) 2011 Robert Smith

;;;; All of the "default" method implementations for built-in CL operators/types.

;;;; Lots TODO.

(in-package :cl/ga)

(defmacro defun-folded (name binaryf
                        &key
                        (unary-function #'identity)
                        (initial-value nil initial-value-p))
  `(defun ,name ,(if initial-value-p
                     `(&rest numbers)
                     `(number &rest numbers))
     ,(if initial-value-p
          `(cond
             ((null numbers) ,initial-value)
             ((null (cdr numbers)) (funcall ,unary-function (car numbers)))
             (t (reduce ,binaryf numbers :initial-value ,initial-value)))
          `(if (null numbers)
               (funcall ,unary-function number)
               (reduce ,binaryf numbers :initial-value number)))))

(defmethod unary-+ ((x number))
  (cl:+ x))

(defmethod binary-+ ((x number) (y number))
  (cl:+ x y))

;;; derived
#+ignore
(defun + (&rest numbers)
  (cond ((null numbers) 0) ;; XXX: Can we make 0 generic?
        ((null (cdr numbers)) (unary-+ (car numbers)))
        (t (reduce #'binary-+ numbers))))

(defun-folded + #'binary-+
  :unary-function #'unary-+
  :initial-value 0)

(defmethod unary-- ((x number))
  (cl:- x))

(defmethod binary-- ((x number) (y number))
  (cl:- x y))

;;; derived
#+ignore
(defun - (number &rest more-numbers)
  (if (null more-numbers)
      (unary-- number)
      (reduce #'binary-- more-numbers :initial-value number)))

(defun-folded - #'binary--
  :unary-function #'unary--)

(defmethod unary-* ((x number))
  (cl:* x))

(defmethod binary-* ((x number) (y number))
  (cl:* x y))

;;; derived
#+ignore
(defun * (&rest numbers)
  (cond ((null numbers) 1) ;; XXX: Can we make 1 generic?
        ((null (cdr numbers)) (unary-* (car number)))
        (t (reduce #'binary-* numbers))))
(defun-folded * #'binary-*
  :unary-function #'unary-*
  :initial-value 1)

(defmethod unary-/ ((y number))
  (cl:/ y))

(defmethod binary-/ ((x number) (y number))
  (cl:/ x y))

;;; derived
#+ignore
(defun / (number &rest more-numbers)
  (if (null more-numbers)
      (unary-/ number)
      (reduce #'binary-/ more-numbers :initial-value number)))
(defun-folded / #'binary-/
  :unary-function #'unary-/)

;;; not derived, since 1+ is naturally synonymous to "successor"
(defmethod 1+ ((n number))
  (cl:1+ n))

;;; not derived, since 1- is naturally synonymous to "predecessor"
(defmethod 1- ((n number))
  (cl:1- n))

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

;;; XXX: We can make these derived...
(defmethod zerop ((n number))
  (cl:zerop n))

(defmethod plusp ((n number))
  (cl:plusp n))

(defmethod minusp ((n number))
  (cl:minusp n))

(defmethod evenp ((n number))
  (cl:evenp n))

(defmethod oddp ((n number))
  (cl:oddp n))

(defmethod abs ((n number))
  (cl:abs n))

(defmethod sqrt ((n number))
  (cl:sqrt n))

(defmethod log ((n number) &optional (base nil base-p))
  ;; Can we specialize BASE?
  (if base-p
      (cl:log n base)
      (cl:log n)))

(defmethod exp ((n number))
  (cl:exp n))

(defmethod sin ((n number))
  (cl:sin n))

(defmethod cos ((n number))
  (cl:cos n))

(defmethod tan ((n number))
  (cl:tan n))

(defmethod asin ((n number))
  (cl:asin n))

(defmethod acos ((n number))
  (cl:acos n))

(defmethod atan ((y number) &optional (x nil xp))
  (if xp (cl:atan y x) (cl:atan y)))

(defmethod sinh ((n number))
  (cl:sinh n))

(defmethod cosh ((n number))
  (cl:cosh n))

(defmethod tanh ((n number))
  (cl:tanh n))

(defmethod asinh ((n number))
  (cl:asinh n))

(defmethod acosh ((n number))
  (cl:acosh n))

(defmethod atanh ((n number))
  (cl:atanh n))

(defmethod expt ((base number) (power number))
  (cl:expt base power))

(defmethod mod ((n number) (d number))
  (cl:mod n d))

(defmethod rem ((n number) (d number))
  (cl:rem n d))

(defmethod binary-= ((n1 number) (n2 number))
  (cl:= n1 n2))

;;; derived
#+ignore
(defun = (number &rest more-numbers)
  ;; TODO
  )
;; XXX: Should this *always* be true for one argument? How about if it
;; was overloaded with NaN? Should we have a UNARY-= ?
(defun-folded - #'binary-=
  :unary-function (constantly t))

(defmethod binary-/= ((n1 number) (n2 number))
  (cl:/= n1 n2))

;;; derived
#+ignore
(defun /= (number &rest more-numbers)
  ;; TODO
  )
(defun-folded - #'binary-/=
  :unary-function (constantly t))

(defmethod binary-< ((n1 number) (n2 number))
  (cl:< n1 n2))

;;; derived
#+ignore
(defun < (number &rest more-numbers)
  ;; TODO
  )
(defun-folded - #'binary-<
  :unary-function (constantly t))

(defmethod binary-> ((n1 number) (n2 number))
  (cl:> n1 n2))

;;; derived
#+ignore
(defun > (number &rest more-numbers)
  ;; TODO
  )
(defun-folded - #'binary->
  :unary-function (constantly t))

(defmethod binary-<= ((n1 number) (n2 number))
  (cl:<= n1 n2))

;;; derived
#+ignore
(defun <= (number &rest more-numbers)
  ;; TODO
  )
(defun-folded - #'binary-<=
  :unary-function (constantly t))

(defmethod binary->= ((n1 number) (n2 number))
  (cl:>= n1 n2))

;;; derived
#+ignore
(defun >= (number &rest more-numbers)
  ;; TODO
  )
(defun-folded - #'binary->=
  :unary-function (constantly t))

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

(defmethod realpart ((n number))
  ;; TODO
  )

(defmethod imagpart ((n number))
  ;; TODO
  )

(defmethod conjugate ((n number))
  ;; TODO
  )

(defmethod float-sign (float1 &optional (float2 (float 1 float1)))
  ;; TODO
  )

;;; derived
#+ignore
(defun max (number &rest more-numbers)
  ;; TODO
  )
(defun-folded max #'(lambda (x y) (if (> x y) x y)))

;;; derived
#+ignore
(defun min (number &rest more-numbers)
  ;; TODO
  )
(defun-folded min #'(lambda (x y) (if (> x y) x y)))

;;derived
(defun cis (theta)
  (complex (cos theta) (sin theta)))

(defmethod phase ((n number))
  ;; TODO
  )

(defmethod signum ((n number))
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
