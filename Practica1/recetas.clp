;;;; AÑADIR LA INFORMACION DE AL MENOS 2 RECETAS NUEVAS al archivo compartido recetas.txt (https://docs.google.com/document/d/15zLHIeCEUplwsxUxQU66LsyKPY9n9p5v1bmi8M85YlU/edit?usp=sharing)
;;;;;recoger los datos de https://www.recetasgratis.net  en el siguiente formato
(deftemplate receta
(slot nombre)   ; necesario
(slot introducido_por) ; necesario
(slot numero_personas)  ; necesario
(multislot ingredientes)   ; necesario
(slot dificultad (allowed-symbols alta media baja muy_baja))  ; necesario
(slot duracion)  ; necesario
(slot enlace)  ; necesario
(multislot tipo_plato (allowed-symbols entrante primer_plato plato_principal postre desayuno_merienda acompanamiento)) ; necesario, introducido o deducido en este ejercicio
(slot coste)  ; opcional relevante
(slot tipo_copcion (allowed-symbols crudo cocido a_la_plancha frito al_horno al_vapor))   ; opcional
(multislot tipo_cocina)   ;opcional
(slot temporada)  ; opcional
;;;; Estos slot se calculan, se haria mediante un algoritmo que no vamos a implementar para este prototipo, lo usamos con la herramienta indicada y lo introducimos
(slot Calorias) ; calculado necesario
(slot Proteinas) ; calculado necesario
(slot Grasa) ; calculado necesario
(slot Carbohidratos) ; calculado necesario
(slot Fibra) ; calculado necesario
(slot Colesterol) ; calculado necesario
)
;;;; Para los datos calculados se puede utilizar: https://www.labdeiters.com/nutricalculadora/ o https://fitia.app/buscar/alimentos-y-recetas/


;;; Crear un fichero de texto recetas.txt en el mismo directorio de recetas.clp y compiar el contenido del archivo compartido


(deffacts piramide_alimentaria
(nivel_piramide_alimentaria verdura 1)
(nivel_piramide_alimentaria hortalizas 1)
(nivel_piramide_alimentaria tuberculos 1)
(nivel_piramide_alimentaria fruta 2)
(nivel_piramide_alimentaria cereales_integrales 3)
(nivel_piramide_alimentaria lacteos 4)
(nivel_piramide_alimentaria aceite_de_oliva 5)
(nivel_piramide_alimentaria frutos 5)
(nivel_piramide_alimentaria frutos_secos 6)
(nivel_piramide_alimentaria especies 6)
(nivel_piramide_alimentaria hierbas_aromaticas 6)
(nivel_piramide_alimentaria legumbres 7)
(nivel_piramide_alimentaria carne_blanca 8)
(nivel_piramide_alimentaria pescado 8)
(nivel_piramide_alimentaria huevos 8)
(nivel_piramide_alimentaria carne_roja 9)
(nivel_piramide_alimentaria embutidos 9)
(nivel_piramide_alimentaria fiambres 9)
(nivel_piramide_alimentaria dulces 9)
)   

(deffacts alimentos_no_veganos
  (no_vegano mahonesa)
  (no_vegano salsa_de_ostion)
  (no_vegano miel)
  (no_vegano chocolate)
  (no_vegano chocolate_blanco)
  (no_vegano manteca)
)

(deffacts alimentos_picantes
  (pica cayena)
)

(deffacts alimentos_con_gluten
  (gluten galleta_maria)
  (gluten galletas)
)

(deffacts alimentos_con_lactosa
  (lactosa mahonesa)
  (lactosa chocolate)
  (lactosa chocolate_blanco)
  (lactosa manteca)
)

(deffacts es_un_tipo_de_obtenidos_con_preguntas
(es_un_tipo_de chiles_chipotles condimento)
(es_un_tipo_de mahonesa condimento)
(es_un_tipo_de surimi pescado)
(es_un_tipo_de verduras_para_ensaladilla verdura)
(es_un_tipo_de yema huevos)
(es_un_tipo_de huevo huevos)
(es_un_tipo_de maicena harina)
(es_un_tipo_de papas tuberculos)
(es_un_tipo_de dientes_de_ajos condimento)
(es_un_tipo_de polvo_hornear otro)
(es_un_tipo_de moras fruta)
(es_un_tipo_de cacao condimento)
(es_un_tipo_de parmesano lacteos)
(es_un_tipo_de bacon carne)
(es_un_tipo_de aceita_de_oliva_suave condimento)
(es_un_tipo_de colorante otro)
(es_un_tipo_de judias_verdes legumbres)
(es_un_tipo_de judias_verdes judias)
(es_un_tipo_de judias legumbres)
(es_un_tipo_de judias_blancas judias)
(es_un_tipo_de judias judias)
(es_un_tipo_de pulpo pescado)
(es_un_tipo_de chiles_jalapeños condimento);;
(es_un_tipo_de chiles_jalapeños chiles);;
(es_un_tipo_de chiles condimento);;
(es_un_tipo_de chiles_chipotles chiles);;
(es_un_tipo_de chiles chiles);;
(es_un_tipo_de chiles_poblanos condimento);;
(es_un_tipo_de chiles_poblanos chiles);;
(es_un_tipo_de espaguetis pasta)
(es_un_tipo_de pasta_judias pasta)
(es_un_tipo_de tofu lacteos)
(es_un_tipo_de camarones pescado)
(es_un_tipo_de brandy condimento)
(es_un_tipo_de semillas_sesamo otro)
(es_un_tipo_de calabacin verdura)
(es_un_tipo_de cebollas verdura)
(es_un_tipo_de zanahorias hortalizas)
(es_un_tipo_de bechamel lacteos)
(es_un_tipo_de laminas_lasania otro)
(es_un_tipo_de salsa_de_ostion condimento)
(es_un_tipo_de sillao condimento)
(es_un_tipo_de lomo_fino carne)
(es_un_tipo_de morada verdura)
(es_un_tipo_de mango fruta)
(es_un_tipo_de cardamomo especies)
(es_un_tipo_de cardamomo condimento)
(es_un_tipo_de bondiola embutidos)
(es_un_tipo_de ajonjoli otro)
(es_un_tipo_de boniatos tuberculos)
(es_un_tipo_de aquafaba otro)
(es_un_tipo_de papaya fruta)
(es_un_tipo_de miel condimento)
(es_un_tipo_de morcilla embutidos)
(es_un_tipo_de lentejas legumbres)
(es_un_tipo_de polvo_de_hornear otro)
(es_un_tipo_de polvo_de_hornear polvo)
(es_un_tipo_de polvo otro)
(es_un_tipo_de polvo_hornear polvo)
(es_un_tipo_de polvo polvo)
(es_un_tipo_de crema_de_leche lacteos)
(es_un_tipo_de langostino pescado)
(es_un_tipo_de cayena especies);;
(es_un_tipo_de cayena condimento);;
(es_un_tipo_de col verdura)
(es_un_tipo_de hongos verdura)
(es_un_tipo_de tallarines pasta)
(es_un_tipo_de puerro verdura)
(es_un_tipo_de patatas tuberculos)
(es_un_tipo_de hielo otro)
(es_un_tipo_de apio verdura)
(es_un_tipo_de remolacha hortalizas)
(es_un_tipo_de acelgas verdura)
(es_un_tipo_de pepino verdura)
(es_un_tipo_de corazones_de_alcachofas verdura)
(es_un_tipo_de galleta_maria dulces)
(es_un_tipo_de ciruela_pasa fruta)
(es_un_tipo_de pato carne)
(es_un_tipo_de albahaca especies)
(es_un_tipo_de tomates_cherry verdura)
(es_un_tipo_de kion especies)
(es_un_tipo_de kion condimento)
(es_un_tipo_de nuez_moscada especies)
(es_un_tipo_de nuez_moscada condimento)
(es_un_tipo_de anis_dulce condimento)
(es_un_tipo_de anis_molido condimento)
(es_un_tipo_de anis_molido anis)
(es_un_tipo_de anis condimento)
(es_un_tipo_de anis_dulce anis)
(es_un_tipo_de anis anis)
(es_un_tipo_de pasta pasta)
(es_un_tipo_de levadura otro)
(es_un_tipo_de comino especies)
(es_un_tipo_de comino condimento)
(es_un_tipo_de cilantro especies)
(es_un_tipo_de cilantro condimento)
(es_un_tipo_de avena cereales)
(es_un_tipo_de frijoles legumbres)
(es_un_tipo_de tortillas_de_maiz cereales)
(es_un_tipo_de mantequilla lacteos)
(es_un_tipo_de chile_poblano condimento)
(es_un_tipo_de chile_poblano chiles)
(es_un_tipo_de camaron pescado)
(es_un_tipo_de esencia_de_vainilla condimento)
(es_un_tipo_de esencia_de_vainilla esencia)
(es_un_tipo_de esencia condimento)
(es_un_tipo_de esencia_vainilla esencia)
(es_un_tipo_de esencia esencia)
(es_un_tipo_de algas verdura)
(es_un_tipo_de jengibre especies)
(es_un_tipo_de jengibre condimento)
(es_un_tipo_de espinaca verdura)
(es_un_tipo_de brotes_de_bambu verdura)
(es_un_tipo_de sake condimento)
(es_un_tipo_de cebolleta verdura)
(es_un_tipo_de patata tuberculos)
(es_un_tipo_de judias_blancas legumbres)
(es_un_tipo_de esencia_vainilla vainilla)
(es_un_tipo_de esencia_vainilla condimento)
(es_un_tipo_de huevos huevos)
(es_un_tipo_de esparragos_trigueros verdura)
(es_un_tipo_de preparado_para_flan dulces)
(es_un_tipo_de galletas dulces)
(es_un_tipo_de chistorra carne)
(es_un_tipo_de macarrones pasta)
(es_un_tipo_de chile_aguero condimento)
(es_un_tipo_de chile_aguero chiles)
(es_un_tipo_de chile_poblano chiles)
(es_un_tipo_de alcaparras verdura)
(es_un_tipo_de chile_morron condimento)
(es_un_tipo_de chile_morron chiles)
(es_un_tipo_de jitomates verdura)
(es_un_tipo_de ramas_de_culantro especies)
(es_un_tipo_de ramas_de_culantro condimento)
(es_un_tipo_de limones fruta)
(es_un_tipo_de oregano especies)
(es_un_tipo_de oregano condimento)
(es_un_tipo_de mozzarella lacteos)
(es_un_tipo_de berenjena verdura)
(es_un_tipo_de romero especies)
(es_un_tipo_de romero condimento)
(es_un_tipo_de longaniza_roja carne)
(es_un_tipo_de panceta carne)
(es_un_tipo_de bacalao pescado)
(es_un_tipo_de bacalao_desalado pescado)
)

(deffacts es_un_tipo_de_alimentos
(es_un_tipo_de chocolate dulces);;
(es_un_tipo_de chocolate_blanco chocolate);;
(es_un_tipo_de patata tuberculos)
(es_un_tipo_de carne_roja carne)
(es_un_tipo_de lomo carne)
(es_un_tipo_de matambre carne)
(es_un_tipo_de bistec carne)
(es_un_tipo_de ternera carne_roja)
(es_un_tipo_de cerdo carne_roja)
(es_un_tipo_de cordero carne_roja)
(es_un_tipo_de carne_blanca carne)
(es_un_tipo_de pollo carne_blanca)
(es_un_tipo_de pavo carne_blanca)
(es_un_tipo_de conejo carne_blanca)
(es_un_tipo_de leche lacteos)
(es_un_tipo_de queso lacteos)
(es_un_tipo_de yogur lacteos)
(es_un_tipo_de atun pescado) 
(es_un_tipo_de salmon pescado)    
(es_un_tipo_de boquerones pescado)
(es_un_tipo_de sardinas pescado)
(es_un_tipo_de almejas pescado)    
(es_un_tipo_de merluza pescado)
(es_un_tipo_de gambas pescado)
(es_un_tipo_de rodajas_merluza pescado)
(es_un_tipo_de salchichon embutidos)
(es_un_tipo_de chorizo embutidos)
(es_un_tipo_de judias_blancas legumbres)
(es_un_tipo_de garbanzos legumbres)
(es_un_tipo_de guisantes legumbres)
(es_un_tipo_de nueces frutos_secos)
(es_un_tipo_de almendra frutos_secos)
(es_un_tipo_de perejil hierbas_aromaticas)
(es_un_tipo_de pimienta especies)
(es_un_tipo_de pimenton especies)
(es_un_tipo_de cereales_integrales cereales)
(es_un_tipo_de trigo cereales)
(es_un_tipo_de arroz cereales)
(es_un_tipo_de harina cereales)
(es_un_tipo_de maiz cereales)
(es_un_tipo_de sandia fruta)
(es_un_tipo_de pinia fruta)
(es_un_tipo_de platano fruta)
(es_un_tipo_de pera fruta)
(es_un_tipo_de manzana fruta)
(es_un_tipo_de naranja fruta)
(es_un_tipo_de lechuga verdura)
(es_un_tipo_de coliflor verdura)
(es_un_tipo_de brocoli verdura)
(es_un_tipo_de ajo verdura)
(es_un_tipo_de pimiento verdura)
(es_un_tipo_de zanahoria verdura)
(es_un_tipo_de cebolla verdura)
(es_un_tipo_de tomate verdura)
(es_un_tipo_de pimiento_rojo pimiento)
(es_un_tipo_de pimiento_verde pimiento)
(es_un_tipo_de pastel dulces)
(es_un_tipo_de caramelos dulces)
(es_un_tipo_de azucar dulces)
(es_un_tipo_de aceite_de_oliva aceite)
(es_un_tipo_de mortadela fiambres)
(es_un_tipo_de jamon_de_york fiambres)
(es_un_tipo_de jamon fiambres)
(es_un_tipo_de aceitunas_verdes frutos)
(es_un_tipo_de aceitunas_rojas frutos)
)

(deffacts es_un_tipo_de_condimento
(es_un_tipo_de especies condimento)
(es_un_tipo_de caldo condimento)
(es_un_tipo_de vino condimento)
(es_un_tipo_de aceite condimento)
(es_un_tipo_de ajo condimento)
(es_un_tipo_de salsa condimento)
(es_un_tipo_de bebida condimento)
(es_un_tipo_de vainilla condimento)
)

(deffacts bebidas
(es_un_tipo_de cognac bebida)
(es_un_tipo_de vino bebida)
(es_un_tipo_de cerveza bebida)
(es_un_tipo_de agua bebida)
)

(deffacts especias
(es_un_tipo_de sal especies)
(es_un_tipo_de azafran especies)
(es_un_tipo_de laurel especies)
(es_un_tipo_de curry especies)
(es_un_tipo_de curcuma especies)
)








;;PARTE 1 DE LA ENTREGA******************************************************************************************************************************************
;;***************************************************************************************************************************************************************









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; EJERCICIO PARTE 1:  AÑADIR REGLAS PARA LISTAR LOS ALIMENTOS DE LOS QUE SE DISPONE DE INFORMACION ANTES DE PREGUNTAR
;;; Indicaciones: 1) deduce hechos (es_alimento ?x) representando que algo es un alimento a partir de la relacion "es_un_tipo_de"
;;;               2) Imprime por pantalla los es_alimento

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule ver_alimentos
(es_un_tipo_de ?a ?x)
=>
(assert (es_alimento ?a))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(defrule listar_alimentos
;;(declare (salience 3))
;;(es_alimento ?a)
;;=>
;;(printout t crlf "Este es un alimento -> " ?a crlf)
;;)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; EJERCICIO PARTE 2:  AÑADIR REGLAS PARA INDICAR AL FINAL OTROS ALIMENTOS DEL MISMO NIVEL  DE LA PIRÁMIDE Y CON LAS MISMAS PROPIEDADES
;;; Indicaciones: 1) deduce (alimento_parecido ?x)  para los alimentos pertenezcan del mismo nivel que el alimento sobre el que se pregunta
;;;               2) retracta los alimento_parecido que tengan una propiedad con valor distinto al preguntado, y los que no tengan una propiedad que si 
;;;                  tenga el preguntado, y los que tengan una propiedad que no tenga el preguntado
;;;               3) Imprime por pantalla los alimento_parecido que queden 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule ver_alimentos_parecidos
(alimento ?a)
(es_alimento ?b & ~?a)
(es_un_tipo_de ?a ?x)
(es_un_tipo_de ?b ?y)
(nivel_piramide_alimentaria ?x ?n)
(nivel_piramide_alimentaria ?y ?n)
=>
(assert (alimento_parecido ?b))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule ver_alimentos_parecidos_rec
(alimento ?a)
(es_un_tipo_de ?a ?x)
(alimento_parecido ?b)
(es_un_tipo_de ?b ?y)
(propiedad ?z ?x si)
(or (not(propiedad ?z ?y si ))
    (and (propiedad ?z ?y no ) (not (propiedad ?z ?x no)))
)
?borrar <- (alimento_parecido ?b)
=>
(retract ?borrar)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(defrule listar_alimentos_parecidos_rec
;;(declare (salience -3))
;;(alimento_parecido ?a)
;;=>
;;(printout t crlf "Este es un alimento parecido actualizados -> " ?a crlf)
;;)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;







