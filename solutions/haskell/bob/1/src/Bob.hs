module Bob (responseFor) where

filterSpaces :: String -> String
filterSpaces str = [c | c <- str, not (c `elem` "\n\r \t")]

filterChars :: String -> String
filterChars str = let chars = ['a'..'z'] ++ ['A'..'Z'] in [c | c <- str, c `elem` chars]

yell :: String -> Bool
yell (x:[]) = x `elem` ['A'..'Z']
yell (x:xs) = (x `elem` ['A'..'Z']) && yell xs
yell [] = False

responseFor :: String -> String
responseFor xs
  | question && shout = "Calm down, I know what I'm doing!"
  | question = "Sure."
  | shout = "Whoa, chill out!"
  | silence = "Fine. Be that way!"
  | otherwise = "Whatever."
  where shout = (yell (filterChars (filterSpaces xs)))
        question = let filtered = filterSpaces xs in (filtered /= []) && ((last filtered) == '?')
        silence = ((filterSpaces xs) == [])