module Mati where

import Auxiliar

data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

{- 6. Función: mayorIgual
 - Descripción: Compara dos matrioskas y devuelve la matrioska que esta dentro.
 - Uso: mayorIgual Mati Mati -> True
-}

mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual m1 m2 = profundidad m1 >= profundidad m2

{- 7. Función: aplana
 - Descripción: Convierte una matrioska en una lista plana de todas las matrioskas que la componen, desde la más externa hasta la más interna.
 - Uso: aplana (Cont (Cont Mati)) -> [Cont (Cont Mati), Cont Mati Mati]
-}

aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana (Cont x) = (Cont x) : aplana x