import Q5 (mss)
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
        (mss 0 0 2 3 4)
        []
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "[3, -4, 2, -1, 6, -3]"
        (mss [3, -4, 2, -1, 6, -3])
        7
    )

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "1 10 1 2 3"
        (mss 1 10 1 2 3)
        [1, 2, 3, 4, 6, 8, 9]
    )

main :: IO Test.HUnit.Counts
main =
  runTestTT
    ( test
        [ TestLabel "case1" case1,
          - estLabel "case2" case2
          --TestLabel "case3" case3
        ]
    )