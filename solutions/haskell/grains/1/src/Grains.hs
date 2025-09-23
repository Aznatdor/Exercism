module Grains (square, total) where

square :: Integer -> Maybe Integer
square n 
  | (n <= 0) || (n > 64) = Nothing
  | otherwise = Just $ 2^(pred n)
  
total :: Integer
total = pred (2^64)