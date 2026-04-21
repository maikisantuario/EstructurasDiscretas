module Practica6 (Arbol(..), nVacios, refleja, minimo, Orden(..), recorrido, esBalanceado, listaArbol) where

import Auxiliar (Arbol(Vacio, AB), altura, maxAux, absAux)

{-  Tipo del orden del recorrido -}

data Orden = InOrden | PreOrden | PosOrden deriving (Eq, Show)

{- 1. Función: nVacios
Descripción: Devuelve el total de nodos vacíos en un árbol.
Uso: nVacios (AB 4 Vacio (AB 3 Vacio Vacio)) -> 3
-}

nVacios :: Arbol a -> Int
nVacios Vacio = 1
nVacios (AB _ izquierdo derecho) = nVacios izquierdo + nVacios derecho

{- 2. Función: refleja
Descripción: Hace que todos los subárboles izquierdos se vuelvan subárboles derechos y viceversa.
Uso: refleja (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) -> AB 4 (AB 3 (AB 5 Vacio Vacio) Vacio) Vacio
-}

refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB raiz izquierdo derecho) = AB raiz (refleja derecho) (refleja izquierdo)

{- Función auxiliar: minimoAux
Descripción: Devuelve el valor mínimo entre dos elementos.
Uso: minimoAux 5 3 -> 3
NOta: Esta función auxiliar la coloque aqui porque si la mandaba a llamar desde el archivo auxiliar al momento de hacer las pruebas unitarias me marcaba error.
-}

minimoAux :: Ord a => a -> a -> a
minimoAux x y
    | x <= y = x
    | otherwise = y

{- 3. Función: minimo
Descripción: Devuelve el elemento mínimo de un árbol.
Uso: minimo (AB 9.0 (AB 4.0 Vacio (AB 5.0 Vacio (AB 6.1 Vacio Vacio)))) -> 4.0
-}

minimo :: Ord a => Arbol a -> a
minimo (AB raiz Vacio Vacio) = raiz
minimo (AB raiz izquierdo Vacio) = minimoAux raiz (minimo izquierdo)
minimo (AB raiz Vacio derecho) = minimoAux raiz (minimo derecho)
minimo (AB raiz izquierdo derecho) = minimoAux (minimo izquierdo) (minimo derecho)
minimo Vacio = error "El árbol está vacío"

{- 4. Función: recorrido
Descripción: Devuelve una lista con los elementos de un árbol de acuerdo al recorrido.
Uso: recorrido (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) InOrden -> [4,3,5]
-}

recorrido :: Arbol a -> Orden -> [a]
recorrido Vacio _ = []
recorrido (AB raiz izquierdo derecho) InOrden = recorrido izquierdo InOrden ++ [raiz] ++ recorrido derecho InOrden
recorrido (AB raiz izquierdo derecho) PreOrden = [raiz] ++ recorrido izquierdo PreOrden ++ recorrido derecho PreOrden
recorrido (AB raiz izquierdo derecho) PosOrden = recorrido izquierdo PosOrden ++ recorrido derecho PosOrden ++ [raiz]

{- 5 Función: esBalanceado
Descripción: Verifica si un árbol está balanceado si lo esta devuelve True de lo contarrio devuelve False
Uso: esBalanceado (AB 1 (AB 2 Vacio Vacio) (AB 3 Vacio Vacio)) -> True
-}

esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB _ izquierdo derecho) = 
    let resta = altura izquierdo - altura derecho
        diferencia = absAux resta
    in diferencia <= 1 && esBalanceado izquierdo && esBalanceado derecho

{- Función auxiliar: insertarEnBST
Descripción: Inserta un elemento en un árbol binario de búsqueda.
Uso: insertarEnBST 5 (AB 3 Vacio Vacio) -> AB 3 Vacio (AB 5 Vacio Vacio)
NOta: Esta función la coloque aqui porque al momento de realizar las pruebas unitarias y llamarla desde el archivo auxiliar me marcaba error.
-}

insertarEnBST :: Ord a => a -> Arbol a -> Arbol a
insertarEnBST x Vacio = AB x Vacio Vacio
insertarEnBST x (AB raiz izquierdo derecho)
    | x == raiz = AB raiz izquierdo derecho
    | x < raiz = AB raiz (insertarEnBST x izquierdo) derecho
    | x > raiz = AB raiz izquierdo (insertarEnBST x derecho)

{- 6 Función: listaArbol
Descripción: Recibe una lista de elementos y regresa un árbol binario de búsqueda, no necesariamente balanceado.
Uso: listaArbol [5,3,7,1,9] -> AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio) (AB 7 Vacio (AB 9 Vacio Vacio))
-}

listaArbol :: Ord a => [a] -> Arbol a
listaArbol xs = aux xs Vacio
  where
    aux [] arbol = arbol
    aux (y:ys) arbol = aux ys (insertarEnBST y arbol)