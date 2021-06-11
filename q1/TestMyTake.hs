import Q1 (myTake)
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
        "シンプルな例"
        (myTake 2 [3, 4, 5, 6])
        [3, 4]
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "空リスト"
        (myTake 3 [])
        []
    )

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "要素数1のリスト"
        (myTake 0 [2])
        []
    )

case4 :: Test
case4 =
  TestCase
    ( assertEqual
        "nが要素数より大きい時"
        (myTake 2 [100])
        [100]
    )

case5 :: Test
case5 =
  TestCase
    ( assertEqual
        "n == 要素数-1"
        (myTake 3 [3, 4, 5, 6])
        [3, 4, 5]
    )

case6 :: Test
case6 =
  TestCase
    ( assertEqual
        "n == 要素数"
        (myTake 4 [3, 4, 5, 6])
        [3, 4, 5, 6]
    )

case7 :: Test
case7 =
  TestCase
    ( assertEqual
        "プリントのテストケース1"
        (myTake 3 [1 .. 5])
        [1 .. 3]
    )

case8 :: Test
case8 =
  TestCase
    ( assertEqual
        "プリントのテストケース2"
        (myTake 3 [1 .. 2])
        [1 .. 2]
    )

main :: IO Test.HUnit.Counts
main =
  runTestTT
    ( test
        [ TestLabel "case1" case1,
          TestLabel "case2" case2,
          TestLabel "case3" case3,
          TestLabel "case4" case4,
          TestLabel "case5" case5,
          TestLabel "case6" case6,
          TestLabel "case7" case7,
          TestLabel "case8" case8
        ]
    )