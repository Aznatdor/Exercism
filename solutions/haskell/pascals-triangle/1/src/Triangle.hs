module Triangle (rows) where

pascalStep :: [Integer] -> [Integer]
pascalStep [1] = [1]
pascalStep (x:y:rest) = x+y : pascalStep (y:rest)

rows :: Int -> [[Integer]]
rows = reverse . pascalTriangle

pascalTriangle :: Int -> [[Integer]]
pascalTriangle 0 = []
pascalTriangle 1 = [[1]]
pascalTriangle n = (1: (pascalStep . head) prevLayers) : prevLayers
    where prevLayers = pascalTriangle (n-1) 