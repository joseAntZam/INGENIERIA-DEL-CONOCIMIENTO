

(deffacts datos
	(ave gorrion) (ave paloma) (ave aguila) (ave pinguino)
	(mamifero vaca) (mamifero perro) (mamifero caballo)
	(vuela pinguino no seguro) 
)

;;;;;;;;;;;;;; Reglas seguras ;;;;;;;;;;;;;;

; Las aves son animales
(defrule aves_son_animales
    (ave ?x)
    =>
    (assert (animal ?x))
    (bind ?expl (str-cat "sabemos que un " ?x " es un animal porque las aves son un tipo de animal"))
    (assert (explicacion animal ?x ?expl))
)
; añadimos un hecho que contiene la explicacion de la deduccion


; Los mamiferos son animales (A3)
(defrule mamiferos_son_animales
    (mamifero ?x)
    =>
    (assert (animal ?x))
    (bind ?expl (str-cat "sabemos que un " ?x " es un animal porque los mamiferos son un tipo de animal"))
    (assert (explicacion animal ?x ?expl))
)
; añadimos un hecho que contiene la explicacion de la deduccion


;;;;;;;;;;;;;;;; Regla por defecto: añade ;;;;;;;;;;;;;;;;

;;; Casi todos las aves vuela --> puedo asumir por defecto que las aves vuelan

; Asumimos por defecto
(defrule ave_vuela_por_defecto
    (declare (salience -1)) ; para disminuir probabilidad de añadir erroneamente
    (ave ?x)
    =>
    (assert (vuela ?x si por_defecto))
    (bind ?expl (str-cat "asumo que un " ?x " vuela, porque casi todas las aves vuelan"))
    (assert (explicacion vuela ?x ?expl))
)

;;;;;;;;;;;;;;;; Regla por defecto: retracta ;;;;;;;;;;;;;;;;

; Retractamos cuando hay algo en contra
(defrule retracta_vuela_por_defecto
   (declare (salience -3))                                                                                ; para retractar antes de inferir cosas erroneamente
   ?f <- (vuela ?x ?r por_defecto)
   (vuela ?x ?s seguro)
=>
   (retract ?f)
   (bind ?expl (str-cat "retractamos que un " ?x " " ?r " vuela por defecto, porque sabemos seguro que " ?x " " ?s " vuela"))
   (assert (explicacion vuela ?x ?expl))
)
;;; COMENTARIO: esta regla tambien elimina los por defecto cuando ya esta seguro


;;;;;;;;;;;;;;;; Regla por defecto para razonar con informacion incompleta ;;;;;;;;;;;;;;;;
;;; La mayor parte de los animales no vuelan --> puede interesarme asumir por defecto que un animal no va a volar

(defrule mayor_parte_animales_no_vuelan
    (declare (salience -2))  ; es mas arriesgado, mejor despues de otros razonamientos
    (animal ?x)
    (not (vuela ?x ? ?))
    =>
    (assert (vuela ?x no por_defecto))
    (bind ?expl (str-cat "asumo que " ?x " no vuela, porque la mayor parte de los animales no vuelan"))
    (assert (explicacion vuela ?x ?expl))
)

;;EJERCICIO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; Pregunta

(defrule preguntar_nombre_animal
=>
   (printout t "De que animal usted desea obtener informacion: " crlf)
   (assert (pregunta (read)))
)

;Si no tenemos informacion del animal , preguntamos si es ave , mamifero o desconocido

(defrule preguntar_ave_mamifero_desconocido
   (declare (salience -4))
   ?f <- (pregunta ?x)
   (not (or (mamifero ?x) (ave ?x)))
=>
   (printout t "Carezco de informacion de este animal , ¿ es un ave , un mamifero o no lo sabes ?" crlf)
   (assert (respuesta ?x (read)))
   (retract ?f)
)

;En el caso de ser un ave , guardamos lo introducido por el usuario

(defrule guardar_ave
   (declare (salience -4))
   ?f <- (respuesta ?x ave)
=>
   (assert (ave ?x) (pregunta ?x))
   (retract ?f)
)

;En el caso de ser un mamifero , guardamos lo introducido por el usuario

(defrule guardar_mamifero
   (declare (salience -4))
   ?f <- (respuesta ?x mamifero)
=>
   (assert (mamifero ?x) (pregunta ?x))
   (retract ?f)
)

;En el caso de ser un tipo desconocido , guardamos el animal en (animal)
(defrule guardar_desconocimiento
   (declare (salience -4))
   ?f <- (respuesta ?x ?r)
   (not (eq ?r mamifero))
   (not (eq ?r ave))
=>
   (assert (animal ?x) (pregunta ?x))
   (retract ?f)
)

;;PARA MOSTRAR POR PANTALLA LA RESPUESTA

;;; Si es un ave general , pues mostraremos que es un ave y que vuela

(defrule mostar_ave
   (declare (salience -4))
   ?f <- (pregunta ?x)
   (ave ?x)
   (explicacion vuela ?x ?expl)
=>
   (printout t ?x " es un tipo de ave " ?expl crlf)
   (retract ?f)
)

;;; Si es un mamifero , pues mostraremos que es un mamifero y que no vuela , porque la mayoria de los animales no vuelan

(defrule mostar_mamifero
   (declare (salience -4))
   ?f <- (pregunta ?x)
   (mamifero ?x)
   (explicacion vuela ?x ?expl)
=>
   (printout t ?x " es un tipo de mamifero , por lo tanto " ?expl crlf)
   (retract ?f)
)

;;; Si es un animal desconocido ,  mostraremos que es un animal y que no vuela , porque la mayoria de los animales no vuelan

(defrule mostar_desconocido
   (declare (salience -4))
   ?f <- (pregunta ?x)
   (animal ?x)
   (not (ave ?x))
   (not (mamifero ?x))
   (explicacion vuela ?x ?expl)
=>
   (printout t ?x " es un tipo de animal , por lo tanto " ?expl crlf)
   (retract ?f)
)