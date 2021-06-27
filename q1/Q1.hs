module Q1 where

myTake :: Int -> [Int] -> [Int]
myTake _ [] = []
myTake n all@(x : xs)
  | n > length all || n == length all = all
  | n == 0 = []
  | otherwise = x : myTake (n -1) xs

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile _ [] = []
myTakeWhile f all@(x : xs)
  | null all = []
  | f x = x : myTakeWhile f xs
  | otherwise = []

myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile _ [] = []
myDropWhile f all@(x : xs)
  | null all = []
  | f x = myDropWhile f xs
  | otherwise = all