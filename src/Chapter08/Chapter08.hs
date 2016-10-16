module Chapter08.Chapter08 where

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- fill in the types
flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe ::  String -> String
frappe = flippy "haha"

sumTo :: (Eq a, Num a) => a -> a
sumTo x = sumTo' (x-1) x
  where sumTo' 0 acc = acc
        sumTo' y acc = sumTo' (y-1) (acc+y)

mult :: Integral a => a -> a -> a
mult 0 _ = 0
mult _ 0 = 0
mult x y = signed x y (mult' (abs x) (abs y) 0)
  where mult' a b acc
          | a == 0 = acc
          | otherwise = mult' (a-1) b (acc+b)

data DivideResult = DivideResult (Integer , Integer)
                  | DivideByZero
                  deriving (Show, Eq)

dividedBy :: Integer -> Integer -> DivideResult
dividedBy _ 0 = DivideByZero
dividedBy num denom = go (abs num) (abs denom) 0
  where go n d count
          | n < d = DivideResult (signed num denom count, n)
          | otherwise = go (n - d) d (count + 1)

signed :: Integral a => a -> a -> a -> a
signed a b c = if signum a == signum b then c else negate c

mc91 :: Integer -> Integer
mc91 x
  | x > 100   = x - 10
  | otherwise = mc91 $ mc91 $ (+11) x