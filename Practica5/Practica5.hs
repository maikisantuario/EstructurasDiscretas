module Practica5 where

import Data.Char (toUpper)

import Auxiliar (suma, multiplica, divide, esPar)

{- 1. Función: hollerBack
Descripción: Toma una  cadena en minusculas y la devuelve en mayusculas.
Uso: hollerBack "haskell" -> "HASKELL"
-}

hollerBack :: String -> String
hollerBack [] = []
hollerBack (x:xs) = toUpper x : hollerBack xs

{- 2. Función: decimal_binario
Descripción: Toma un entero en decimal y regresa una lista de enteros en notación binaria.
Uso: decimal_binario 10 -> [1,0,1,0]
-}

decimal_binario :: Int -> [Int]
decimal_binario 0 = [0]
decimal_binario 1 = [1]
decimal_binario n 
  | n > 1 = decimal_binario (n `div` 2) ++ [n `mod` 2]
  | n == 0 = [0]
  | n == 1 = [1]

{- 3. Función: replica
Descripción: Toma un entero x, un entero n y devuelve una lista que consta de n apariciones de x.
Uso: replica 2 5 -> [2,2,2,2,2]
-}
replica :: Int -> Int -> [Int]
replica _ 0 = []
replica x n = x : replica x (n - 1)

{- 4. Función: recuperaElemento
Descripción: Toma una lista y devuelve el elemento del indice especificado en la lista.
Uso: recuperaElemento [2,4,6] 1 -> 4
-}

recuperaElemento :: [a] -> Int -> a
recuperaElemento (x:_) 0 = x
recuperaElemento [] _ = error "El índice esta fuera del rango"
recuperaElemento (_:xs) n = recuperaElemento xs (n - 1)

{- 5. Función: rota
Descripción: Toma una lista y traslada el primer elemento de una lista xs al final.
Se repite esta acción n veces usando la lista resultante en cada paso.
Uso: rota [1,2,3,4,5] 2 -> [3,4,5,1,2]
-}

rota :: [a] -> Int -> [a]
rota xs 0 = xs
rota [] _ = []
rota (x:xs) n = rota (xs ++ [x]) (n - 1)

{- 6. Función: extranio
Descripción: Dado un entero positivo regresa una lista de elementos del mismo tipo aplicando el siguiente algoritmo:Toma como entrada un entero positivo N. Si N es par, el algoritmo lo divide sobre dos, y si N es impar, el algoritmo lo multiplica por tres y agrega uno.
El algoritmo repite esto, hasta que n es uno. Su tarea es simular la ejecución del algoritmo para un valor dado de N.
Uso: extranio 13 -> [13,40,20,10,5,16,8,4,2,1]
-}

extranio :: Int -> [Int]
extranio 1 = [1]
extranio n
  | esPar n = n : extranio (divide n 2)
  | not (esPar n) = n : extranio (suma (multiplica 3 n) 1)