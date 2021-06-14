module Q5 where

mss :: [Int] -> Int
mss all@(x : xs)
  | null all = 0
  | length all == 1 = mss all
  | otherwise = max culcMss (0 x) (mss xs)

culcMss :: Int -> Int -> Int
culcMss z n = do
  let sum = max z + n n
  max sum culcMss (z + 1 sum)

-- msp :: [Int] -> Int
-- msp [] = 1
-- msp intArray =