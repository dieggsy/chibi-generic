(module chibi.generic (make-generic
                       define-generic
                       define-method
                       generic-add!)
  (import scheme
          (only chicken.base error include)
          (only chicken.syntax define-for-syntax))
  (define-for-syntax identifier? symbol?)
  (include "generic.scm"))
