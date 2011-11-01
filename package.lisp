;;;; package.lisp
;;;; (c) 2011 Robert Smith

;;;; Declare the cl/ga package.

(org.tfeb.conduit-packages:defpackage #:common-lisp/generic-arithmetic
  (:nicknames :cl/ga)
  (:use)
  (:extends/excluding :cl
                      #:+ #:- #:* #:/
                      #:1+ #:1-
                      #:zerop #:plusp #:minusp
                      #:oddp #:evenp
                      #:abs
                      #:sqrt #:isqrt
                      #:lcm #:gcd
                      #:log #:exp
                      #:sin #:cos #:tan
                      #:asin #:acos #:atan
                      #:sinh #:cosh #:tanh
                      #:asinh #:acosh #:atanh
                      #:expt
                      #:mod #:rem
                      #:= #:/=
                      #:< #:>
                      #:<= #:>=
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
                      #:integerp #:rationalp #:realp #:complexp #:numberp
                      #:floatp
                      #:incf #:decf
                      #:rational
                      #:rationalize)
  (:export
   ;; new functions
   #:nullary-+ #:unary-+ #:binary-+
   #:unary-- #:binary--
   #:nullary-* #:unary-* #:binary-*
   #:unary-/ #:binary-/
   #:binary-= #:binary-/=
   #:binary-> #:binary-<
   #:binary->= #:binary-<=
   #:unary-lcm #:binary-lcm
   #:unary-gcd #:binary-gcd
   ;; shadowing COMMON-LISP
   #:+ #:- #:* #:/
   #:1+ #:1-
   #:zerop #:plusp #:minusp
   #:oddp #:evenp
   #:abs
   #:sqrt #:isqrt
   #:lcm #:gcd
   #:log #:exp
   #:sin #:cos #:tan
   #:asin #:acos #:atan
   #:sinh #:cosh #:tanh
   #:asinh #:acosh #:atanh
   #:expt
   #:mod #:rem
   #:= #:/=
   #:< #:>
   #:<= #:>=
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
   #:integerp #:rationalp #:realp #:complexp #:numberp
   #:floatp
   #:incf #:decf
   #:rational
   #:rationalize
   )
  )

(defpackage #:common-lisp/generic-arithmetic-user
  (:nicknames :cl/ga-user)
  (:use :common-lisp/generic-arithmetic))