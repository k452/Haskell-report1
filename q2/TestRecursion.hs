import Q2 (recursion)
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
        "x == 0"
        (recursion [1, 2, 3] 0)
        3
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "x^2 + x + 1 | x = 1"
        (recursion [1, 1, 1] 1)
        3
    )

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "x^4 + x + 1001 | x = 2"
        (recursion [1, 0, 0, 1, 1001] 2)
        1019
    )

case4 :: Test
case4 =
  TestCase
    ( assertEqual
        "null a[]"
        (recursion [] 1000)
        0
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