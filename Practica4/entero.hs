module Entero where

data Entero = Zero | Succ Entero | Neg Entero deriving (Eq, Show)

{- Función: sumaEnt
 - Descripción: Suma dos enteros definidos con Succ y Neg.
 - Uso: sumaEnt (Succ Zero) (Succ Zero) -> Succ (Succ Zero)
 - Nota: La multiplicación se define recursivamente usando la suma.
-}

sumaEnt :: Entero -> Entero -> Entero
sumaEnt Zero n = n
sumaEnt n Zero = n
sumaEnt (Succ a) (Neg b) = sumaEnt a b
sumaEnt (Neg a) (Succ b) = sumaEnt a b
sumaEnt (Succ a) b = Succ (sumaEnt a b)
sumaEnt (Neg a) b = Neg (sumaEnt a b)

{- 5. Función: multiEnt
 - Descripción: Toms dos enteros y regresa el producto de ellos.
 - Uso: multiEnt Neg ( Succ ( Succ ( Succ ( Succ Zero ) ) ) ) ) ( Succ (
Succ Zero ) ) -> Neg ( Succ ( Succ ( Succ ( Succ ( Succ ( Succ ( Succ ( Succ Zero ) ) )
) ) ) ) )
-}

multiEnt :: Entero -> Entero -> Entero
multiEnt Zero _ = Zero
multiEnt _ Zero = Zero
multiEnt (Succ a) b = sumaEnt b (multiEnt a b)
multiEnt (Neg a) b = Neg (multiEnt a b)