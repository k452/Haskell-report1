import Q6 (BETree (BELeaf, BENode, Nil), depthBETree)
import Test.HUnit
  ( Assertable (assert),
    Counts,
    Test (TestCase, TestLabel),
    Testable (test),
    assertEqual,
    runTestTT,
  )

b1 :: BETree Integer
b1 = BELeaf 1

case1 :: Test
case1 =
  TestCase
    ( assertEqual
        "葉1枚"
        (depthBETree b1)
        0
    )

b2 :: BETree Integer
b2 = BENode 1 (BELeaf 2) Nil

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "葉2枚"
        (depthBETree b2)
        1
    )

b3 :: BETree Integer
b3 = BENode 1 (BENode 2 (BENode 3 (BELeaf 4) Nil) (BENode 5 (BELeaf 6) (BELeaf 7))) (BELeaf 8)

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "複雑1"
        (depthBETree b3)
        3
    )

b4 :: BETree Integer
b4 = BENode 5 (BENode 8 (BELeaf 3) (BENode 1 (BELeaf 7) Nil)) (BENode 6 (BENode 2 Nil (BELeaf 9)) (BELeaf 4))

case4 :: Test
case4 =
  TestCase
    ( assertEqual
        "プリントの例"
        (depthBETree b4)
        3
    )

main :: IO Test.HUnit.Counts
main =
  runTestTT
    ( test
        [ TestLabel "case1" case1,
          TestLabel "case2" case2,
          TestLabel "case3" case3,
          TestLabel "case4" case4
        ]
    )