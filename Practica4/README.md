- Objetivo: Aprender a crear y definir datos además e implementar funciones recursivas de dichos datos.
- Tiempo requerido: Una hora y media.
- Actividades: Hacer 7 funciones recursivas y responder un pequeño cuestionario. 
- Comentarios: Algún día me acostrumbraré a usar Git.

1. ¿Cuál es la diferencia de las operaciones implementadas en ambos archivos? ¿Cómo se manejan todos los casos en cada implementación?
El primer código (Classroom) maneja reglas para cada combinacion que pueda llegar a haber en la construcción de los números enteros según la operación que realice, haciendo que el código tenga demasiados casos, utiliza demasiados 'If - else' anidados además de que en el caso de positivo con negativo hace una comparación para saber si son iguales, si no lo son, realiza la resta pero no sabe si el resultado será negativo o positivo. 
El segundo código (Git) tieune un mejor orden, cubriendo todos los casos posibles tanto para la suma como para la resta, la cual es manejada como una función auxiliar en la suma y viceversa, nos da un mejor entendimiento del código y tiene un buen manejo de la recursión.

2. ¿Por qué se tiene implementada la operación mayorEnt en el archivo enteros.hs?
Para saber que signo se le asigna al resultado. Implenta la operación mayorEnt para saber que número es más grande sino lo compara no sabe que signo ponerle al resultado.

3. Si pudieras quedarte con una sola implementación. ¿Cuál sería? Justifica tu respuesta.
Con la del repositorio porque es mucho más sencilla de entender, tiene un mejor orden además creo que es mucho mejor que sea más compacta para cuando estemos trabajando. La de Classroom tiene muchos casos if - else que dificultan mucho la comprensión del código además de que los casos que maneja son muy complejos.