;;***************************************************************************************************************************************************************
;;***************************************************************************************************************************************************************














;;PARTE 2 DE LA ENTREGA******************************************************************************************************************************************
;;***************************************************************************************************************************************************************






(defrule carga_recetas
(declare (salience 1000))
=>
(load-facts "recetas.txt")
)

(defrule guarda_recetas
(declare (salience -1000))
=>
(save-facts "auxiliar.txt");;
)



(defrule componiendo_es_un_tipo_de   ;;Si aceitunas verdes , es un tipo de aceitunas y aceitunas es un tipo de fruto , aceitunas verdes es un tipo de fruto
(es_un_tipo_de ?x ?y)
(es_un_tipo_de ?y ?z)
=>
(assert (es_un_tipo_de ?x ?z))
)



(defrule deducir_grupo_por_piramide    ;; si hortalizas es un nivel de la piramide , hortalizas es un grupo de alimentos
(nivel_piramide_alimentaria ?g ?)
=>
(assert (es_grupo_alimentos ?g))
)



(defrule superclase_grupos_son_grupos
(es_grupo_alimentos ?g)                ;; si carne_roja es un grupo de alimento y carne_roja es un tipo de carne , pues carne tambien sera un grupo de alimento
(es_un_tipo_de ?g ?x)
(test (neq ?x condimento))
=>
(assert (es_grupo_alimentos ?x))
)



