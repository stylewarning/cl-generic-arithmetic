;;;; package.lisp
;;;; (c) 2011 Robert Smith

;;;; Declare the cl/ga package.

(defpackage #:common-lisp/generic-arithmetic
  (:nicknames :cl/ga)
  (:use)
  (:extends/excluding :cl
                      #:+ #:unary-+ #:binary-+
                      #:- #:unary-- #:binary--
                      #:* #:unary-* #:binary-*
                      #:/ #:unary-/ #:binary-/
                      #:1+ #:1-
                      #:zerop #:plusp #:minusp
                      #:oddp #:evenp
                      #:abs
                      #:sqrt
                      #:log #:exp
                      #:sin #:cos #:tan
                      #:asin #:acos #:atan
                      #:sinh #:cosh #:tanh
                      #:asinh #:acosh #:atanh
                      #:expt
                      #:mod #:rem
                      #:= #:/= #:binary-= #:binary-/=
                      #:< #:> #:binary-> #:binary-<
                      #:<= #:>= #:binary->= #:binary-<=
                      #:complex
                      #:integer-decode-float #:decode-float #:scale-float
                      #:float
                      #:float-digits
                      #:floor #:ffloor
                      #:ceiling #:fceiling
                      #:truncate #:ftruncate
                      #:round #:fround
                      #:realpart #:imagpart
                      #:conjugate
                      #:float-sign
                      #:max #:min
                      #:cis
                      #:phase
                      #:signum
                      #:coerce
                      #:random
                      #:realp #:complexp #:numberp
                      #:incf #:decf
                      #:rational
                      #:rationalize))

(defpackage #:common-lisp/generic-arithmetic-user
  (:nicknames :cl/ga-user)
  (:use :cl/ga))