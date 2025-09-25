module Anagram (anagramsFor) where

import Data.List
import Data.Char (toUpper)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter p xss
  where pr1 = map toUpper xs
        p :: String -> Bool
        p str
          | pr1 == pr2 = False -- same words are not anagrams
          | otherwise = (sort pr1) == (sort pr2)
          where pr2 = map toUpper str