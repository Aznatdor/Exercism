module SumOfMultiples (sumOfMultiples) where

unique :: (Eq a) => [a] -> [a]
unique [] = []
unique (x:xs) 
  | x `elem` xs = unique xs
  | otherwise = x : unique xs

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . unique $ foldl (++) [] [takeWhile (<limit) (map (*f) [1,2..]) | f <- factors, f /= 0]