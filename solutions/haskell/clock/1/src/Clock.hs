module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = addDelta hour min (Clock 0  0)

toString :: Clock -> String
toString (Clock hour min) = (convertInt hour) ++ ( ':':(convertInt min))
  where convertInt x = if x < 10 then '0':show x else show x

addDelta :: Int -> Int -> Clock -> Clock
addDelta deltaHour deltaMin (Clock hour min) =
  let totalMin = min + deltaMin
      newHour  = (hour + deltaHour + totalMin `div` 60) `mod` 24
      newMin   = totalMin `mod` 60
  in Clock newHour newMin