(defrule es_alimento
(es_un_tipo_de ?a ?g)                 ;; si carne_roja es un tipo de carne y carne es un grupo de alimento , carne_roja es un alimento
(es_grupo_alimentos ?g)
=>
(assert (es_alimento ?a))


)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;***************************************************************************************FUNCIONES_UTILES_CREADAS*********************************************************************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;EXTRAER INGREDIENTES DE LAS RECETAS

(defrule extraer_ingredientes_y_assert
  ?receta <- (receta (ingredientes $?ingredientes))
  =>
  (foreach ?ingrediente ?ingredientes
        (assert (es_alimento ?ingrediente))
        
    ;;)
  )
)

;;DEDUCIR CUANDO UN ALIMENTO O GRUPO DE ALIMENTO , PERTENECE A OTRO GRUPO DE ALIMENTO

(defrule deducir_es_un_tipo_de
(es_grupo_alimentos ?g)
(or (es_alimento ?a) (es_grupo_alimentos ?a))
(test (neq ?a ?g))
=>
(bind ?espacio_a (str-index  "_" ?a ))
(if ?espacio_a  then 
(bind ?primera_palabra_a (sub-string 1 ( - ?espacio_a 1 ) ?a))
(if (eq (str-compare ?primera_palabra_a ?g) 0 )then (assert (es_un_tipo_de ?a ?g)) 
)

)
)

