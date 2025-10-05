module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify num
    | num <= 0 = Nothing
    | otherwise = Just $ decide $ sum [x | x <- [1..num-1], num `mod` x == 0]
    where decide sumDiv 
            | sumDiv < num  = Deficient
            | sumDiv == num = Perfect
            | otherwise     = Abundant