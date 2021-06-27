module Q5 where

mss :: [Int] -> Int
mss [] = 0
mss all@(x : xs)
  | length all == 1 = head all
  | otherwise = max (mss xs) (calcSum all)

calcSum :: [Int] -> Int
calcSum [] = 0
calcSum all@(x : xs)
  | null all = 0
  | length all == 1 = head all
  | otherwise = max x (x + calcSum xs)

msp :: [Int] -> Int
msp [] = 0
msp all@(x : xs)
  | length all == 1 = head all
  | otherwise = max (msp xs) (calcProduct all x x)

calcProduct :: [Int] -> Int -> Int -> Int
calcProduct [] _ _ = 0
calcProduct all@(x : xs) mini maxi
  | null all = 0
  | length all == 1 = head all
  | otherwise = do
    if x < 0
      then max x (x * calcProduct xs (min x (maxi * x)) (max x (mini * x)))
      else max x (x * calcProduct xs (min x (mini * x)) (max x (maxi * x)))