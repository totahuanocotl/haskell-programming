module Chapter04.Tests
  ( chapter04
  ) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Chapter04.Chapter04

chapter04 :: TestTree
chapter04 = testGroup "Chapter 04"
  [ q1
  , q2
  , q3
  , q4
  , q5
  , q6
  , q7
  , q8
  , q9
  , q10
  , correctingSyntax
  , matchFunctionsNamesToTypes
  ]

correctingSyntax :: TestTree
correctingSyntax = testGroup "Correcting Syntax"
  [ testCase "1) f' \"abc\" @?= 4 " $ f' "abc" @?= 4
  , testCase "2) id' \"abc\" @?= \"abc\"" $ id' "abc" @?= "abc"
  , testCase "3) head' \"abc\" @?= 'a'" $ head' "abc" @?= 'a'
  , testCase "4) first' (1, 2) @?= 1" $ first' (1, 2)  @?= 1
  ]

matchFunctionsNamesToTypes :: TestTree
matchFunctionsNamesToTypes = testGroup "Match Function Names To Their Types"
  [ testCase "1,c) t:show :: Show a => a -> String" ? True @?= True
  , testCase "2,b) t:(==) :: Eq a => a -> a -> Bool" ? True @?= True
  , testCase "3,a) t:(fst) :: (a, b) -> a" ? True @?= True
  , testCase "4,d) t:(+) :: Num a => a-> a -> a" ? True @?= True
  ]


q1 :: TestTree
q1 = testGroup "1"
  [ testCase "1) length :: [a] -> Int" $ True @?= True ]

q2 :: TestTree
q2 = testGroup "2"
  [ testCase "1) length [1, 2, 3, 4, 5]          == 5" $ length [1, 2, 3, 4, 5]          @?= 5
  , testCase "2) length [(1, 2), (2, 3), (3, 4)] == 3" $ length [(1, 2), (2, 3), (3, 4)] @?= 3
  , testCase "3) length allAwesome               == 2" $ length allAwesome               @?= 2
  , testCase "4) length (concat allAwesome)      == 5" $ length (concat allAwesome)      @?= 5
  ]

q3 :: TestTree
q3 = testGroup "3"
  [ testCase "6 / 3                == 2"  $ 6 / 3 @?= 2
  , testCase "6 / length [1, 2, 3] == Error, length is not Fractional " $ False @?= False
  ]

q4 :: TestTree
q4 = testGroup "4"
 [ testCase "6 `div` length [1, 2, 3] == 2 " $ 6 `div` length [1, 2, 3] @?= 2 ]

q5 :: TestTree
q5 = testGroup "5"
 [ testCase ":t 2 + 3 == 5 :: Bool" $ True       @?= True
 , testCase "2 + 3 == 5 == True"    $ 2 + 3 == 5 @?= True
 ]

q6 :: TestTree
q6 = testGroup "6 let x = 5"
 [ testCase ":t x + 3 == 5 :: Bool" $ True @?= True
 , testCase "x + 3 == 5 == False" $ do
    let x = 5
    x + 3 == 5 @?= False
 ]

q7 :: TestTree
q7 = testGroup "7"
 [ testCase "(length allAwesome == 2)  == True"               $ length allAwesome == 2 @?= True
 , testCase "length [1, 'a', 3, 'b']   == Error, diff types " $ False                  @?= False
 , testCase "(length allAwesome + length allAwesome) == 4"   $ length allAwesome + length allAwesome @?= 4
 , testCase "((8 == 8) && ('b' < 'a')) == False"   $ (8 == 8) && ('b' < 'a') @?= False
 , testCase "((8 == 8) && 9)           == Error, bool required"   $ False @?= False
 ]

q8 :: TestTree
q8 = testGroup "8"
 [ testCase "isPalindrome \"blah\"    == False" $ isPalindrome "blah"    @?= False
 , testCase "isPalindrome \"blahalb\" == True"  $ isPalindrome "blahalb" @?= True
 ]

q9 :: TestTree
q9 = testGroup "9"
 [ testCase "myAbs 9    == 9" $ myAbs 9    @?= 9
 , testCase "myAbs 0 == 0" $ myAbs 0 @?= 0
 , testCase "myAbs (-9) == 9" $ myAbs (-9) @?= 9
 , testCase "myAbs (-0) == 0" $ myAbs (-0) @?= 0
 ]

q10 :: TestTree
q10 = testGroup "10"
 [ testCase "f ('a', 'b') ('c', 'd') == (('b', 'd'), ('a', 'c'))" $ f ('a', 'b') ('c', 'd')     @?= (('b', 'd'), ('a', 'c'))
 , testCase "f ('a', 1) (\"cs\", True) == ((1, True),  ('a', \"cs\"))" $ f ('a', 1) ("cs", True) @?= ((1, True), ('a', "cs"))
 ]

