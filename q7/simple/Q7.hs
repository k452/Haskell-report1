module Q7 where

downTo0 :: Int -> [Int]
downTo0 x
  | x <= 0 = [0]
  | otherwise = x : downTo0 (x - 1)

zipPlus :: ([Float], [Float]) -> [Float]
zipPlus z
  | null x || null y = []
  | otherwise = (head x + head y) : zipPlus (tail x, tail y)
  where
    x = fst z
    y = snd z