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
        (msp [])
        0
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "[3, -4, 2, -1, 6, -3]"
        (msp [3, -4, 2, -1, 6, -3])
        144
    )

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "[3, -4, 2, 8]"
        (msp [3, -4, 2, 8])
        16
    )

case4 :: Test
case4 =
  TestCase
    ( assertEqual
        "[-5, -1, 6, 4, 9, -6, -7]"
        (msp [-5, -1, 6, 4, 9, -6, -7])
        45360
    )

case5 :: Test
case5 =
  TestCase
    ( assertEqual
        "[1, 2, 3, 2, -2, -1, 1, 2, 3, 2, 1, -2, 1]"
        (msp [1, 2, 3, 2, -2, -1, 1, 2, 3, 2, 1, -2, 1])
        288
    )

case6 :: Test
case6 =
  TestCase
    ( assertEqual
        "[1000, -200, 201]"
        (msp [1000, -200, 201])
        1000
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
          TestLabel "case6" case6
        ]
    )