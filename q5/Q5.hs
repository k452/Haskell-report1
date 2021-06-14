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
  | otherwise = max (msp xs) (calcProduct all)

calcProduct :: [Int] -> Int
calcProduct [] = 0
calcProduct all@(x : xs)
  | null all = 0
  | length all == 1 = head all
  | otherwise = max x (x * calcProduct xs)