module DNA (toRNA) where

comp :: Char -> Char
comp nuc = 
  case nuc of
    'G' -> 'C'
    'C' -> 'G'
    'T' -> 'A'
    'A' -> 'U'

-- If valid, returns 'V', else invalid character
validDNA :: String -> Char
validDNA [] = 'V'
validDNA (x:xs) 
  | x `elem` "GCTA" = validDNA xs
  | otherwise = x

toRNA :: String -> Either Char String
toRNA xs 
  | valid = Right [comp x | x <- xs]
  | otherwise = Left badChar
  where badChar = validDNA xs
        valid = ((validDNA xs) == 'V')