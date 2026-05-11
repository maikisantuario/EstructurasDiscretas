module Aux where

data HuffmanTree = Leaf Char Int 
                 | Node Int HuffmanTree HuffmanTree
                 deriving (Show, Eq)

{-Función: getFreq
Descripción: Obtiene la frecuencia de un nodo de un árbol.
Uso: getFreq (Leaf 'A' 5) -> 5
-}

getFreq :: HuffmanTree -> Int
getFreq (Leaf _ f) = f
getFreq (Node f _ _) = f

{-Función: insertarArbolOrd
Descripción: Inserta un árbol en una lista de árboles manteniendo el orden.
Uso:insertarArbolOrd (Leaf 'V' 1) [(Leaf 'D' 1), (Leaf 'B' 1), (Leaf 'R' 2)]
-}

insertarArbolOrd :: HuffmanTree -> [HuffmanTree] -> [HuffmanTree]
insertarArbolOrd t [] = [t]
insertarArbolOrd t (x:xs)
    | getFreq t <= getFreq x = t : x : xs
    | otherwise = x : insertarArbolOrd t xs

{- 
Función: eliminaDuplicados
Descripción: Elimina elementos duplicados de una lista.
Uso: eliminaDuplicados [1,2,2,3,1,4] -> [1,2,3,4]
-}

eliminaDuplicados :: Eq a => [a] -> [a]
eliminaDuplicados [] = []
eliminaDuplicados (x:xs) = x : eliminaDuplicados (filtrar x xs)
  where
    filtrar _ [] = []
    filtrar y (z:zs)
        | y == z = filtrar y zs
        | otherwise = z : filtrar y zs
