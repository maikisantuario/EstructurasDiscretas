module Auxiliar where

import Natural
import Mati

{-Función: sumaNat
 -Descripción: Suma dos numeros naturales de la manera suc(0).
 -Uso: sumaNat (S Cero) (S Cero) -> S (S Cero)
-}

sumaNat :: Natural -> Natural -> Natural
sumaNat Cero n = n
sumaNat (S n) m = S (sumaNat n m)

{-Función: mulNat
 -Descripción: Multiplica dos números naturales usando la construcción de la suma.
 -Uso: mulNat (S (S Cero)) (S (S Cero)) -> S (S (S (S Cero)))
-}

mulNat :: Natural -> Natural -> Natural
mulNat Cero _ = Cero
mulNat (S n) m = sumaNat m (mulNat n m)

{-Función: profundidad
 -Descripción: Calcula la cantidad de capas o niveles de una matrioska.
 -Uso: profundidad (Cont (Cont Mati)) -> 2
-}

profundidad :: Matrioska -> Int
profundidad Mati = 0
profundidad (Cont m) = 1 + profundidad m