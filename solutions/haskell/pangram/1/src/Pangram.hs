module Pangram (isPangram) where

allTrue :: [(Bool, Bool)] -> Bool
allTrue [] = True
allTrue ((x, y):xs) = (x || y) && (allTrue xs)

isPangram :: String -> Bool
isPangram text = let 
  lower = [c `elem` text | c <- ['a'..'z']]
  upper = [c `elem` text | c <- ['A'..'Z']]
  in allTrue (zip upper lower) 