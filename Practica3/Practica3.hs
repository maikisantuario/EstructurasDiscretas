{- Función: creditos
Descripción: Recibe un número de créditos y devuelve la lista con las materias del 1er semestre de Ciencias de la Computación.
Uso: creditos 12 ["Introduccion a las CC", "Matematicas para las Ciencias Aplicadas I"]
-}

creditos :: Int -> [String]
creditos n = case n of
    12 -> ["Introduccion a las CC", "Matematicas para las Ciencias Aplicadas I"]
    10 -> ["Algebra Superior I", "Estructuras Discretas"]
    4  -> ["Ingles I"]
    _  -> [] -- Regresamos la lista vacía para otra materia que no sea de 1er semestre. 

{- Función: allPairs
Descripción: Genera una lista infinita de todos los pares (x,y) de los números naturales.  
Uso: take 10 allPairs -> [(0,0), (0,1), (1,0), (0,2), (1,1), (2,0), (0,3), (1,2), (2,1), (3,0)]
-}

allPairs :: [(Int, Int)]
allPairs = [(x, y) | suma <- [0..], x <- [0..suma], let y = suma - x]

import Modulo (esPar)

{- Función: esPar 
Descripción: Si n es par devuelve True de lo contarrio False.
Uso: esPar 4 -> True 
Función: soloPares 
Descripción: Recibe una lista de enteros y devuelve la lista únicamente con los numeros pares de la lista original.
Uso: soloPares [1 ,2 ,3 ,4] -> [2 ,4]
-}

soloPares :: [Int] -> [Int]
soloPares xs = [x | x <- xs, esPar x]

{- Funcion: negativos
Descripcion: Cuenta cuantos numeros negativos hay en una lista.
Uso: negativos [-1, 2, 4, 6, -4] -> 2
-}

negativos :: [Int] -> Int
negativos xs = length [x | x <- xs, x < 0]

{- Función: esPrimo
Descripción: Nos dice si un numero es primo
Uso: esPrimo 7 -> True
     esPrimo 8 -> False
Nota: Definí esta función como una auxiliar porque es más fácil definir la función primos.
-}

esPrimo :: Int -> Bool
esPrimo n = 
    if n <= 1 then False
    else if n == 2 then True
    else [x | x <- [2..n-1], n `mod` x == 0] == []

{- Función: primos
Descripción: Devuelve la lista solo con los numeros primos de la lista original. 
Uso: primos [1..20] -> [2,3,5,7,11,13,17,19]
-}

primos :: [Int] -> [Int]
primos xs = [x | x <- xs, esPrimo x]

{- Función: coprimos
Descripción: Recibe un entero n y devuelve una lista con los numeros coprimos a y recordemos que dos numeros son coprimos si su maximo comun divisor es 1.
Uso: coprimos 10 -> [1,3,7,9]
-}

coprimos :: Int -> [Int]
coprimos n = [x | x <- [1..n-1], 
                  let mcd a b = if b == 0 then a else mcd b (a `mod` b)
                  in mcd n x == 1]
                  



