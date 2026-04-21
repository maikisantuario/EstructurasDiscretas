+ Objetivo: Implementar la recursión sobre árboles. 
+ Tiempo requerido: 7 horas.
+ Comentarios extra: Estuvo divertido hacer las gráficas de los arboles.

+ Consulta arbolesHaskell_6 nota.hs de nuestro repositorio oficial y responde a las siguientes preguntas:
• De acuerdo al ejemplo de la función foldl o foldr el árbol resultante es un BST balanceado?
No, si usas cualquiera de las dos funciones el arbol que sale depende de el orden que tenga la lista, Si la lista ya está ordenada, el arbol quedará de esa forma. 

• De manera conceptual. ¿Cuál seria la idea para que foldr o foldl nos ayude a insertar BST balanceados?
Podría ser primero ordenar la lista y comenzar a insertar desde el elemento que esté a la mitad (como raíz) para después agregar uno a la izquierda y luego uno a la derecha de manera recursiva pero ya no es directo jeje. Otra opción es que la función ya tenga balanceo automatico y ahí si foldr los va metiendo uno por uno y el arbol se va balaceando solo. 

• ¿Cúales son las ventajas que tienen las funciones foldl sobre foldr?
Foldl ocupa la recursión de cola, es decir, que no llena la pila de ejecución y por lo tanto es más eficiente ya que no guarda 'llamadas pendientes'.

• ¿Cúales son las ventajas que tienen las funciones foldr sobre foldl?
Foldr puede trabajar con listas infinitas sin necesidad de recorrer toda la lista si la operación es de evaluación perezosa (no traba de más) además de que es más natural pra hacer o construir listas o estructuras sin cambiar el orden.

+ Arbol de 3 niveles.

```mermaid
graph TB
    7 --> 14
    7 --> 21
    14 --> 28
    14 --> 35
    21 --> 42
    21 --> 49

  +Arbol de 4 niveles

    graph TB
    7 --> 14
    7 --> 21
    14 --> 28
    14 --> 35
    21 --> 42
    21 --> 49
    28 --> 56
    28 --> 63
    35 --> 70
    35 --> 77
    42 --> 84
    42 --> 91
    49 --> 98
    49 --> 105

a) AB 4 Vacío (AB 3 Vacío (AB 5 Vacío Vacío))

graph TB
    4 --> V1[Vacío]
    4 --> 3
    3 --> V2[Vacío]
    3 --> 5
    5 --> V3[Vacío]
    5 --> V4[Vacío]

b) AB 3 (AB 7 (AB 12 Vacío Vacío) Vacío) (AB 6 (AB 11 Vacío Vacío) (AB 10 Vacío Vacío))

graph TB
    3 --> 7
    3 --> 6
    7 --> 12
    7 --> V1[Vacío]
    6 --> 11
    6 --> 10
    12 --> V2[Vacío]
    12 --> V3[Vacío]
    11 --> V4[Vacío]
    11 --> V5[Vacío]
    10 --> V6[Vacío]
    10 --> V7[Vacío]

(c) AB 8 (AB 6 (AB 1 Vacío (AB 4 (AB 2 Vacío Vacío) Vacío)) (AB 7 Vacío Vacío)) (AB 15 Vacío Vacío)

graph TB
    8 --> 6
    8 --> 15
    6 --> 1
    6 --> 7
    1 --> V1[Vacío]
    1 --> 4
    4 --> 2
    4 --> V2[Vacío]
    2 --> V3[Vacío]
    2 --> V4[Vacío]
    7 --> V5[Vacío]
    7 --> V6[Vacío]
    15 --> V7[Vacío]
    15 --> V8[Vacío]
    