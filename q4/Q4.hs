module Q4 where

takeXiyjzk :: Int -> Int -> Int -> Int -> [Int]
takeXiyjzk 0 _ _ _ = []
takeXiyjzk k x y z = takeArray [] 1 k x y z

takeArray :: [Int] -> Int -> Int -> Int -> Int -> Int -> [Int]
takeArray a c k x y z
  | k == length a = a
  | judgeMultiple c x y z = takeArray (a ++ [c]) (c + 1) k x y z
  | otherwise = takeArray a (c + 1) k x y z

betweenXiyjzk :: Int -> Int -> Int -> Int -> Int -> [Int]
betweenXiyjzk 0 0 _ _ _ = []
betweenXiyjzk k1 k2 x y z = betweenArray [] 1 k1 k2 x y z

betweenArray :: [Int] -> Int -> Int -> Int -> Int -> Int -> Int -> [Int]
betweenArray a c k1 k2 x y z
  | c > k2 = a
  | c >= k1 && c <= k2 && judgeMultiple c x y z = betweenArray (a ++ [c]) (c + 1) k1 k2 x y z
  | otherwise = betweenArray a (c + 1) k1 k2 x y z

judgeMultiple :: Int -> Int -> Int -> Int -> Bool
judgeMultiple 1 _ _ _ = True
judgeMultiple n x y z
  | x /= 1 && n `mod` x == 0 && judgeMultiple (n `div` x) x y z = judgeMultiple (n `div` x) x y z
  | y /= 1 && n `mod` y == 0 && judgeMultiple (n `div` y) x y z = judgeMultiple (n `div` y) x y z
  | z /= 1 && n `mod` z == 0 && judgeMultiple (n `div` z) x y z = judgeMultiple (n `div` z) x y z
  | otherwise = False