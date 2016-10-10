module Chapter02.Tests
 ( chapter02
 ) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Chapter02.Chapter02

chapter02 :: TestTree
chapter02 = testGroup "Chapter 02"
  [ parenthesization
  , equivalentExpressions
  , funWithFunctions
  ]

parenthesization :: TestTree
parenthesization = testGroup "Parenthesization"
  [ testCase "2 + 2 * 3 - 3     == 2 + ( 2 * 3 ) - 3"       $ 2 + 2 * 3 - 3     @?= 2 + ( 2 * 3 ) - 3
  , testCase "(^) 10 $ 1 + 1    == ((^) 10) $ 1 + 1"        $ ((^) 10 $ 1 + 1 ) @?= (((^) 10) $ 1 + 1)
  , testCase "2 ^ 2 * 4 ^ 5 + 1 == ((2 ^ 2) * (4 ^ 5)) + 1" $ 2 ^ 2 * 4 ^ 5 + 1 @?= ((2 ^ 2) * (4 ^ 5)) + 1
  ]

equivalentExpressions :: TestTree
equivalentExpressions = testGroup "Equivalent Expressions"
  [ testCase "1 + 1       == 2"           $ 1 + 1 == 2                   @?= True
  , testCase "10 ^ 2      == 10 + 9 * 10" $ 10 ^ 2 == 10 + 9 * 10        @?= True
  , testCase "400 - 37    /= (-) 37 400"  $ 400 -37 == (-) 37 400        @?= False
  , testCase "100 `div` 3 /= 100 / 3 (does not compile)" $ False         @?= False
  , testCase "2 * 5 + 18  /= 2 * (5 + 18)" $ 2 * 5 + 18  == 2 * (5 + 18) @?= False
  ]

funWithFunctions :: TestTree
funWithFunctions = testGroup "More Fun With Functions"
  [ testCase "10 + waxOn   == 1135"   $ 10 + waxOn   @?= 1135
  , testCase "(+10) waxOn  == 1135"   $ (+10) waxOn  @?= 1135
  , testCase "(-) 15 waxOn == -1110"  $ (-) 15 waxOn @?= -1110
  , testCase "(-) waxOn 15 == 1110"   $ (-) waxOn 15 @?= 1110
  , testCase "triple waxOn == 3375"   $ triple waxOn @?= 3375
  , testCase "waxOff 10    == 30"     $ waxOff 10    @?= 30
  , testCase "waxOff (-50) == -150"   $ waxOff (-50) @?= -150
  ]
