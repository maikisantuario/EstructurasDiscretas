import Data.Bits

{- Función: sayHello!
   Descripción: Recibe una cadena y devuelve la concatenación con Hello!
   Uso: sayHello! "Maiki" = "Maiki Hello!"
   -}
sayHello :: String -> String
sayHello texto = texto ++ "Hello!"

{- Función: calcularPropina
   Descripción: Devuelve la propina de una cuenta (10% o 15%).
   Uso: calcularPropina 3800 15 = 570.0  (Es el 15% de 3800)
   -}
calcularPropina :: Double -> Double -> Double 
calcularPropina cantidad porcentaje = cantidad * (porcentaje / 100)

{- Función: menor
   Descripción: Recibe tres números y devuelve el menor de ellos.
   Uso: menor (9, 2, 51) = 2 
   -}
menor :: (Int, Int, Int) -> Int
menor (x, y, z) =
    if x <= y && x <= z then x
    else if y <= x && y <= z then y
    else z

{- Función: decide
   Descripción: Recibe un boleano y dos cadenas. Si el valor del boleano es True devuelve la primera cadena, de lo contrario, devuelve la segunda. 
   Uso: decide True "mango" "moneda" = "mango"
        decide False "mango" "moneda" = "moneda"
   -}
decide :: Bool -> String -> String -> String 
decide condicion cadenaA cadenaB =
    if condicion then cadenaA else cadenaB

{- Función: esDescendiente 
   Descripción: Recibe cuatro parámetros de tipo entero y devuelve un valor de tipo booleano según el caso:
   True, si los números fueron ingresados en orden descendente 
   False, si los números no fueron ingresados de manera descendiente. 
   Uso: esDescendiente 25 24 22 21 -> True
   -}
esDescendiente :: Int -> Int -> Int -> Int -> Bool
esDescendiente x y z w = x >= y && y >= z && z >= w

{- Función: esDivisible 
   Descripción: Recibe dos parámetros de tipo entero y devuelve una salida del tipo x es divisible por y.
   Nota: No se puede dividir entre cero.  
   Uso: esDivisible 8 4 -> 8 es divisible por 4 
   -}
esDivisible :: Int -> Int -> String 
esDivisible x y =
    if y == 0
        then " No se puede dividir entre cero "
        else if x `mod` y == 0
            then show x ++ " es divisivle por " ++ show y
            else show x ++ " no es divisible por " ++ show y

{- Función: esPar 
   Descripción: Si n es par devuelve True de lo contarrio False 
   Uso: esPar 4 -> True 
   -}
esPar :: Int -> Bool
esPar n = (n .&. 1) == 0

{- Función: hipotenusa
   Descripción: Recibe dos parámetros de tipo flotantes y devuelve un valor de tipo flotante que representa el valor de la hipotenusa. 
   Uso: hipotenusa 8.8 18.0 = 20.76 
   -}
hipotenusa :: Float -> Float -> Float
hipotenusa b h = sqrt (b^2 + h^2)

{- Función: pendiente
   Descripción: Recibe dos tuplas de tipo flotante y devuelve un valor de tipo flotante, en este caso, la pendiente de una recta.
   Uso: pendiente (3.0 , 2.0) (7.0 ,8.0) -> 1.5 
   -}
pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x1, y1) (x2, y2) = (y2 - y1) / (x2 - x1)

{- Función: distanciaPuntos
   Descripción: Recibe dos tuplas de tipo flotante y devuelve un valor de tipo flotante, en este caso, la distancia entre los puntos. 
   Uso: distanciaPuntos (2.0 , 1.0) (5.0 , 5.0) -> 5.0 
   -}
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt ((x2 - x1)^2 + (y2 - y1)^2)

{- Función: cuadrados
   Descripción: Recibe una tupla de tipo entera y devuelve una tupla de los cuadrados del parámetro. 
   Uso tuplas: cuadrados (1, 2, 3, 4, 5) -> (2, 4, 9, 16, 25)
   -}
cuadrados :: (Int, Int, Int, Int, Int) -> (Int, Int, Int, Int, Int)
cuadrados (a, e, i, o, u) = (a*a, e*e, i*i, o*o, u*u)