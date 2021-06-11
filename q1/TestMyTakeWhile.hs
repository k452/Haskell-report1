import Q1 (myTakeWhile)
import Test.HUnit
  ( Assertable (assert),
    Counts,
    Test (TestCase, TestLabel),
    Testable (test),
    assertEqual,
    runTestTT,
  )

case1 :: Test
case1 =
  TestCase
    ( assertEqual
        "1~10の2以下を取得"
        (myTakeWhile (<= 2) [1 .. 10])
        [1 .. 2]
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "1~100の98以下を取得"
        (myTakeWhile (<= 98) [1 .. 100])
        [1 .. 98]
    )

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "空配列"
        (myTakeWhile (<= 98) [])
        []
    )

case4 :: Test
case4 =
  TestCase
    ( assertEqual
        "プリントのテストケース1"
        (myTakeWhile (< 3) [1 .. 6])
        [1 .. 2]
    )

case5 :: Test
case5 =
  TestCase
    ( assertEqual
        "プリントのテストケース2"
        (myTakeWhile (< 3) [1, 1, 1, 1])
        [1, 1, 1, 1]
    )

main :: IO Test.HUnit.Counts
main =
  runTestTT
    ( test
        [ TestLabel "case1" case1,
          TestLabel "case2" case2,
          TestLabel "case3" case3,
          TestLabel "case4" case4,
          TestLabel "case5" case5
        ]
    )