module Chapter07.Tests
  ( chapter07
  ) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Chapter07.Chapter07
import Chapter07.Arith4

chapter07 :: TestTree
chapter07 = testGroup "Chapter 07"
  [ multipleChoice_7
  , tensDigitTest
  , foldBoolTest
  , definition
  , roundTripTest
  , roundTripPrint
  ]

roundTripPrint :: TestTree
roundTripPrint = testGroup "6"
  [ testCase "print (roundTrip 4::Int)" $ roundTrip' 4 @?= roundTrip 4]

roundTripTest :: TestTree
roundTripTest = testGroup "5"
  [ testCase "roundTrip 4 == 4" $ roundTripPointfree 4 @?= roundTrip 4]

definition :: TestTree
definition = testGroup "3"
  [ testCase "g f (x, y) = (f x, y)" $ g7_3 (+1) (1, "a") @?= (2, "a")]

foldBoolTest :: TestTree
foldBoolTest = testGroup "2"
  [ testCase "foldBoolCase 1 2 True == 1"   $ foldBoolCase  1 2 True  @?= foldBool3 1 2 True
  , testCase "foldBoolCase 1 2 False == 2"  $ foldBoolCase  1 2 False @?= foldBool3 1 2 False
  , testCase "foldBoolGuard 1 2 True == 1"  $ foldBoolGuard 1 2 True  @?= foldBool3 1 2 True
  , testCase "foldBoolGuard 1 2 False == 2" $ foldBoolGuard 1 2 False @?= foldBool3 1 2 False
  ]

tensDigitTest :: TestTree
tensDigitTest = testGroup "1"
  [ testCase "returns the tends digit of a unit" $ tensDigit 9 @?= 0
  , testCase "returns the tends digit of tens" $ tensDigit 45 @?= 4
  , testCase "returns the tends digit of hundreds" $ tensDigit 735 @?= 3
  , testCase "returns the huns digit of a unit" $ tensDigit 9 @?= 0
  , testCase "returns the huns digit of tens" $ hunsD 45 @?= 0
  , testCase "returns the huns digit of hundreds" $ hunsD 735 @?= 7
  , testCase "returns the huns digit of thousands" $ hunsD 1535 @?= 5
  ]

multipleChoice_7 :: TestTree
multipleChoice_7 = testGroup "Multiple choice"
  [ testCase "1,d) may resolve to values of diff types" $ True @?= True
  , testCase "2, b) Char -> [String]" $ True @?= True
  , testCase "3, d) (Ord a, Num a) => a -> Bool" $ True @?= True
  , testCase "4, b) higher-order function" $ True @?= True
  , testCase "5, a) f True :: Bool" $ True @?= True
  ]

