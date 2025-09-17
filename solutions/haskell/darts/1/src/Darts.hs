module Darts (score) where

score :: Float -> Float -> Int
score x y 
  | radius <= 1 = 10
  | radius <= 25 = 5
  | radius <= 100 = 1
  | otherwise = 0
  where radius = (x * x) + (y * y)
