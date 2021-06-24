module Q6 where

data BETree a = BELeaf a | Nil | BENode a (BETree a) (BETree a) deriving (Eq, Show)

cataBETree :: Eq t => (t -> BETree a) -> (t -> BETree a -> BETree a -> BETree a) -> BETree t -> BETree a
cataBETree f g (BELeaf a) = f a
cataBETree f g Nil = Nil
cataBETree f g (BENode a lt rt)
  | lt == Nil = g a Nil (cataBETree f g rt)
  | rt == Nil = g a (cataBETree f g lt) Nil
  | otherwise = g a (cataBETree f g lt) (cataBETree f g rt)

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

upAccBETree :: (Num a, Eq a) => BETree a -> BETree a
upAccBETree (BELeaf a) = BELeaf a
upAccBETree Nil = Nil
upAccBETree (BENode a lt rt) = BENode (sumBETree (BENode a lt rt)) (upAccBETree lt) (upAccBETree rt)
