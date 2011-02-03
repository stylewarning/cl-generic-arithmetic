(defpackage #:cl-generic-arithmetic-asd
  (:use :cl :asdf))

(in-package :cl-generic-arithmetic-asd)

(defsystem cl-generic-arithmetic
  :name "Common Lisp Generic Arithmetic"
  :version "0.0.1"
  :author "Robert Smith"
  :license ""
  :description "The COMMON-LISP package with generic numerical operators."
  :long-description "The COMMON-LISP package with generic numerical operators."

  :serial t
  :components ((:file "package")
               (:file "generics")
               (:file "methods"))
  :depends-on (:conduit-packages))
