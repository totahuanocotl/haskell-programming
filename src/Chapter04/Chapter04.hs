module Chapter04.Chapter04 where

awesome     = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome  = [awesome, alsoAwesome]

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

myAbs :: Integer -> Integer
myAbs x = if x < 0 then negate x else x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f l r = ( (snd l, snd r), (fst l, fst r) )

x = (+)
f' xs = w `x` 1
  where w = length xs

id' :: a -> a
id' = \x -> x

head' :: [a] -> a
head' = \(x:xs) -> x

first' :: (a, b) -> a
first' (x, y) = x
