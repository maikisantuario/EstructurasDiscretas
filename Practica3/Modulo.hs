module Modulo (esPar) where 

import Data.Bits 

{- Función: esPar 
   Descripción: Si n es par devuelve True de lo contarrio False 
   Uso: esPar 4 -> True 
   -}

esPar :: Int -> Bool
esPar n = (n .&. 1) == 0