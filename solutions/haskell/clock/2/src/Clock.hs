module Clock (addDelta, fromHourMin, toString) where

-- Store day time in minutes 
data Clock = Clock Int
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock $ (60*hour + min) `mod` (60 * 24)

toString :: Clock -> String
toString (Clock dayTime) = (convertInt $ dayTime `div` 60) ++ ( ':':(convertInt $ dayTime `mod` 60))
  where convertInt x = if x < 10 then '0':show x else show x

-- Add time delta and crop so that the time is valid day time
addDelta :: Int -> Int -> Clock -> Clock
addDelta deltaHour deltaMin (Clock dayTime) = Clock $ (dayTime + 60*deltaHour + deltaMin) `mod` (60 * 24)