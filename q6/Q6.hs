module Q6 where

data BTree a = BLeaf a | BNode a (BTree a) (BTree a) deriving (Eq, Show)

data BETree a = BELeaf a | BENode a (TBENode a) (TBENode a)

data TBENode a = BETree a | IO ()

depthBETree :: BETree a -> a
depthBETree (BELeaf a) = 1
depthBETree (BENode a () rt) = depthBETree