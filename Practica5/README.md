Objetivo de la práctica: 

Tiempo de realización: 

Comentarios extras: 

• ¿Qué es la Recursión de cola (tail recursion)?
La recursión de cola es una forma diferente de la recursión donde en vez de llamar recursivamente a la cabeza de la lista manda a llamr a la cola de la lista. Es eficiente porque nos permite evitar que la pila de ejecución se llene ya que en la recursión normal cada vez que se manda a llamar a la función se crea un nuevo frame en la pila, la recursión de cola puede aprovechar estas llamdas y trabajar sobre ellas sin necesidad de crear un nuevo recurso.  
• ¿Cuál es la relación entre las funciones de orden superior foldr y foldl con este tipo de recursión?
Ambas son funciones de orden superior que nos sirven para encapsular patrones de recursión en lstas. La función foldr aplica la recursión normal (agregando elementos al inicio de la lista) mientras que foldl utiliza la recursión de cola.
Se pude ver como que ambas funciones son moldes que resumen a cualquier tipo algoritmo recursivo sobre una lista, por ejemplo, si queremos hacer alguna operación en una lista la podemos escribir usando los moldes (foldr o foldl) sin tener que definir la recursión cada vez, otra forma de verlas es como un tipo de 'iteración' disfrazada con la recursión. 

Bibliografía:
1. Tomás, E. (s/f). Recursividad de “cola” (tail recursion). Campusmvp.es. Recuperado el 7 de abril de 2026, de https://www.campusmvp.es/recursos/post/Recursividad-de-cola-tail-recursion.aspx?srsltid=AfmBOor2pM758nfuwhxFnmyOaY4sRiUoTOq0-GU156fNP4CzPYl331TI
2. Foldl and foldr. (s/f). Dal.Ca. Recuperado el 7 de abril de 2026, de https://web.cs.dal.ca/~nzeh/Teaching/3137/haskell/standard_containers/list_functions/folds/
