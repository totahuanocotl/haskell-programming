module Chapter07.Chapter07 where

f7_2 :: Char -> String
f7_2 = undefined
g7_2 :: String -> [String]
g7_2 = undefined

f7_3 :: Ord a => a -> a -> Bool
f7_3 = undefined

f7_5 :: a-> a
f7_5 x = x

tensDigit :: Integral a => a -> a
tensDigit = snd . flip divMod 10 . flip div 10

hunsD :: Integral a => a -> a
hunsD = snd . flip divMod 10 . flip div 100

foldBool3 :: a -> a -> Bool -> a
foldBool3 x y True  = x
foldBool3 x y False = y

foldBoolCase :: a -> a -> Bool -> a
foldBoolCase a b c = case c of
  True  -> a
  False -> b

foldBoolGuard :: a -> a -> Bool -> a
foldBoolGuard a b c
  | c == True = a
  | otherwise = b


g7_3 :: (a -> b) -> (a , c) -> (b, c)
g7_3 f (x, y) = (f x, y)