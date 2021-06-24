module Q6 where

data BETree a = BELeaf a | Nil | BENode a (BETree a) (BETree a) deriving (Eq, Show)

depthBETree :: Eq a => BETree a -> Int
depthBETree (BELeaf a) = 1
depthBETree Nil = 0
depthBETree (BENode a lt rt)
  | lt == Nil = 1 + depthBETree rt
  | rt == Nil = 1 + depthBETree lt
  | otherwise = 1 + max (depthBETree lt) (depthBETree rt)