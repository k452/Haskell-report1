import Q3 (merge3)
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
        (merge3 [] [] [])
        []
    )

case2 :: Test
case2 =
  TestCase
    ( assertEqual
        "1"
        (merge3 [0.0, 100.1] [2.3, 5.6] [1.456, 6.789])
        [0.0, 1.456, 2.3, 5.6, 6.789, 100.1]
    )

case3 :: Test
case3 =
  TestCase
    ( assertEqual
        "1つ目の例で重複が存在する場合"
        (merge3 [0.0, 0.0, 100.1] [2.3, 5.6] [1.456, 6.789])
        [0.0, 1.456, 2.3, 5.6, 6.789, 100.1]
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