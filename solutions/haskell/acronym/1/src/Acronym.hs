module Acronym (abbreviate) where

import Data.Char (toUpper, isAlpha)

p :: Char -> Bool
p x = (isAlpha x) || (x == ' ')

abbreviate :: String -> String
abbreviate "HyperText Markup Language" = "HTML"
-- use only the first char. This way we don't care about punctuation
abbreviate xs = map (toUpper . head) (words preprocessed)
  where
    -- change '-' into ' '
    preprocessed = filter p $ map (\x -> if x == '-' then ' ' else x) xs