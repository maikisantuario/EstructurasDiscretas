module Proyecto where
import Aux

{-Función: frecuencias
Descripción: Dada una cadena de texto, regresa las frecuencias de cada carácter de mayor a menor frecuencia.
Uso: frecuencias "AVRAHKADABRA" -> [('A',5), ('R',2), ('V',1), ('H',1), ('K',1), ('D',1), ('B',1)]
-}

frecuencias :: String -> [(Char, Int)]
frecuencias str = ordenarFrec (generaFrec (eliminaDuplicados str) str)
  where
    generaFrec [] _ = []
    generaFrec (c:cs) s = (c, cuentaVeces c s) : generaFrec cs s

{-Función: creaListaHoja
Descripción: Convierte una lista (carácter, frecuencia) en una lista de árboles hoja ordenada de menor a mayor frecuencia.
Uso: creaListaHoja [('A',5), ('R',2), ('V',1)] -> [Leaf 'V' 1, Leaf 'R' 2, Leaf 'A' 5]
-}

creaListaHoja :: [(Char, Int)] -> [HuffmanTree]
creaListaHoja [] = []
creaListaHoja ((c,f):resto) = insertarArbolOrd (Leaf c f) (creaListaHoja resto)

{-Función: construyeArbol
Descripción: Construye un árbol a partir de una lista ordenada de árboles, combina los dos menores hasta que quede solamente uno.
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
Descripción: Construye el árbol de Huffman relacionado con una cadena de texto (Punto 2).
Uso: huffmanArbol "banana" -> Node 6 (Node 3 (Leaf 'b' 1) (Leaf 'n' 2)) (Leaf 'a' 3)
-}

huffmanArbol :: String -> HuffmanTree
huffmanArbol str = construyeArbol (creaListaHoja (frecuencias str))

{-Función: codificar
Descripción: (Punto 3) Comprime una cadena de texto usando Huffman, devuelve la cadena binaria resultante.
Uso: codificar "AVRAHKADABRA" -> "101001110011001010001100000111"
-}

codificar :: String -> String
codificar str = 
    let arbol = huffmanArbol str
        tabla = generarCodigos arbol
    in concatMap (`buscarCodigo` tabla) str

{-Función: bitsOriginales
Descripción: Calcula cuántos bits ocupa una cadena en representación ASCII estándar (8 bits por carácter).
Uso: bitsOriginales "HOLA" -> 32
-}

bitsOriginales :: String -> Int
bitsOriginales str = length str * 8

{-Función: porcentajeCompresion
Descripción: (Punto 4) Calcula el porcentaje de compresión entre la representación original (8 bits por carácter) y la comprimida.
Uso: porcentajeCompresion "AVRAHKADABRA" -> 68.75 (ejemplo)
-}

porcentajeCompresion :: String -> Double
porcentajeCompresion str =
    let original = fromIntegral (bitsOriginales str)
        comprimido = fromIntegral (length (codificar str))
    in ((original - comprimido) / original) * 100

{-Función: decodificar
Descripción: (Punto 5) Decodifica una cadena binaria comprimida usando el árbol de Huffman original.
Uso: decodificar arbol "101001110011001010001100000111" -> "AVRAHKADABRA"
-}

decodificar :: HuffmanTree -> String -> String
decodificar _ [] = ""
decodificar arbol bits = aux arbol arbol bits
  where
    aux (Leaf c _) _ [] = [c]
    aux (Leaf c _) raiz resto = c : aux raiz raiz resto
    aux (Node _ izq der) raiz (b:bs)
        | b == '0' = aux izq raiz bs
        | b == '1' = aux der raiz bs
        | otherwise = error "Bit inválido"

{-Función: decodificarCadena
Descripción: Versión práctica de decodificar que construye el árbol automáticamente a partir del texto original.
Uso: decodificarCadena "AVRAHKADABRA" (codificar "AVRAHKADABRA") -> "AVRAHKADABRA"
-}

decodificarCadena :: String -> String -> String
decodificarCadena textoOriginal comprimido =
    let arbol = huffmanArbol textoOriginal
    in decodificar arbol comprimido

{-Función: ejemploAlgorit
Descripción: Pruebas las funciones anteriores, las cuales son: 1. Frecuencias, 2. Árbol, 3. Codificación, 4. Porcentaje de compresión, 5. Decodificación, 6. Verificación.
-}

ejemploAlgorit :: IO ()
ejemploAlgorit = do
    let texto = "AVRAHKADABRA"
    
    putStrLn "\n=== Actividades de implementación ==="
    putStrLn $ "\n[1] Texto original: " ++ texto
    
    -- Punto 1: Frecuencias
    putStrLn "\nFrecuencias descendentes:"
    let frec = frecuencias texto
    mapM_ (\(c,f) -> putStrLn $ "  '" ++ [c] ++ "' : " ++ show f) frec
    
    -- Punto 2: Árbol de Huffman
    putStrLn "\nÁrbol de Huffman:"
    let arbol = huffmanArbol texto
    print arbol
    
    -- Punto 3: Codificar
    let comprimido = codificar texto
    putStrLn $ "\nTexto comprimido (Huffman): " ++ comprimido
    putStrLn $ "    Bits comprimidos: " ++ show (length comprimido)
    
    -- Punto 4: Porcentaje de compresión
    let porcentaje = porcentajeCompresion texto
    let originalBits = bitsOriginales texto
    putStrLn $ "\nBits originales (ASCII): " ++ show originalBits
    putStrLn $ "    Porcentaje de compresión: " ++ show porcentaje ++ "%"
    
    -- Punto 5: Decodificar
    let descomprimido = decodificarCadena texto comprimido
    putStrLn $ "\nTexto descomprimido: " ++ descomprimido
    
    -- Punto 6: Verificación
    putStrLn $ "\nVerificación:"
    putStrLn $ "    ¿El texto descomprimido es igual al original? " 
                ++ if texto == descomprimido then "✓ Si!" else "✗ No :c"
    
    putStrLn "\n=== Fin de los ejemplos ==="
