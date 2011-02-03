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
                      #:sqrt
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
                      #:realp #:complexp #:numberp
                      #:incf #:decf
                      #:rational
                      #:rationalize)
  (:export #:unary-+ #:binary-+
           #:unary-- #:binary--
           #:unary-* #:binary-*
           #:unary-/ #:binary-/
           #:binary-= #:binary-/=
           #:binary-> #:binary-<
           #:binary->= #:binary-<=
           ;; shadowed
           #:+ #:- #:* #:/
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
           #:realp #:complexp #:numberp
           #:incf #:decf
           #:rational
           #:rationalize
           )
  )

#+ignore
(defpackage #:common-lisp/generic-arithmetic-user
  (:nicknames :cl/ga-user)
  (:use :common-lisp/generic-arithmetic))