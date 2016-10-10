module Chapter03.Chapter03 where

surprise :: [Char] -> [Char]
surprise x = x ++ "!"

fourth :: [Char] -> Char
fourth x = x !! 4

drop9 :: [Char] -> [Char]
drop9 y = drop 9 y

thirdLetter :: [Char] -> Char
thirdLetter = (!! 3)

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x

