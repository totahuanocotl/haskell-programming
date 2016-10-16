module Chapter08.WordNumber where
import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord x = case x of
  0 -> "zero"
  1 -> "one"
  2 -> "two"
  3 -> "three"
  4 -> "four"
  5 -> "five"
  6 -> "six"
  7 -> "seven"
  8 -> "eight"
  9 -> "nine"

digits :: Int -> [Int]
digits = reverse . collectAll
  where collectAll = collect . (flip divMod 10)
        collect (0, y) = [y]
        collect (x, y) = y : collectAll x

wordNumber :: Int -> String
wordNumber = concat . intersperse "-" . map digitToWord . digits