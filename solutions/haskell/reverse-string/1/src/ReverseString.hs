module ReverseString (reverseString) where

reverseString :: String -> String
reverseString [] = []
reverseString [a] = [a]
reverseString (x:xs) = reverseString xs ++ [x]