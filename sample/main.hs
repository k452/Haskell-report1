main :: IO ()
main = do
  let x = 0
  let y = 8
  print (x `div` y :: Int)
  print (x `mod` y :: Int)