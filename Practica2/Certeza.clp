;;FUNCIONES PROPORCIONADAS EN EL ENUNCIADO

                (deffunction encadenado (?fc_antecedente ?fc_regla)
                (if (> ?fc_antecedente 0) then
                    (bind ?rv (* ?fc_antecedente ?fc_regla))
                else
                    (bind ?rv 0) 
                )
                ?rv
                )


                (deffunction combinacion (?fc1 ?fc2)
                (if (and (> ?fc1 0) (> ?fc2 0) ) then
                    (bind ?rv (- (+ ?fc1 ?fc2) (* ?fc1 ?fc2) ) )
                else
                    (if (and (< ?fc1 0) (< ?fc2 0) ) then
                        (bind ?rv (+ (+ ?fc1 ?fc2) (* ?fc1 ?fc2) ) )
                    else
                        (bind ?rv (/ (+ ?fc1 ?fc2) (- 1 (min (abs ?fc1) (abs ?fc2))) ))
                    )
                ) 
                ?rv
                )


                (defrule combinar
                (declare (salience 1))
                ?f <- (FactorCerteza ?h ?r ?fc1)
                ?g <- (FactorCerteza ?h ?r ?fc2)
                (test (neq ?fc1 ?fc2))
                =>
                (retract ?f ?g)
                (assert (FactorCerteza ?h ?r (combinacion ?fc1 ?fc2)))
)

;;APARTADO 1 - PREGUNTAR

                (deffunction pregunta (?pregunta)
                    (printout t ?pregunta " ¿si o no?: " crlf)
                    (bind ?respuesta (read))
                    (while (not (or (eq ?respuesta si) (eq ?respuesta no))) do
                        (printout t "Responda si/no" crlf)
                        (printout t ?pregunta " ¿si o no?: " crlf)
                        (bind ?respuesta (read)))
                    ?respuesta
                )

                (defrule intentos_arrancar
                (declare (salience 100))
                =>
                (assert (Evidencia hace_intentos_arrancar (pregunta "¿Hace intentos de arrancar?")))
                )

                (defrule gasolina_en_deposito
                (declare (salience 100))
                =>
                (assert (Evidencia hay_gasolina_en_deposito (pregunta "¿Tiene gasolina en el deposito?")))
                )

                (defrule funcionan_luces
                (declare (salience 100))
                =>
                (assert (Evidencia encienden_las_luces (pregunta "¿Se pueden encender las luces?")))
                )

                (defrule funciona_motor
                (declare (salience 100))
                =>
                (assert (Evidencia gira_motor (pregunta "¿Gira el motor?")))
                )


                

;;APARATADO 2 - AÑADIR REGLAS

                ;;; Aunque en este ejemplo no se da, puede ocurrir que tengamos deducciones de hipotesis en positivo y negativo que hay que combinar para compararlas
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                (defrule combinar_signo                 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                (declare (salience 2))                  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                (FactorCerteza ?h si ?fc1)              ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                (FactorCerteza ?h no ?fc2)              ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                =>                                      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                (assert (Certeza ?h (- ?fc1 ?fc2)))     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                )                                       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                (defrule certeza_evidencias
                (Evidencia ?e ?r)
                =>
                (assert (FactorCerteza ?e ?r 1))
                )

                ;;; R1

                (defrule R1
                (declare (salience 99))
                (FactorCerteza motor_llega_gasolina si ?f1)
                (FactorCerteza gira_motor si ?f2)
                (test (and (> ?f1 0) (> ?f2 0)))
                =>
                (assert (FactorCerteza problema_bujias si (encadenado (* ?f1 ?f2) 0.7)))
                )

                ;;; R2

                (defrule R2
                (declare (salience 99))
                (FactorCerteza gira_motor no ?f1)
                (test (> ?f1 0))
                =>
                (assert (FactorCerteza problema_starter si (encadenado ?f1 0.8)))
                )

                ;;; R3

                (defrule R3
                (declare (salience 99))
                (FactorCerteza encienden_las_luces no ?f1)
                (test (> ?f1 0))
                =>
                (assert (FactorCerteza problema_bateria si (encadenado ?f1 0.9)))
                )

                ;;; R4

                (defrule R4
                (declare (salience 99))
                (FactorCerteza hay_gasolina_en_deposito si ?f1)
                (test (> ?f1 0))
                =>
                (assert (FactorCerteza motor_llega_gasolina si (encadenado ?f1 0.9)))
                )

                ;;; R5 

                (defrule R5
                (declare (salience 99))
                (FactorCerteza hace_intentos_arrancar si ?f1)
                (test (> ?f1 0))
                =>
                (assert (FactorCerteza problema_starter si (encadenado ?f1 -0.6)))
                )

                ;;; R6

                (defrule R6
                (declare (salience 99))
                (FactorCerteza hace_intentos_arrancar si ?f1)
                (test (> ?f1 0))
                =>
                (assert (FactorCerteza problema_bateria si (encadenado ?f1 0.5)))
                )


;;APARTADO 3/4 - OBTENER HIPOTESIS CON MAYOR CERTEZA YAÑADIR REGLAS PARA DAR EXPLICACIONES 

                (defrule inicializar_hipotesis_mayor_certeza
                (declare (salience 1))
                =>
                (assert (hipotesis problema_desconocido 0))
                )

                (defrule eliminar_evidencias_problematicas
                (declare (salience -1))
                ?borrar1 <- (FactorCerteza ?hipotesis ?x ?certeza)
                ?borrar2 <- (Evidencia ?hipotesis ?s)
                =>
                (retract ?borrar1 ?borrar2)
                (printout t crlf "Elimino la evidencia " ?hipotesis " ya que al tener ua eficiencia de 100% , seriá la elegida siempre y no se puede comparar con otras hipotesis")
                )

                (defrule hipotesis_con_mayor_certeza
                (declare (salience -2))
                ?borrar1 <- (FactorCerteza ?hipotesis1 si ?certeza1)
                ?borrar2 <- (hipotesis ?hipotesis2 ?certeza2)
                (test (or (eq ?hipotesis1 problema_starter) (or (eq ?hipotesis1 problema_bujias) (eq ?hipotesis1 problema_bateria))))
                (test (> ?certeza1 ?certeza2))
                =>
                (retract ?borrar1 ?borrar2)
                (assert (hipotesis ?hipotesis1 ?certeza1))
                (printout t crlf "Hipotesis elegida " ?hipotesis1 "  con un " (* ?certeza1 100) "% de certeza en lugar de " ?hipotesis2 " la cual tiene una certeza de " (* ?certeza2 100) "% la cual es menor")
                )

                (defrule respuesta
                (declare (salience -3))
                (hipotesis ?hipotesis ?certeza)
                (test (> ?certeza 0))
                =>
                (printout t crlf crlf "CONCLUSION FINAL : El problema es " ?hipotesis " con una certeza del " (* ?certeza 100) "%" crlf)
                )