#lang eopl

; <fnc> ::= (FNC <num-vars> <lista-clausulas>)
;
; <lista-clausulas> ::= (<clausula>)
;                   ::= (<clausula> and <lista-clausulas>)
;
; <clausula> ::= (<lista-int>)
;
; <lista-int> ::= <int>
;             ::= <int> or <lista-int>
;
; <int> ::= número entero

; Representación basada en listas

(define fnc
  (lambda (numvars clausulas)
    (list 'FNC numvars clausulas)))

(define clausula-or-list ;Construye una cláusula como una lista que contiene la lista de enteros
  (lambda (lista-int)
    (list lista-int)))

(define clausula-and-list  ; Construye una cláusula toma una lista de enteros y el resto de cláusulas
  (lambda (lista-int clausulas)
    (list lista-int 'and clausulas)))

; Extractores

(define fnc->num-vars ; Extrae el número de variables el segundo elemento de una expresión FNC
  (lambda (exp)
    (cadr exp)))

(define fnc->clausulas ; Extrae las cláusulas el tercer elemento
  (lambda (exp)
    (caddr exp)))

(define clausula->lista-int ; Dada una cláusula, obtiene la lista de enteros el primer elemento.
  (lambda (cl)
    (car cl)))

(define clausula->resto ; Extrae el resto de cláusulas de una cláusula and-list
  (lambda (cl)
    (caddr cl)))


; Representación basada en datatype

(define-datatype fnc-exp fnc-exp?

  (fnc-exp-struct
   (num-vars number?)
   (clausulas clausulas?)))

(define-datatype clausulas clausulas?

  (clausula-smp
   (lista-int list?))

  (clausula-ext
   (lista-int list?)
   (resto clausulas?)))
