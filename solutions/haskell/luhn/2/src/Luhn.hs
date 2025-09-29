module Luhn (isValid) where


import Data.Char (isDigit, digitToInt)

-- removed "zip" and "reverse"
isValid :: String -> Bool
isValid xs 
    | length filtered <= 1 = False
    | otherwise = (0==) $ (flip mod) 10 $ snd $ foldl step (length filtered, 0) $ map digitToInt filtered
    where filtered = filter isDigit xs
          step (ind, acc) num
                    | even ind = (ind-1, acc + double num)
                    | otherwise = (ind-1, acc + num)

double :: Int -> Int
double x = if d > 9 then d - 9 else d
    where d = 2 * x