;;DEDUCIR CUANDO UN ALIMENTO PERTENECE A OTRO ALIMENTO
(defrule deducir_es_un_tipo_de_especial
(es_alimento ?g)
(es_alimento ?a)
(test (neq ?a ?g))
=>
(bind ?espacio_a (str-index  "_" ?a ))
(if ?espacio_a  then 
(bind ?primera_palabra_a (sub-string 1 ( - ?espacio_a 1 ) ?a))
(if (eq (str-compare ?primera_palabra_a ?g) 0 )
        then 
        (assert (es_grupo_alimentos ?g)) 
        (assert (es_un_tipo_de ?a ?g))
)

)
)

;;DEDUCIR CUANDO UN ALIEMENTO PERTENECE A UN ALIMENTO , BUSCANDO PALABRAS CONCRETAS POR EL ALIMENTO

(defrule deducir_es_un_tipo_de_por_palabra_contenida
(es_alimento ?g)
(es_alimento ?a)
(test (neq ?a ?g))
=>
(bind ?espacio_en_a (str-index ?g ?a )) 
(if ?espacio_en_a  then 
(bind ?palabra_que_contiene (sub-string ?espacio_en_a (+  (str-length ?g) ?espacio_en_a ) ?a))
(if (eq (str-compare ?palabra_que_contiene ?g) 0 )then (assert (es_grupo_alimentos ?g))(assert (es_un_tipo_de ?a ?g)))
)
)


;;PARA LIMPIAR GRUPOS YA QUE EN EL CASO DE CALDOS , HAY CASO COMO CALDO_POLLO , QUE CON MIS REGLAS DETECTA COMO QUE ES DE TIPO CALDO Y DE TIPO CARNE , PERO SOLO ES REALMENTE DE TIPO CALDO
;;PARA ELLO UTILIZO ESTA REGLA PARA ELIMINARLO DE CARNE
(defrule limpiar_grupos
(es_un_tipo_de ?a caldo)
?f<-(es_un_tipo_de ?a ?h&~caldo)
=>
(retract ?f)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule de_alimento_a_grupo
?f <- (es_alimento ?a)
(es_un_tipo_de ?x ?a)                                        ;;Si aceitunas esta en el grupo de es_alimento , pero tiene diferentes tipos (verdes,negras) , aceitunas se quita de es_alimento y pasa a ser un grupo de alimento
=>
(assert (es_grupo_alimentos ?a))
(retract ?f)
)


(defrule retractar_grupos_sin_subgrupos                        ;; si un alimento esta como grupo de laimento y este no tiene subgrupos , este se quita como grupo de alimentos
?f <- (es_grupo_alimentos ?g)
(not (es_un_tipo_de ? ?g))
=>
(retract ?f)
)

(defrule retractar_grupo_como_alimento                                       ;; si aceitunas esta en es-alimeto y en grupo de alimento , lo borramos de es_alimento y lo dejamos solo en grupo de alimentos
?f <- (es_alimento ?g)
(es_grupo_alimentos ?g)
=>
(retract ?f)
)


(defrule agrupando_por_nombre
(es_un_tipo_de ?a1 ?g)
(es_un_tipo_de ?a2 ?g)
(test (neq ?a1 ?a2))
(not (es_un_tipo_de ?a1 ?a2))
(not (es_un_tipo_de ?a2 ?a1))
=>
(bind ?espacio_a1 (str-index "_" ?a1))
(if ?espacio_a1 then 
   (bind ?primera_palabra_a1 (sym-cat (sub-string 1 (- ?espacio_a1 1) ?a1))) 
   (bind ?espacio_a2 (str-index "_" ?a2))
   (if ?espacio_a2 then 
      (bind ?primera_palabra_a2 (sym-cat (sub-string 1 (- ?espacio_a2 1) ?a2)))
	  ;(printout t "Intentando agrupar " ?a1 " " ?a2 crlf)
      ;(printout t "Primeras palabras respectivas " ?primera_palabra_a1 " " ?primera_palabra_a2 crlf)
      (if (eq (upcase ?primera_palabra_a1) (upcase ?primera_palabra_a2)) then 
         ;(printout t "Creando grupo " ?primera_palabra_a1 " con " ?a1 " y " ?a2 crlf) 
         (if (neq ?a1 ?primera_palabra_a1) then (assert (es_un_tipo_de ?a1 ?primera_palabra_a1)) (assert (es_un_tipo_de ?primera_palabra_a1 ?g))) 
         (if (neq ?a2 ?primera_palabra_a1) then (assert (es_un_tipo_de ?a2 ?primera_palabra_a1)) (assert (es_un_tipo_de ?primera_palabra_a1 ?g))) 
       )
	)   
)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;***************************************************************************************FUNCIONES_UTILES_CREADAS_2*********************************************************************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule eliminar_alimentos ;;ELIMINO DE GRUPO DE ALIMENTOS TODOS AQUELLOS QUE YA PERTENEZCAN A ALGUN TIPO DE COMIDA , ESTO ME RESULTA DE UTILIDAD PARA QUE EN es_alimento SOLO QUEDEN AQUELLOS ALIMENTOS 
(declare (salience -1011))  ;;QUE DESCONOCEMOS Y DESPUES PODER PREGUNTAR POR ELLOS
?f <- (es_alimento ?a)
(es_un_tipo_de ?a ?r)                                       
=>
(retract ?f)
)

