module CryptoSquare (encode, split) where

import Data.List (transpose, find)
import Data.Char (toLower, isAlpha, isDigit)

-- Predicate
p :: Char -> Bool
p c = (isAlpha c) || (isDigit c)

-- Joins strings with a whitespace
fromWords :: [String] -> String
fromWords = foldl1 (\acc x -> acc++" "++x)

-- Brute force search for c
getC :: String -> Int
getC xs = maybe 0 fst $ find p [(x, y) | x <- [1..n], y <- [1..n]]
  where n = length xs
        p :: (Int, Int) -> Bool
        p (c, r) = (c * r >= n) && (c >= r) && (c - r <= 1)

encode :: String -> String
encode [] = []
encode xs = fromWords $ transpose $ split c $ map toLower normalized
  where normalized = filter p xs
        c = getC $ normalized

-- Removes first n elements from the list
remove :: Int -> [a] -> [a]
remove 0 xs = xs
remove n (_:xs) 
    | length xs >= n = remove (pred n) xs
    | otherwise = []

-- Splits string into chunks of length n. If chunk is too small - pads it
split :: Int -> String -> [String]
split n xs
  | n == 0 = [xs]
  | null xs = []
  | n > length xs = [xs ++ (replicate (n - length xs) ' ')]
  | otherwise = [take n xs] ++ (split n $ remove n xs)
