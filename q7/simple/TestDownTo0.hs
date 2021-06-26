import Q7 (downTo0)
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
        "0"
        (downTo0 0)
        [0]
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "1"
        (downTo0 1)
        [1, 0]
    )

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "100"
        (downTo0 100)
        [100, 99 .. 0]
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