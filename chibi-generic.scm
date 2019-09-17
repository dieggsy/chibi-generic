(module chibi-generic ()
  (import scheme
          (only chicken.module reexport)
          chibi.generic)
  (reexport chibi.generic))