;;(defrule carga_alimentos
;;(declare (salience -1014))
;;=>
;;(load-facts "auxiliar.txt")
;;)

(defrule preguntas            ;;LOS ALIMENTOS QUE CON REGLAS GENERICAS , NO DETERMINO SU TIPO , PUES LOS PREGUNTO Y SE CREAN HECHOS SEGUN LAS RESPUESTAS , ESTOS HECHOS LOS METÍ EN UN ARCHIVO Y LOS INCORPORÉ EN MI BASE DE CONOCIMIENTO.
(declare (salience -1015))
(es_alimento ?a)
=>
(printout t crlf "Que tipo de alimento es " ?a ": " )
(assert (es_un_tipo_de ?a (read)))
)

;;(defrule guarda_alimentos
;;(declare (salience -1016))
;;=>
;;(save-facts "auxiliar.txt")
;;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ALIMENTO_RELEVANTE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule lleva_carne
(declare (salience -1017))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a carne)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)

(defrule lleva_pescado
(declare (salience -1019))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a pescado)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)

(defrule lleva_caldo
(declare (salience -1018))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a caldo)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)

(defrule lleva_arroz
(declare (salience -1020))
(receta(ingredientes $? arroz $?)(nombre ?r))   
=>
(assert(propiedad_receta ingrediente_relevante arroz ?r))
)

(defrule lleva_legumbre
(declare (salience -1021))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a legumbres) 
=>
(assert(propiedad_receta ingrediente_relevante garbanzos ?r))
)

(defrule lleva_especies
(declare (salience -1022))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a especies)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)

(defrule lleva_condimentos
(declare (salience -1023))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a condimento)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)

(defrule lleva_pasta
(declare (salience -1024))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a pasta)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)

(defrule lleva_verduras
(declare (salience -1025))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a verdura)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)

(defrule lleva_embutidos
(declare (salience -1026))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a embutidos)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)

(defrule lleva_hortalizas
(declare (salience -1027))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a hortalizas)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)

(defrule lleva_tuberculos
(declare (salience -1028))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a tuberculos)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)


(defrule lleva_frutas
(declare (salience -1029))
(receta(ingredientes $? ?a $?)(nombre ?r))
(es_un_tipo_de ?a fruta)    
=>
(assert(propiedad_receta ingrediente_relevante ?a ?r))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PROPIEDADES_RECETAS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule no_es_vegetariano
(declare (salience -1030))
(receta(ingredientes $? ?a $?)(nombre ?r))
(or(es_un_tipo_de ?a carne) (es_un_tipo_de ?a pescado) (es_un_tipo_de ?a fiambres) (es_un_tipo_de ?a embutidos))
(not(no_es_receta_vegetariana ?r))
=>
(assert(no_es_receta_vegetariana ?r))
)

(defrule insertar_vegetarianas
(declare (salience -1031))
(receta (nombre ?r))
(not(no_es_receta_vegetariana ?r))
=>
(assert(propiedad_receta es_vegetariana ?r))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule no_es_vegana
(declare (salience -1032))
(receta(ingredientes $? ?a $?)(nombre ?r))
(or(es_un_tipo_de ?a carne) (es_un_tipo_de ?a pescado) (es_un_tipo_de ?a fiambres) (es_un_tipo_de ?a embutidos) (es_un_tipo_de ?a huevos)(es_un_tipo_de ?a lacteos)(no_vegano ?a) )
=>
(assert(no_es_receta_vegana ?r))
)

(defrule insertar_veganas
(declare (salience -1033))
(receta (nombre ?r))
(not(no_es_receta_vegana ?r))
=>
(assert(propiedad_receta es_vegana ?r))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule lleva_gluten 
(declare (salience -1034))
(receta(ingredientes $? ?a $?)(nombre ?r))
(or(es_un_tipo_de ?a harina) (es_un_tipo_de ?a trigo) (es_un_tipo_de ?a cereales)(es_un_tipo_de ?a pan)(es_un_tipo_de ?a pasta)(gluten ?a)) 
=>
(assert(no_es_receta_sin_gluten ?r))
)

(defrule insertar_sin_gluten
(declare (salience -1035))
(receta (nombre ?r))
(not(no_es_receta_sin_gluten ?r))
=>
(assert(propiedad_receta es_sin_gluten ?r))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule es_picante
(declare (salience -1036))
(receta(ingredientes $? ?a $?)(nombre ?r))
(or(es_un_tipo_de ?a chiles)(pica ?a)) 
=>
(assert(propiedad_receta es_picante ?r))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule lleva_lactosa
(declare (salience -1037))
(receta(ingredientes $? ?a $?)(nombre ?r))
(or(es_un_tipo_de ?a lacteos)(lactosa ?a)) 
=>
(assert(no_es_receta_sin_lactosa ?r))
)

