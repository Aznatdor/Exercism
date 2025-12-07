module SecretHandshake (handshake) where

wink :: Int -> String
wink n = case odd n of
  True -> "wink"
  _ -> ""

doubleBlink :: Int -> String
doubleBlink n = case odd $ n `div` 2 of
  True -> "double blink"
  _ -> ""

closeEyes :: Int -> String
closeEyes n = case odd $ n `div` 4 of
  True -> "close your eyes"
  _ -> ""

jump :: Int -> String
jump n = case odd $ n `div` 8 of
  True -> "jump"
  _ -> ""

handshake :: Int -> [String]
handshake n = case odd $ n `div` 16 of
  True -> reverse code
  _ -> code
  where code = filter (not . null) $ map ($ n) [wink, doubleBlink, closeEyes, jump]