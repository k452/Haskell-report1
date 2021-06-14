import Q4 (takeXiyjzk)
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
        "k == 0"
        (takeXiyjzk 0 1 2 3)
        []
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "10 2 3 5"
        (takeXiyjzk 10 2 3 5)
        [1, 2, 3, 4, 5, 6, 8, 9, 10, 12]
    )

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "1 100 200 300"
        (takeXiyjzk 1 100 200 300)
        [1]
    )

case4 :: Test
case4 =
  TestCase
    ( assertEqual
        "3 2 10000 30"
        (takeXiyjzk 3 2 10000 30)
        [1, 2, 4]
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