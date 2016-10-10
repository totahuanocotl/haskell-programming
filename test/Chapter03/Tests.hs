module Chapter03.Tests
  ( chapter03
  ) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Chapter03.Chapter03
import Chapter03.Reverse

chapter03 :: TestTree
chapter03 = testGroup "Chapter 03"
  [ readingSyntax
  , buildingFunctions
  ]

readingSyntax :: TestTree
readingSyntax = testGroup "Reading Syntax 1"
  [ readingSyntax1
  , readingSyntax2
  ]

readingSyntax1 :: TestTree
readingSyntax1 = testGroup "1"
  [ testCase "a) concat [[1, 2, 3], [4, 5, 6]] == [1, 2, 3, 4, 5, 6]"  $ concat [[1, 2, 3], [4, 5, 6]] @?= [1, 2, 3, 4, 5, 6]
  , testCase "b) ++ [1, 2, 3] [4, 5, 6]        Error"                  $ False                         @?= False
  , testCase "c) (++) \"hello\" \" world\"         == \"hello world\"" $ (++) "hello" " world"         @?= "hello world"
  , testCase "d) [\"hello\" ++ \" world]          Error"               $ False                         @?= False
  , testCase "e) 4 !! \"hello\"                  Error"                $ False                         @?= False
  , testCase "f) (!!) \"hello\" 4                == 'o'"               $ (!!) "hello" 4                @?= 'o'
  , testCase "g) take \"4 lovely\"               Error"                $ False                         @?= False
  , testCase "h) take 3 \"awesome\"              ==\"awe\""            $ take 3 "awesome"              @?= "awe"
  ]

readingSyntax2 :: TestTree
readingSyntax2 = testGroup "2"
  [ testCase "a,d) concat [[1 * 6], [2 * 6], [3 * 6]] == [6, 12, 18]"     $ concat [[1 * 6], [2 * 6], [3 * 6]] @?= [6, 12, 18]
  , testCase "b,c) \"rain\" ++ drop 2 \"elbow\"           == \"rainbow\"" $ "rain" ++ drop 2 "elbow"           @?= "rainbow"
  , testCase "c,e) 10 * head [1, 2, 3]                == 10"              $ 10 * head [1, 2, 3]                @?= 10
  , testCase "d,a) take 3 \"Julie\") ++ (tail \"yes\")    == \"Jules\""   $ (take 3 "Julie") ++ (tail "yes")   @?= "Jules"
  , testCase "e,d) concat [tail [1, 2, 3], tail[...]]== [2, 3, 5, 6, 8, 9]" $ concat [ tail [1, 2, 3],
                                                                                       tail [4, 5, 6],
                                                                                       tail [7, 8, 9]]         @?= [2, 3, 5, 6, 8, 9]
  ]

buildingFunctions :: TestTree
buildingFunctions = testGroup "Building Functions"
  [ buildingFunctions1
  , buildingFunctions2
  , buildingFunctions3
  , buildingFunctions4
  , buildingFunctions5
  ]

buildingFunctions1 :: TestTree
buildingFunctions1 = testGroup "1"
  [ testCase "a) \"Curry is awesome\" ++ \"!\"" $ "Curry is awesome" ++ "!"  @?= "Curry is awesome!"
  , testCase "b) \"Curry is awesome!\" !! 4"    $ "Curry is awesome!" !! 4   @?= 'y'
  , testCase "c) drop 9 \"Curry is awesome!\""  $ drop 9 "Curry is awesome!" @?= "awesome!"
  ]

buildingFunctions2 :: TestTree
buildingFunctions2 = testGroup "2"
  [ testCase "a) surprise \"Curry is awesome\"" $ surprise "Curry is awesome" @?= "Curry is awesome!"
  , testCase "b) fourth \"Curry is awesome!\" " $ fourth "Curry is awesome!"  @?= 'y'
  , testCase "c) drop9 \"Curry is awesome!\""   $ drop9 "Curry is awesome!"   @?= "awesome!"
  ]

buildingFunctions3 :: TestTree
buildingFunctions3 = testGroup "3"
  [ testCase "thirdLetter \"Curry is awesome\" == 'r'" $ thirdLetter "Curry is awesome" @?= 'r'
  ]

buildingFunctions4 :: TestTree
buildingFunctions4 = testGroup "4"
  [ testCase "letterIndex 3  == 'r'" $ letterIndex 3 @?= 'r'
  ]

buildingFunctions5 :: TestTree
buildingFunctions5 = testGroup "5"
  [ testCase "rvrs \"Curry is awesome\"  == \"awesome is Curry\"" $ rvrs "Curry is awesome" @?= "awesome is Curry"
  ]