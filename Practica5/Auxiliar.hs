module Auxiliar where

{- Función: suma
Descripción: Suma dos números enteros.
Uso: suma 3 5 -> 8
-}

suma :: Int -> Int -> Int
suma x 0 = x
suma x y = suma (x + 1) (y - 1)

{- Función: multiplica
Descripción: Multiplica dos números enteros.
Uso: multiplica 3 5 -> 15
-}

multiplica :: Int -> Int -> Int
multiplica _ 0 = 0
multiplica x 1 = x
multiplica x y = suma x (multiplica x (y - 1))

{- Función: divide
Descripción: Divide dos números enteros.
Uso: divide 10 2 -> 5
-}

divide :: Int -> Int -> Int
divide a b
  | a < b = 0
  | otherwise = 1 + divide (a - b) b

{- Función: esPar
Descripción: Determina si un número es par.
Uso: esPar 4 -> True
-}

esPar :: Int -> Bool
esPar 0 = True
esPar 1 = False
esPar n = esPar (n - 2)