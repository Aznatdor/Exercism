module Phone (number) where

import Data.Char (isDigit)

number :: String -> Maybe String
number xs
  | (len == 10) && (num !! 0 > '1' && num !! 3 > '1') = Just num
  | (len == 11) && (head num == '1') = number $ drop 1 num
  | otherwise = Nothing
  where num = filter isDigit xs
        len = length num