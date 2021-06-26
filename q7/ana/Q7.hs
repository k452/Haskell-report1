module Q7 where

import Data.Bifunctor

-- p: 関数。p x がTrueなら空リストを返す
-- f: 関数。f x は配列のhead部
-- g: 関数。g x は次のanaListに渡すx
-- x: 使用する関数の引数

anaList :: (a -> Bool) -> (a -> b) -> (a -> a) -> a -> [b]
anaList p f g x
  | p x = []
  | otherwise = f x : anaList p f g (g x)

downTo0 :: Int -> [Int]
downTo0 = anaList (< 0) id (\x -> x -1)

zipPlus :: ([Float], [Float]) -> [Float]
zipPlus = anaList (\z -> null (fst z) || null (snd z)) (\z -> head (fst z) + head (snd z)) (Data.Bifunctor.bimap tail tail)