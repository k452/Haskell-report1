module Q6 where

data BETree a = BELeaf a | Nil | BENode a (BETree a) (BETree a) deriving (Eq, Show)

cataBETree :: Num a => (a -> b) -> b -> ((a, BETree a, BETree a) -> b -> b -> b) -> BETree a -> b
cataBETree p f g (BELeaf a) = p a
cataBETree p f g Nil = f
cataBETree p f g (BENode a lt rt) = g (a, lt, rt) (cataBETree p f g lt) (cataBETree p f g rt)

depthBETree :: Num a => BETree a -> Int
depthBETree = cataBETree (const 0) 0 (\_ ltRes rtRes -> 1 + max ltRes rtRes)

sumBETree :: (Num a, Eq a) => BETree a -> a
sumBETree = cataBETree id 0 (\(a, lt, rt) ltRes rtRes -> a + ltRes + rtRes)

upAccBETree :: (Num a, Eq a) => BETree a -> BETree a
upAccBETree = cataBETree BELeaf Nil (\(a, lt, rt) ltRes rtRes -> BENode (sumBETree (BENode a lt rt)) ltRes rtRes)
