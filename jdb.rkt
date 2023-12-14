#lang racket
(require json
		 "helpers.rkt" "config.rkt")
(provide JDB)

(define JDB (get-udata))
(print_f_t "JDB" JDB)