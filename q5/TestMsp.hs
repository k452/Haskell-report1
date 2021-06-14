import Q5 (msp)
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
        "空リスト"
        (msp 0 0 2 3 4)
        []
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "10 30 2 3 5"
        (msp 10 30 2 3 5)
        [10, 12, 15, 16, 18, 20, 24, 25, 27, 30]
    )

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "1 10 1 2 3"
        (msp 1 10 1 2 3)
        [1, 2, 3, 4, 6, 8, 9]
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