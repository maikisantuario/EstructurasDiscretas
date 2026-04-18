+ Objetivo: Implementar la recursión sobre árboles. 
+ Tiempo requerido: 4 horas.
+ Comentarios extra: Estuvo divertido hacer las gráficas de los arboles.
+ Consulta arbolesHaskell_6 nota.hs de nuestro repositorio oficial y responde a las siguientes preguntas:
• De acuerdo al ejemplo de la función foldl o foldr el árbol resultante es un BST balanceado?

• De manera conceptual. ¿Cuál seria la idea para que foldr o foldl nos ayude a insertar BST balanceados?

• ¿Cúales son las ventajas que tienen las funciones foldl sobre foldr?

• ¿Cúales son las ventajas que tienen las funciones foldr sobre foldl?


+ Arbol de 3 niveles. 

```mermaid
graph TB
    7 --> 14
    7 --> 21
    14 --> 28
    14 --> 35
    21 --> 42
    21 --> 49

+ Arbol de 4 niveles. 

```mermaid
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

+ Crear la representación visual de los siguientes árboles:
(a) AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))

```mermaid
graph TB
    4 --> V1[Vacío]
    4 --> 3
    3 --> V2[Vacío]
    3 --> 5
    5 --> V3[Vacío]
    5 --> V4[Vacío]

(b) AB 3 (AB 7 (AB 12 Vacio Vacio) Vacio) (AB 6 (AB 11 Vacio Vacio) (AB 10 Vacio Vacio))


```mermaid
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

    (c) AB 8 (AB 6 (AB 1 Vacio (AB 4 (AB 2 Vacio Vacio) Vacio)) (AB 7 Vacio Vacio)) (AB 15 Vacio Vacio)

```mermaid
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