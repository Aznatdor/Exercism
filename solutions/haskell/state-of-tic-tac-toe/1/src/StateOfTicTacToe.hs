module StateOfTicTacToe (gameState, GameState(..)) where

import Data.List (transpose)

data GameState = WinX | WinO | Draw | Ongoing | Impossible deriving (Eq, Show)

type Board = [String]

win :: Board -> Char -> Bool
win s mark = row || col || posDiag || negDiag
  where row = any (==True) $ map (all (==mark)) s
        col = any (==True) $ map (all (==mark)) $ transpose s
        posDiag = all (==mark) [s !! i !! i | i <-[0..2]]
        negDiag = all (==mark) [s !! i !! (2 - i) | i <-[0..2]]

draw :: Board -> Bool
draw board = all (==True) $ map (all (/=' ')) board

possible :: Board -> Bool
possible board = cntX == cntO || cntX == cntO + 1
  where cntX = sum $ map (\x -> if x == 'X' then 1 else 0) $ concat board
        cntO = sum $ map (\x -> if x == 'O' then 1 else 0) $ concat board

gameState :: Board -> GameState
gameState board = case (win board 'O', win board 'X') of
  (True, True) -> Impossible
  (False, True) -> WinX
  (True, False) -> WinO
  (False, False) | draw board -> Draw 
                 | (not . possible) board -> Impossible 
                 | otherwise -> Ongoing