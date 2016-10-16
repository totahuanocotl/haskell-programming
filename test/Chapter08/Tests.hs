module Chapter08.Tests
  ( chapter08
  ) where
import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Chapter08.Chapter08
import Chapter08.WordNumber

chapter08 :: TestTree
chapter08 = testGroup "Chapter 08"
  [ reviewOfTypes
  , reviewOfCurrying
  , recursion
  , dividedByTest
  , mcCarthy91
  , numbersIntoWords
  , digitsTest
  , wordNumberTest
  ]

wordNumberTest :: TestTree
wordNumberTest = testGroup "Word Number"
  [testCase "12324546 == \"one-two-three-two-four-five-four-six\""
     $ wordNumber 12324546 @?= "one-two-three-two-four-five-four-six"
  ]

digitsTest :: TestTree
digitsTest = testGroup "Digits"
  [testCase "9876543210 == [9,8,7,6,5,4,3,2,1,0]"
     $ digits 9876543210 @?= [9,8..0]
  ]

numbersIntoWords :: TestTree
numbersIntoWords = testGroup "Numbers into words"
  [testCase "digitToWords"
     $ map digitToWord [0..9] @?= ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  ]

mcCarthy91 :: TestTree
mcCarthy91 = testGroup "McCarthy 91"
  [testCase "map mc91 [95..110] == [91,91,91,91,91,91,91,92,93,94,95,96,97,98,99,100]"
     $ map mc91 [95..110] @?= [91,91,91,91,91,91,91,92,93,94,95,96,97,98,99,100]
  ]

dividedByTest :: TestTree
dividedByTest = testGroup "fixing dividedBy"
  [ testCase "dividedBy 10 2 == 5"       $ dividedBy 10 2       @?= DivideResult (5,0)
  , testCase "dividedBy 10 (-2) == -5"   $ dividedBy 10 (-2)    @?= DivideResult (-5,0)
  , testCase "dividedBy (-10) (-2) == 5" $ dividedBy (-10) (-2) @?= DivideResult (5,0)
  , testCase "dividedBy (-10) 2 == 5"    $ dividedBy (-10) 2    @?= DivideResult (-5,0)
  , testCase "dividedBy 10 0 == DivideByZero" $ dividedBy 10 0  @?= DivideByZero
  ]

recursion :: TestTree
recursion = testGroup "recursion"
  [ testCase "2) sumTo 5 == 15"     $ sumTo 5 @?= 15
  , testCase "3) mult 5 3 == 15"    $ mult 5 3 @?= 15
  , testCase "3) mult -5 3 == 15"   $ mult (-5) (-3) @?= 15
  , testCase "3) mult -5 -3 == -15" $ mult (-5) 3 @?= -15
  , testCase "3) mult 5 -3 == -15"  $ mult 5 (-3) @?= -15
   ]

reviewOfCurrying :: TestTree
reviewOfCurrying = testGroup "review of currying"
  [ testCase "1) appedCatty \"woohoo!\" == \"woops mrow woohoo!\"" $ appedCatty "woohoo!" @?= "woops mrow woohoo!"
  , testCase "2) frappe \"1\" == \"1 mrow haha\"" $ frappe "1" @?= "1 mrow haha"
  , testCase "3) frappe (appedCatty \"2\" == \"woops mrow 2 mrow haha\"" $ frappe (appedCatty "2") @?= "woops mrow 2 mrow haha"
  , testCase "4) appedCatty (frappe \"blue\" == \"woops mrwo blue mrow haha\"" $ appedCatty (frappe "blue") @?= "woops mrow blue mrow haha"
  , testCase "5) cattyConny (frappe \"pink\") (cattyConny \"green\" (appedCatty \"blue\")) == \"pink mrow haha mrow green mrow woops mrow blue\""
             $ cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue")) @?= "pink mrow haha mrow green mrow woops mrow blue"
  , testCase "4) cattyConny (flippy \"Pugs\" \"are\") \"awesome\" == \"are mrow Pugs mrow awesome\""
             $ cattyConny (flippy "Pugs" "are") "awesome" @?= "are mrow Pugs mrow awesome"
  ]

reviewOfTypes :: TestTree
reviewOfTypes = testGroup "review Of Types"
  [ testCase "1, d) [[Bool]]" $ True @?= True
  , testCase "2, b) [[3 == 3], [6 > 5], [3 < 4]]" $ True @?= True
  , testCase "3, a && b" $ True @?= True
  , testCase "4, b)" $ True @?= True
  ]