#lang racket
(require json
		 "helpers.rkt")
(provide get-udata)

(define udataPath (make-parameter "./udata"))
(define fileName "uconfig.json")

(define (get-udata)
	(parameterize ([current-directory (udataPath)])
  		(cond
  			[(file-exists? fileName) (string->jsexpr (string->jsexpr (file->string fileName)))]
  			[else
  				(write-to-file (jsexpr->string (list)) fileName #:mode 'text #:exists 'replace)
  				(list)
  			])))