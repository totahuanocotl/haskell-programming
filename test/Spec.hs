-- module Spec where
--
import Test.Tasty (defaultMain,testGroup,TestTree)
--
import Chapter02.Tests
import Chapter03.Tests
import Chapter04.Tests
import Chapter07.Tests
import Chapter08.Tests

main :: IO ()
main = defaultMain $ testGroup ""
  [ chapter08
--   , chapter07
--   , chapter02
--   , chapter03
--   , chapter04
  ]
