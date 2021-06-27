module Q2 where

recursion :: [Int] -> Int -> Int
recursion [] _ = 0
recursion all@(x : xs) v
  | null all = 0
  | v == 0 = last all
  | otherwise = (v ^ (length all - 1)) * x + recursion xs v

foldlVersion :: [Int] -> Int -> Int
foldlVersion [] _ = 0
foldlVersion a x
  | null a = 0
  | x == 0 = last a
  | otherwise = culc (culcWrapper a) x

culcWrapper :: [Int] -> [(Int, Int)]
culcWrapper [] = []
culcWrapper all@(x : xs)
  | length all == 1 = [(length all - 1, head all)]
  | otherwise = (length all - 1, x) : culcWrapper xs

culc :: [(Int, Int)] -> Int -> Int
culc a x = foldl (\x a -> x ^ fst a * snd a) x a