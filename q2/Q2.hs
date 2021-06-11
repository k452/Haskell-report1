module Q2 where

recursion :: [Int] -> Int -> Int
recursion [] _ = 0
recursion all@(x : xs) v
  | null all = 0
  | v == 0 = last all
  | otherwise = (v ^ (length all - 1)) * x + recursion xs v

foldlVersion :: [Int] -> Int -> Int
foldlVersion [] _ = 0
foldlVersion all@(x : xs) v
  | null all = 0
  | v == 0 = last all
