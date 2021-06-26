import Q7 (zipPlus)
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
        "[3.1, 2.5, -0.6] [1.2, -5, 3, 1, 9]"
        (zipPlus ([3.1, 2.5, -0.6], [1.2, -5, 3, 1, 9]))
        [4.3, -2.5, 2.4]
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "[3.1, 2.5] [1.2, -5, 3, 1, 9]"
        (zipPlus ([3.1, 2.5], [1.2, -5, 3, 1, 9]))
        [4.3, -2.5]
    )

main :: IO Test.HUnit.Counts
main =
  runTestTT
    ( test
        [ TestLabel "case1" case1,
          TestLabel "case2" case2
        ]
    )