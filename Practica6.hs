module Practica6 where

import Auxiliar (Arbol(Vacío, AB), altura, maxAux, absAux, insertarBST)

{- 1. Función: nVacíos
Descripción: Devuelve el total de nodos vacíos en un árbol.
Uso: nVacíos (AB 4 Vacío (AB 3 Vacío Vacío)) -> 3
-}

nVacíos :: Arbol a -> Int
nVacíos Vacío = 1
nVacíos (AB _ izquierdo derecho) = nVacíos izquierdo + nVacíos derecho

{- 2. Función: refleja
Descripción: Hace que todos los subárboles izquierdos se vuelvan subárboles derechos y viceversa.
Uso: refleja (AB 4 Vacío (AB 3 Vacío (AB 5 Vacío Vacío))) -> AB 4 (AB 3 (AB 5 Vacío Vacío) Vacío) Vacío
-}

refleja :: Arbol a -> Arbol a
refleja Vacío = Vacío
refleja (AB raiz izquierdo derecho) = AB raiz (refleja derecho) (refleja izquierdo)

{- 3. Función: minimo
Descripción: Devuelve el elemento mínimo de un árbol.
Uso: minimo (AB 9.0 (AB 4.0 Vacío (AB 5.0 Vacío (AB 6.1 Vacío Vacío)))) -> 4.0
-}

minimo :: Ord a => Arbol a -> a
minimo (AB raiz Vacío _) = raiz
minimo (AB _ izquierdo _) = minimo izquierdo
minimo Vacío = error "El árbol está vacío"

{- 4. Función: recorrido
Descripción: Devuelve una lista con los elementos de un árbol de acuerdo a alguno de los trers recorridos. 
Uso: recorrido (AB 4 Vacío (AB 3 Vacío (AB 5 Vacío Vacío))) InOrden -> [4,3,5]
-}

data Orden = InOrden | PreOrden | PostOrden deriving (Eq, Show)

recorrido :: Arbol a -> Orden -> [a]
recorrido Vacío _ = []
recorrido (AB raiz izquierdo derecho) InOrden = recorrido izquierdo InOrden ++ [raiz] ++ recorrido derecho InOrden
recorrido (AB raiz izquierdo derecho) PreOrden = [raiz] ++ recorrido izquierdo PreOrden ++ recorrido derecho PreOrden
recorrido (AB raiz izquierdo derecho) PostOrden = recorrido izquierdo PostOrden ++ recorrido derecho PostOrden ++ [raiz]

{- 5. Función: esBalanceado
Descripción: Verifica si un árbol está balanceado, si lo esta regresa Trueu de lo contrario False.
Uso: esBalanceado (AB 1 (AB 2 Vacío Vacío) (AB 3 Vacío Vacío)) -> True
-}

esBalanceado :: Arbol a -> Bool
esBalanceado Vacío = True
esBalanceado (AB _ izquierdo derecho) = 
    let resta = altura izquierdo - altura derecho
        diferencia = absAux resta
    in diferencia <= 1 && esBalanceado izquierdo && esBalanceado derecho

{- 6. Función: listaArbol
Descripción: Recibe una lista de elementos y regresa un árbol binario de búsqueda, no necesariamente balanceado.
Uso: listaArbol [5,3,7,1,9] -> AB 5 (AB 3 (AB 1 Vacío Vacío) Vacío) (AB 7 Vacío (AB 9 Vacío Vacío))
-}

listaArbol :: Ord a => [a] -> Arbol a
listaArbol [] = Vacío
listaArbol (x:xs) = insertarBST x (listaArbol xs)