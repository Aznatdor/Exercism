module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import qualified Data.Map as M

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

convertChar :: Char -> Either String Nucleotide
convertChar c = case c of
  'A' -> Right A
  'C' -> Right C
  'G' -> Right G
  'T' -> Right T
  c   -> Left "error"

emptyCounts = M.fromList $ zip [A, C, G, T] [0,0..]
  
nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = foldl step (Right emptyCounts) xs
  where
  step :: Either String (Map Nucleotide Int) -> Char -> Either String (Map Nucleotide Int)
  -- On each step we either update the counter or return an error
  step (Left err) _ = Left err
  step (Right m) c =
    case convertChar c of
      Left err -> Left err -- If we get an error while converting, return the error
      Right nuc -> Right (M.adjust (+1) nuc m) -- If the curr char is the right nuc update the counter