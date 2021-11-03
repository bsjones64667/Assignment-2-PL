module Assignment2 where

import Data.List

------------------------------------------------
-- findFirst
------------------------------------------------
data Found = Match Int | NoMatch deriving Eq
instance Show Found where
  show (Match index) = "Found match at " ++ show index
  show NoMatch = "No match found!"
findFirst :: Eq a => (a -> Bool) -> [a] -> Found
findFirst eq x = findingIndex eq 0 x

findingIndex :: Eq a => (a -> Bool) -> Int -> [a] -> Found
findingIndex _ _ [] = NoMatch
findingIndex eq currIndex (x:xs)
    | eq x = Match currIndex
    | otherwise = findingIndex eq (currIndex + 1) xs

------------------------------------------------
-- runLengthEncode
------------------------------------------------
data RunLength = Span Integer Char deriving Eq
instance Show RunLength where
  show (Span length c) = "Length: " ++ show length ++ ": " ++ show c
runLengthEncode :: [Char] -> [RunLength]

runLengthEncode = map (\x -> Span (genericLength x) (head x)) . group
------------------------------------------------
-- palindrome
------------------------------------------------
palindrome :: [Char] -> Bool

palindrome [] = True
palindrome x = x == reverse x

------------------------------------------------
-- mergesort
------------------------------------------------
mergesort :: (Ord a) => (a -> a -> Bool) -> [a] -> [a]

mergesort _ [] = []
mergesort _ (x:[]) = [x]
mergesort ord x = merge ord (mergesort ord y) (mergesort ord z)
  where
  y = take ((length x) `div` 2) x
  z = drop ((length x) `div` 2) x

merge :: (Ord a) => (a -> a -> Bool) -> [a] -> [a] -> [a]

merge _ x [] = x
merge _ [] y = y
merge ord (x:xs) (y:ys)
    | ord x y = x : (merge ord xs (y:ys))
    | otherwise = y : (merge ord ys (x:xs))




