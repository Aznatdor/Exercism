module Luhn (isValid) where

import Data.Char (isDigit, digitToInt)

isValid :: String -> Bool
isValid xs 
    | length filtered <= 1 = False
    | otherwise = (0==) $ (flip mod) 10 $ foldl step 0 $ zip [1..] $ reverse $ map digitToInt filtered
    where filtered = filter isDigit xs
          step acc (ind, num)
                    | even ind = acc + double num
                    | otherwise = acc + num

double :: Int -> Int
double x = if d > 9 then d - 9 else d
    where d = 2 * x