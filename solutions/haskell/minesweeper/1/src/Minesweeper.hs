module Minesweeper (annotate) where

import Data.Char (intToDigit)


annotate :: [String] -> [String]
annotate board = map (map convert) [[(x, y) | y <- [0..columns]] | x <- [0..rows]]
    where   rows = (length board) - 1
            columns = (length (board !! 0)) - 1
            convert (i, j)
                | board !! i !! j == '*' = '*'
                | numMines == 0 = ' '
                | otherwise = intToDigit numMines
                where numMines = getNumMines board i j


-- you can generalize this function to take an arbitrary number of indices
safeInd :: [String] -> Int -> Int -> Maybe Char
safeInd list i j
    | (min i j < 0) || (i >= length list || j >= length (list !! 0)) = Nothing
    | otherwise = Just $ list !! i !! j


-- Given board [String] and position returns number of mines
getNumMines :: [String] -> Int -> Int -> Int
getNumMines list i j = sum [maybe 0 p $ safeInd list (i+di) (j+dj)| di <- [-1,0,1], dj <- [-1,0,1]] -- i j doesn't have mine, so we'll get 0
    where p c = if c == '*' then 1 else 0