(defrule insertar_sin_lactosa
(declare (salience -1038))
(receta (nombre ?r))
(not(no_es_receta_sin_lactosa ?r))
=>
(assert(propiedad_receta es_sin_lactosa ?r))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule es_dieta
(declare (salience -1039))
(or(receta (Calorias ?numero &:(< ?numero 750))(tipo_plato plato_principal)(nombre ?r))
   (receta (Calorias ?numero &:(< ?numero 750))(tipo_plato primer_plato plato_principal )(nombre ?r))
   (receta (Calorias ?numero &:(< ?numero 750))(tipo_plato primer_plato)(nombre ?r))
   (receta (Calorias ?numero &:(< ?numero 300))(tipo_plato desayuno_merienda)(nombre ?r))
   (receta (Calorias ?numero &:(< ?numero 250))(tipo_plato postre)(nombre ?r))
   (receta (Calorias ?numero &:(< ?numero 250))(tipo_plato postre desayuno_merienda)(nombre ?r))
   (receta (Calorias ?numero &:(< ?numero 300))(tipo_plato acompanamiento)(nombre ?r))
)
=>
(assert (propiedad_receta es_de_dieta ?r))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;IMPRIMIR ALIMENTOS RELEVANTES
;;(defrule ingrediente_relevante_print
;;(declare (salience -1040))  
;;(propiedad_receta ingrediente_relevante ?a ?r)
;;(propiedad_receta es_vegetariana ?r)
;;(propiedad_receta es_vegana ?r)
;;(propiedad_receta es_sin_gluten ?r)
;;(propiedad_receta es_picante ?r)
;;(propiedad_receta es_sin_lactosa ?r)
;;(propiedad_receta es_de_dieta ?r)
;;=>
;;(printout t crlf "El alimento/os relevante/es de " ?r " es: " ?a crlf)
;;(printout t crlf "Receta vegetariana --> " ?r crlf)
;;(printout t crlf "Receta vegana--> " ?r crlf)
;;(printout t crlf "Receta sin gluten-->" ?r crlf)
;;(printout t crlf "Receta picante-->" ?r crlf)
;;(printout t crlf "Receta sin lactosa-->" ?r crlf)
;;(printout t crlf "Receta de dieta-->" ?r crlf)
;;)





;;***************************************************************************************************************************************************************
;;***************************************************************************************************************************************************************







;;PARTE 3 DE LA ENTREGA******************************************************************************************************************************************
;;***************************************************************************************************************************************************************






;;PRIMER PASO --> METEMOS TODAS LAS RECETAS COMO DISPONIBLES AL PRINCIPIO
(defrule meter_todas_recetas_en_recomendadas
(declare (salience -1041))
(receta(nombre ?r))
=>
(assert (recetas_recomendadas ?r))
)

;;SEGUNDO PASO --> PREGUNTAMOS AL USUARIO SI TIENE ALERGIA A ALGO Y EL CASO DE QUE RESPONDA CON SI , PREGUNTAMOS CUALES.****************************************************************************************************
(defrule alergias
(declare (salience -1042))
=>
(printout t crlf "¿Presentas alguna alegría? Indique si/no" crlf)
(bind ?respuesta_cliente (read))
(if (eq (str-compare (upcase ?respuesta_cliente) SI) 0 )
  then
    (printout t "¿Que alergia/s usted presenta? Indiquelas si son varias , separadas por espacio" crlf)
    (bind ?conjunto_alergias (explode$ (readline)))
    (foreach ?alergia ?conjunto_alergias
        (assert (es_alergia (lowcase ?alergia)))
    )
  else 
    (assert (es_alergia "no_tiene_alergias")) 
)
)

;;TERCER PASO --> EN EL CASO DE QUE SEA ALERGICO AL GLUTEN , QUITAMOS DE LAS RECETAS DISPONIBLES , AQUELLAS QUE LLEVEN GLUTEN
(defrule mirar_gluten
(declare (salience -1043))
(es_alergia gluten)
?f <-(recetas_recomendadas ?r)
(not(propiedad_receta es_sin_gluten ?r))
=>
;;(printout t crlf "Quitada por gluten-->" ?r crlf)
(retract ?f)
)

;;CUARTO PASO --> EN EL CASO DE QUE SEA ALERGICO AL LACTEO , QUITAMOS DE LAS RECETAS DISPONIBLES , AQUELLAS QUE LLEVEN ALGÚN LACTEO 
(defrule mirar_lacteos
(declare (salience -1044))
(or(es_alergia lacteos)(es_alergia lacteo)(es_alergia lactosa))
?f <-(recetas_recomendadas ?r)
(not(propiedad_receta es_sin_lactosa ?r))
=>
;;(printout t crlf "Quitada por lacteos-->" ?r crlf)
(retract ?f)
)

;;QUINTO PASO --> EN EL CASO DE QUE SEA ALERGICO A ALGÚN ALIMENTO EN CONCRETO, QUITAMOS DE LAS RECETAS DISPONIBLES , AQUELLAS QUE LLEVEN ESE ALIMENTO
(defrule eliminar_otras_alergias_alimentos
(declare (salience -1045))
(es_alergia ?a)
?f<-(recetas_recomendadas ?r)
(receta (ingredientes $?ingredientes)(nombre ?r))
=>
(foreach ?ingrediente ?ingredientes
  (if (eq (str-compare  ?ingrediente ?a) 0 )
  then
   ;; (printout t crlf "Quitada por " ?a " -->" ?r crlf)
    (retract ?f)
  )
)
)

;;SEXTO PASO --> EN EL CASO DE QUE SEA ALERGICO A ALGÚN GRUPO DE ALIMENTOS , QUITAMOS DE LAS RECETAS DISPONIBLES , AQUELLAS QUE LLEVEN ALGÚN ALIMENTO PERTENECIENTE A ESE GRUPO DE ALIMENTOS
(defrule eliminar_otras_alergias_grupos
(declare (salience -1046))
(es_alergia ?a)
?f<-(recetas_recomendadas ?r)
(receta (ingredientes $? ?b $?)(nombre ?r))
(es_un_tipo_de ?b ?a)
=>
;;(printout t crlf "Quitada por " ?a " -->" ?r crlf)
(retract ?f)
)


;;SEPTIMO PASO --> PREGUNTAMOS AL USUARIO SI TIENE ALGUNA PREFERENCIA EN LA COMIDA , QUE SEA PICANTE, DE DIETA , QUE SEA VEGETARIANA O QUE SEA VEGANA*********************************************************************

(defrule preferencias_alimenticias
(declare (salience -1047))
=>
(printout t crlf "¿Presentas alguna preferencia alimenticia,  vegetariana , vegana , picante o dieta ? Indique si/no" crlf)
(bind ?respuesta_cliente (read))
(if (eq (str-compare (upcase ?respuesta_cliente) SI) 0 )
  then
    (printout t "¿Que preferencia/as usted presenta? Indiquelas si son varias , separadas por espacio" crlf)
    (bind ?conjunto_preferencias (explode$ (readline)))
    (foreach ?preferencia ?conjunto_preferencias
        (assert (es_preferencia (lowcase ?preferencia)))
    )
  else 
    (assert (es_preferencia "no_tiene_preferencias")) 
)
)

;;OCTAVO PASO --> CONTEMPLO QUE EL USUARIO ME HAYA INDICADO QUE ES VEGANO

(defrule usuario_vegano
(declare (salience -1048))
(or(es_preferencia vegano)(es_preferencia vegana))
?f <- (recetas_recomendadas ?r)
(receta(nombre ?r))
(not(propiedad_receta es_vegana ?r))
=>
;;(printout t crlf "Quitada por no ser vegana  -->" ?r crlf)
(retract ?f)
)

;;NOVENO PASO --> CONTEMPLO QUE EL USUARIO ME HAYA INDICADO QUE ES VEGETARIANO
(defrule usuario_vegetariano
(declare (salience -1049))
(or(es_preferencia vegetariano)(es_preferencia vegetariana))
?f <- (recetas_recomendadas ?r)
(receta(nombre ?r))
(not(propiedad_receta es_vegetariana ?r))
=>
;;(printout t crlf "Quitada por no ser vegetariana  -->" ?r crlf)
(retract ?f)
)

;;DÉCIMO PASO --> CONTEMPLO QUE EL USUARIO ME HAYA INDICADO QUE QUIERE PICANTE
(defrule usuario_quiere_picante
(declare (salience -1050))
(es_preferencia picante)
?f <- (recetas_recomendadas ?r)
(receta(nombre ?r))
(not(propiedad_receta es_picante ?r))
=>
;;(printout t crlf "Quitada por no ser picante  -->" ?r crlf)
(retract ?f)
)


;;UNDÉCIMO PASO --> CONTEMPLO QUE EL USUARIO ME HAYA INDICADO QUE ESTA A DIETA
(defrule usuario_quiere_dieta
(declare (salience -1051))
(es_preferencia dieta)
?f <- (recetas_recomendadas ?r)
(receta(nombre ?r))
(not(propiedad_receta es_de_dieta ?r))
=>
;;(printout t crlf "Quitada por no ser de dieta  -->" ?r crlf)
(retract ?f)
)


;;DUODÉCIMO PASO --> PREGUNTO AL USUARIO SOBRE EL TIPO DE PLATO QUE QUIERE********************************************************************************************************************
(defrule tipo_plato_pregunta
(declare (salience -1052))
=>
(printout t crlf "¿Quieres un tipo de plato en concreto ? Indique si/no" crlf)
(bind ?respuesta_cliente (read))
(if (eq (str-compare (upcase ?respuesta_cliente) SI) 0 )
  then
    (printout t "¿Que tipo de plato desea, entrante, primer_plato , plato_principal, postre ,desayuno_merienda o acompanamiento ? Indique solo una" crlf)
    (bind ?tipo (read))
    (assert (es_tipo (lowcase ?tipo)))
)
)

;;DECIMOTERCERO PASO --> CONTEMPLO EL TIPO DE PLATO QUE HAYA PUESTO EL USUARIO;;;
(defrule usuario_quiere_tipo_plato
(declare (salience -1053))
(es_tipo ?a)
?f <- (recetas_recomendadas ?r)
(receta(nombre ?r)(tipo_plato $? ?b $?))
(or(test(eq (str-compare ?a ?b) 1 ))(test(eq (str-compare ?a ?b) -1)))
=>
;;(printout t crlf "Quitada por no ser de tipo " ?b " -->" ?r crlf)
(retract ?f)
)

;;DECIMOCUARTO PASO --> PREGUNTO POR EL NUMERO DE COMENSALES******************************************************************************************************************************************************************
(defrule numero_comensales_pregunta
(declare (salience -1054))
=>
(printout t crlf "¿Cuantas personas quereis comer? Indique con numero " crlf)
(bind ?numero_comensales (read))
(assert (comensales_a_la_mesa ?numero_comensales))
)

;;DECIMOQUINTA PASO--> CONTEMPLO EL NUMERO DE COMENSALES QUE HAYA PUESTO EL USUARIO , TRBAJARÉ CON MíNIMOS 
;;DEBIDO A QUE SI POR EJEMPLO SON 2 COMENSALES , UNA RECETA PARA 6 TAMBIEN PUEDE VALER , AL REVES SIN EMBARGO NO
(defrule usuario_indica_numero-comensales_a_la_mesa
(declare (salience -1055))
?f <- (recetas_recomendadas ?r)
(receta(nombre ?r)(numero_personas ?b))
(comensales_a_la_mesa ?c)
(test (< ?b ?c))
=>
;;(printout t crlf "Quitada por numerro comensales-->" ?r crlf)
(retract ?f)
)

;;DECIMOSEXTO PASO --> PREGUNTO POR LOS ALIMENTOS QUE TIENE************************************************************************************************************************************************************************

;;ESTE DEFTEMPLATE ES UTIL PARA ALMACENAR LOS INGREDIENTES QUE INTRODUZCA EL USUARIO
(deftemplate ingredientes_disponibles
  (slot nombre)
  (multislot conj_ing_disp)
)

;;DEFINO UN HECHO EN EL CUAL VOY A AÑADIR LOS ALIMENTOS DEL USUARIO
(defrule definir_hecho
(declare (salience -1056))
=>
(assert(ingredientes_disponibles(nombre actual)(conj_ing_disp nada)))
)


;;PREGUNTA , SI EL CLIENTE INDICA QUE SI QUIERE UNO SINGREDIENTES EN CONCRETO , PUES ESTOS SERAN ALMACENADOS EN UN HECHO ingredientes_disponibles  EN  conj_ing_disp
(defrule preguntar_ingredientes
(declare (salience -1057))
?almacen <- (ingredientes_disponibles(nombre ?r)(conj_ing_disp $?ingredientes))
(not(modificado_disponibles actual))
=>

    (printout t crlf "Indique de que alimentos dispones y los que puedes adquirir ( EJEMPLO : salmon pollo arroz sal ): " crlf)
    (bind ?conjunto_alimentos (explode$ (readline)))
    (bind ?nuevos_ingredientes (create$))
    (foreach ?alimento_cocreto ?conjunto_alimentos
        (bind ?nuevos_ingredientes (create$ ?nuevos_ingredientes ?alimento_cocreto))
    )
    (retract ?almacen)
    (assert(modificado_disponibles actual))
    (assert(ingredientes_disponibles(nombre actual)(conj_ing_disp ?nuevos_ingredientes)))

)


;;DEFINO UN DEFTEMPLATE contador YA QUE VOY A CREAR UN CONTADOR PARA CADA UNA DE LAS RECETAS QUE TENGO DISPONIBLES ,
;; ESTE CONTADOR ME SERVIRÁ PARA SABER CUANTOS INGREDIENTES LE FALTAN AL CLIENTE APARTE DE LOS QUE YA TIENE , PARA PODER HACER LA RECETA
(deftemplate contador
    (slot nombre)
    (slot valor)
)

;;DEFINO UN CONTADOR POR CADA UNA DE LAS RECETAS QUE TENGO DISPONIBLES , EL CUAL INICIALIZO A 0
(defrule iniciar_contadores_vacios
(declare (salience -1058))
(recetas_recomendadas ?r)
=>
(assert (contador (nombre ?r) (valor 0)))
)

;;RELLENO CADA UNO DE LOS CONTADORES CREADOS SEGUN SU NUMERO DE INGREDIENTES , ES DECIR , EL CONTADOR DE CADA RECETA SERA IGUAL AL NUMERO DE INGREDIENTES QUE HAGAN FALTA PARA HACER LA RECETA
(defrule llenar_contadores
(declare (salience -1059))
?hola <- (contador (nombre ?r) (valor ?valor))
(receta(nombre ?r)(ingredientes $?ingredientes))
(not(modificado ?r))
=>
  (foreach ?ingrediente ?ingredientes
    (bind ?nuevo_valor (+ ?valor 1))
    (bind ?valor ?nuevo_valor)
  )
(retract ?hola)
(assert (modificado ?r))
(assert(contador (nombre ?r) (valor ?nuevo_valor)))
)




;;DECREMENTO LOS CONTADORES SEGÚN LOS ALIMENTOS QUE HA INTRODUCIDO EL USUARIO--> EJEMPLO: Si el usuario ha dicho que tiene pollo y queso , y una de las recetas de las que hay disponible 
;;tambien tiene pollo y queso , pues decremento el contador de esa receta en en 2 , asi se haria con todas las recetas.
(defrule buscar_alimentos_disponibles
    (declare (salience -1060))
    (recetas_recomendadas ?r)
    (ingredientes_disponibles (nombre actual) (conj_ing_disp $?disponibles))
    (receta (nombre ?r) (ingredientes $?ingredientes))
    ?hola <- (contador (nombre ?r) (valor ?valor))
    (not (modificado_decremento ?r))
    =>
    (bind ?nuevo_valor_2 ?valor)
    (foreach ?alimento ?ingredientes
        (if (member$ ?alimento ?disponibles)
            then
            (bind ?nuevo_valor_2 (- ?nuevo_valor_2 1))
        )
    )
    (retract ?hola)
    (assert (modificado_decremento ?r))
    (assert (contador (nombre ?r) (valor ?nuevo_valor_2)))
)



;;TENIENDO EN CUENTA TOD LO REALIZADO CON ANTERIORIDAD  EN CUANTO A ALERGIAS , PREFERENCIAS , TIPO_PLATO , COMENSALES ..ETC , VAMOS A ELEGIR LA RECETA QUE SE PUEDA COMPLETAR CON LOS INGREDIENTES
;;QUE EL USUARIO DISPONE Y CON LOS QUE PUEDE ADQUIRIR , EN EL CASO QUE NO SE PUEDA COMPLETAR LA RECETA CON LOS INGREDIENTES DEL USUARIO , SELECCIONAREMOS AQUELLA QUE MENOS INGREDIENTES LE FALTEN
;;PARA PODERLA COMPLETAR


(defrule elegir_receta_y_justificar
(declare(salience -1061 ))
(contador(nombre ?r)(valor 0))
(not(encontrada si))
=>
(printout t crlf "****************************************************************************************************************************************************************" crlf)
(printout t crlf "La receta que mas se adapta a tus preferencias es......." ?r " , debido a que tienes todos los ingredientes necesarios para hacerla"crlf)
(printout t crlf "****************************************************************************************************************************************************************" crlf)
(assert (encontrada si))
)


(deftemplate datos_mejor_receta
(slot nombre)
(slot valor)
)

;;ELIJO UNA RECETA INICIAL CUAL QUIERA Y PONGO EL NUMERO DE INGREDIENTES QUE LE FALTAN EN valor DENTRO DE datos_mejor_receta
(defrule elegir_receta_inicial
(declare(salience -1062 ))
(contador(nombre ?r)(valor ?valor))
(not(encontrada si))
(not(encontrado_inicial si))
=>
(assert(datos_mejor_receta(nombre ?r)(valor ?valor)))
(assert(encontrado_inicial si))
)


;;COMPARO LOS INGREDIENTES QUE LE FALTAN A LAS DEMAS RECETAS CON EL valor QUE ANTES HEMOS ELEGIDO , EN EL CASO DE QUE ALGUNO SEA MENOR , ES DECIR QUE LE FALTEN MENOS INGREDIENTES , El VALOR ANTES ELEGIDO SERÁ ACTUALIZADO
;;AL FINAL NOS QUEDARÁ EN UNICO HECHO datos_mejor_receta CON EL NOMBRE Y EL VALOR DE LA MEJOR RECETA, TENIENDO EN CUENTA EL NUMERO DE INGREDIENTES QUE LE FALTAN.
(defrule ver_receta_que_menos_ingredientes_requiere
(declare(salience -1063 ))
(contador(nombre ?auxr)(valor ?aux))
?borrar <- (datos_mejor_receta(nombre ?r)(valor ?valor))
(not(encontrada si))
=>
(if (< ?aux ?valor) then (retract ?borrar) (assert(datos_mejor_receta(nombre ?auxr)(valor ?aux))) )
)


(defrule elegir_receta2_y_justificar
(declare(salience -1064 ))
(datos_mejor_receta(nombre ?auxr)(valor ?aux))
(not(encontrada si))
=>
(printout t crlf "****************************************************************************************************************************************************************" crlf)
(printout t crlf "La receta que mas se adapta a tus preferencias es......." ?auxr " , pero necesitas comprar algunos ingredientes"crlf)
(printout t crlf "****************************************************************************************************************************************************************" crlf)
(assert (encontrada si))
)




(defrule no_existe_receta
(declare(salience -1065))
(not(encontrada si))
=>
(printout t crlf "****************************************************************************************************************************************************************" crlf)
(printout t crlf "No existe receta que se adapte a tus preferencias "crlf)
(printout t crlf "****************************************************************************************************************************************************************" crlf)

)