#lang racket
(provide print_f print_f_t ensure-valid-phone)

;дебажный вывод лога
(define (print_f nameText value)
  (printf "\n~a:\n" nameText)
  (pretty-print value))

;дебажный вывод лога с типом результата
(define (print_f_t nameText value)
  (printf "\n~a[type:: ~a]:\n"
    nameText
    (cond [(string? value) "string"]
          [(number? value) "number"]
          [(symbol? value) "symbol"]
          [(list? value) "list"]
          [(hash? value) "hash"]
          [(cons? value) "cons"]
          [(or (equal? value #f) (equal? value #t)) "boolean"]
          [else "unknown"]))
  (pretty-print value))

;проверка телефона на валидность
(define (ensure-valid-phone str)
  (let* ([only-digital (list->string (filter char-numeric? (string->list (format "~a" str))))]
         [length (string-length only-digital)]
         [first-digit (and (> length 0) (car (string->list only-digital)))])
    (cond [(and (= length 11) (char=? #\7 first-digit)) (string-append "" only-digital)]
          [(and (= length 11) (char=? #\8 first-digit)) (string-append "7" (substring only-digital 1))]
          [(and (= length 10) (or (char=? #\9 first-digit) (char=? #\3 first-digit))) (string-append "7" only-digital)]
          [else #f])))