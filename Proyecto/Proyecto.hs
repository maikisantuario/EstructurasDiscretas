module Proyecto where
import Aux

{-Función: frecuencias
Descripción:Dada una cadena de texto, regresa las frecuencias de cada carácter de mayor a menor frecuencia.
Uso: frecuencias "AVRAHKADABRA" -> [('A',5), ('R',2), ('V',1), ('H',1), ('K',1), ('D',1), ('B',1)]
-}

frecuencias :: String -> [(Char, Int)]
frecuencias str = ordenarFrec (generaFrec (eliminaDuplicados str) str)
  where
    generaFrec [] _ = []
    generaFrec (c:cs) s = (c, cuentaVeces c s) : generaFrec cs s

{-Función: creaListaHojas
Descripción:Convierte una lista(carácter, frecuencia) en una lista de árbol ordenada de menor a mayor.
Uso: crearListaHojas [('A',5), ('R',2), ('V',1)] -> [Leaf 'V' 1, Leaf 'R' 2, Leaf 'A' 5]
-}

creaListaHoja :: [(Char, Int)] -> [HuffmanTree]
creaListaHoja [] = []
creaListaHoja ((c,f):resto) = insertarArbolOrd (Leaf c f) (creaListaHoja resto)

{-Función: construyeArbol
Descripción: Construye un árbol a partir de una lista ordenada de árboles, combina los dos menoress hasta quedé solamente uno. 
Uso: construyeArbol [Leaf 'V' 1, Leaf 'R' 2, Leaf 'A' 5] -> Node 8 ...
-}

construyeArbol :: [HuffmanTree] -> HuffmanTree
construyeArbol [t] = t
construyeArbol (t1:t2:resto) = 
    let suma = getFreq t1 + getFreq t2
        nuevo = Node suma t1 t2
    in construyeArbol (insertarArbolOrd nuevo resto)
construyeArbol _ = error "No se pudo construir el árbol"

{-Función: huffmanArbol
Descripción:Construye el árbol de Huffman rela ionado con una cadena de texto.
Uso: huffmanArbol "banana" -> Node 6 (Node 3 (Leaf 'b' 1) (Leaf 'n' 2)) (Leaf 'a' 3)
-}

huffmanArbol :: String -> HuffmanTree
huffmanArbol str = construyeArbol (creaListaHoja (frecuencias str))

{-Función: ejemploAlgorit
Descripción: Hace una prueba de las funciones anteriores acerca del proyecto (codificación y decodificación).
Uso: 
-}

ejemploAlgorit :: IO ()
ejemploAlgorit = do
    let texto = "AVRAHKADABRA"

    putStrLn $ "\nTexto original: " ++ texto
    
    putStrLn "\nFrecuencias descendentes:"
    let frec = frecuencias texto
    mapM_ (\(c,f) -> putStrLn $ "  '" ++ [c] ++ "' : " ++ show f) frec
    
    putStrLn "Árbol de Huffman:"
    let arbol = huffmanArbol texto
    print arbol
    
    putStrLn "\n=== Fin de la prueba==="

