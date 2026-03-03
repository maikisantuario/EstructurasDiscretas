Objetivo:Conocer como funciona el lenguaje de programación Haskell y aprender a hacer funciones básicas que reciben diferentes tipos y se aplican de manera diferente.  
Tiempo requerido: Tres horas y media.
¿Cuál es tu lógica detrás de tu función? y ¿Por que no se puede utilizar el operador lógico &&?
Como vimos en clase, el bit menos significativo, es decir, el último bit, determina si un número es par o impar. 
- Si el número en binario termina en 0 entonces el número es par.
- Si el número en binario termina en 1 entonces el número es impar.
El operador lógico `&&` se usa para condiciones booleanas y aquí no comparamos más bien buscamos el bit individualmente. El AND/Y lógico no puede determinar bits individuales de un número.  
Elegí el '.&.' porque este operador sí trabaja bit por bit, comparando cada bit individualmente.
Comentarios extras: Considero que realmente es útil documentar las funciones, me ayudó mucho a entender mejor que debía de hacer para cada una. 
