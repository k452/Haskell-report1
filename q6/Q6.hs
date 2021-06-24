module Q6 where

data BETree a = BELeaf a | Nil | BENode a (BETree a) (BETree a) deriving (Eq, Show)

depthBETree :: (Ord a, Num a, Eq a) => BETree a -> a
depthBETree (BELeaf a) = 0
depthBETree Nil = 0
depthBETree (BENode a lt rt)
  | lt == Nil = 1 + depthBETree rt
  | rt == Nil = 1 + depthBETree lt
  | otherwise = 1 + max (depthBETree lt) (depthBETree rt)

sumBETree :: (Num a, Eq a) => BETree a -> a
sumBETree (BELeaf a) = a
sumBETree Nil = 0
sumBETree (BENode a lt rt)
  | lt == Nil = a + sumBETree rt
  | rt == Nil = a + sumBETree lt
  | otherwise = a + sumBETree lt + sumBETree rt
