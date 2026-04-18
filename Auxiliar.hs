module Auxiliar where

data Arbol a = Vacío | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

{- Función: altura
Descripción: Calcula la altura de un árbol binario.
Uso: altura (AB 1 (AB 2 Vacío Vacío) (AB 3 Vacío Vacío)) -> 2
-}

altura :: Arbol a -> Int
altura Vacío = 0
altura (AB _ izquierdo derecho) = 1 + maxAux (altura izquierdo) (altura derecho)

{- Función: maxAux
Descripción: Devuelve el valor máximo entre dos números.
Uso: maxAux 5 3 -> 5
-}

maxAux :: Int -> Int -> Int
maxAux x y
    | x >= y = x
    | x < y = y

{- Función: absAux
Descripción: Devuelve el valor absoluto o total de un número entero.
Uso: absAux (-5) -> 5
-}

absAux :: Int -> Int
absAux x
    | x < 0 = -x
    | x >= 0 = x

{- Función: insertarBST
Descripción: Agrega un elemento en un árbol binario de búsqueda.
Uso: insertarBST 5 (AB 3 Vacío Vacío) -> AB 3 Vacío (AB 5 Vacío Vacío)
-}

insertarBST :: Ord a => a -> Arbol a -> Arbol a
insertarBST x Vacío = AB x Vacío Vacío
insertarBST x (AB raiz izquierdo derecho)
    | x < raiz = AB raiz (insertarBST x izquierdo) derecho
    | x > raiz = AB raiz izquierdo (insertarBST x derecho)
    | x == raiz = AB raiz izquierdo derecho