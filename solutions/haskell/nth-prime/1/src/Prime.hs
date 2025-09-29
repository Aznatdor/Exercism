module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
    | n <= 0 = Nothing
    | otherwise = Just $ head $ sieve (n-1)


sieve :: Int -> [Integer]
sieve 0 = [2..]
sieve n = filter (\num -> 0/=(num `mod` prevPrime)) list
    where list = sieve (n-1)
          prevPrime = head list