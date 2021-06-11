module Q3 where

import Data.List (sort)

removeDuplicate :: [Double] -> [Double]
removeDuplicate [] = []
removeDuplicate all@(x : xs)
  | null all = []
  | length all == 1 = all
  | x == head xs = removeDuplicate xs
  | otherwise = x : removeDuplicate xs

merge3 :: [Double] -> [Double] -> [Double] -> [Double]
merge3 [] [] [] = []
merge3 x y z = removeDuplicate (sort (x ++ y ++ z))