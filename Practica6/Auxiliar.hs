module Auxiliar where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

{- Función: altura
Descripción: Calcula la altura de un árbol binario.
Uso: altura (AB 1 (AB 2 Vacio Vacio) (AB 3 Vacio Vacio)) -> 2
-}

altura :: Arbol a -> Int
altura Vacio = 0
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
Descripción: Devuelve el valor absoluto de un número entero.
Uso: absAux (-5) -> 5
-}

absAux :: Int -> Int
absAux x
    | x < 0 = -x
    | x >= 0 = x
    