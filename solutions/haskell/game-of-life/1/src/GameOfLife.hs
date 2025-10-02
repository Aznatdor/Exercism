module GameOfLife (tick) where

tick :: [[Int]] -> [[Int]]
tick board =  [[convert i j | j <- [0..cols]] | i <- [0..rows]]
    where
            rows = (length board) - 1
            cols = (length $ head board) - 1
            convert i j
                    | (board !! i !! j) == 1 && (liveNeighbors `elem` [2,3])    = 1
                    | (board !! i !! j) == 0 && (liveNeighbors == 3)            = 1
                    | otherwise                                                 = 0
                    where liveNeighbors = calcNeighbors board i j


safeInd :: [[Int]] -> Int -> Int -> Maybe Int
safeInd matrix i j
    | (min i j < 0) || (i >= rows) || (j >= cols)   = Nothing
    | otherwise                                     = Just $ matrix !! i !! j
    where
        rows = length matrix
        cols = length $ head matrix


calcNeighbors :: [[Int]] -> Int -> Int -> Int
calcNeighbors board i j = length [() | (di, dj) <- neighbors, Just 1 <- [safeInd board (i+di) (j+dj)]]
    where neighbors = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]