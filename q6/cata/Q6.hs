module Q6 where

data BETree a = BELeaf a | Nil | BENode a (BETree a) (BETree a) deriving (Eq, Show)

cataBETree :: Num a => (a -> b) -> b -> (a -> b -> b -> b) -> BETree a -> b
cataBETree p f g (BELeaf a) = p a
cataBETree p f g Nil = f
cataBETree p f g (BENode a lt rt) = g a (cataBETree p f g lt) (cataBETree p f g rt)

depthBETree :: Num a => BETree a -> Int
depthBETree = cataBETree (const 0) 0 (\x lt rt -> 1 + max lt rt)

sumBETree :: (Num a, Eq a) => BETree a -> a
sumBETree = cataBETree id 0 (\a lt rt -> a + lt + rt)

upAccBETree :: (Num a, Eq a) => BETree a -> BETree a
upAccBETree a = cataBETree (\a -> BELeaf a) Nil (\a lt rt -> BENode (sumBETree a) lt rt) a

-- upAccBETree :: (Num a, Eq a) => BETree a -> BETree a
-- upAccBETree (BELeaf a) = BELeaf a
-- upAccBETree Nil = Nil
-- upAccBETree (BENode a lt rt) = BENode (sumBETree (BENode a lt rt)) (upAccBETree lt) (upAccBETree rt)
