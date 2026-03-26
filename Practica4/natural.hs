module Natural where

import Auxiliar

data Natural = Cero | S Natural deriving (Eq, Show)

{- 1. Función:a_natural
 - Descripción: Toma un entero (0,1,2...) y lo lleva a su estructura de dato Natural.
 - Uso: a_natural 2 -> S (S Cero)
-}

a_natural :: Int -> Natural
a_natural 0 = Cero
a_natural n = S (a_natural (n-1))

{- 2. Función:a_entero
 - Descripción:Toma un dato Natural a su representación en un número entero.
 - Uso: a_entero (S (S (S Cero))) -> 3
-}

a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S n) = 1 + a_entero n

{- 3. Función: potenciaNat
 - Descripción: Eleva un número Natural a la potencia del segundo.
 - Uso: potenciaNat ( S ( S ( S Cero ) ) ) ( S ( S Cero ) ) -> S ( S ( S ( S ( S ( S ( S ( S ( S Cero ) ) ) ) ) ) ) ).
-}

potenciaNat :: Natural -> Natural -> Natural
potenciaNat _ Cero = S Cero
potenciaNat base (S exp) = mulNat base (potenciaNat base exp)

{- 4. Función: facNat
 - Descripción: Devuelve el factorial de un natural dado.
 - Uso: facNat ( S ( S ( S Cero ) ) ) -> S ( S ( S ( S ( S ( S Cero ) ) ) ) ).
-}

facNat :: Natural -> Natural
facNat Cero = S Cero
facNat (S n) = mulNat (S n) (facNat n)