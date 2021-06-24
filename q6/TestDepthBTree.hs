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
        1
    )

b2 :: BETree Integer
b2 = BENode 1 (BELeaf 2) Nil

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "葉2枚"
        (depthBETree b2)
        2
    )

b3 :: BETree Integer
b3 = BENode 1 (BENode 2 (BENode 3 (BELeaf 4) Nil) (BENode 5 (BELeaf 6) (BELeaf 7))) (BELeaf 8)

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "複雑1"
        (depthBETree b3)
        4
    )

main :: IO Test.HUnit.Counts
main =
  runTestTT
    ( test
        [ TestLabel "case1" case1,
          TestLabel "case2" case2,
          TestLabel "case3" case3
        ]
    )