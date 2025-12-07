module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = unlines $ map (unwords . map f) [[(i, j) | j <- [0..7]] | i <- [0..7]]
    where f (i, j) 
            | (Just (i, j)) == white = "W" 
            | (Just (i, j)) == black = "B"
            | otherwise = "_"


canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack queenA queenB = let
    diag1 = (fst queenA - snd queenA) == (fst queenB - snd queenB) 
    diag2 = (fst queenA + snd queenA) == (fst queenB + snd queenB)
    col = fst queenA == fst queenB
    row = snd queenA == snd queenB
    in any (==True) [diag1, diag2, col, row]
