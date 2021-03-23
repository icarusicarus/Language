module Main where
import Data.List(intercalate)

data Weekdays = Mon | Tue | Wed | Thu | Fri | Sat | Sun
    deriving (Eq, Enum, Show)

data WeekdayKinds = Weekdays | Weekends
    deriving Show

weekdayKinds day =
    if day `elem` [Mon .. Fri] then Weekdays
    else Weekends

join = intercalate
main = do
    days <- return [Mon .. Sun]
    kindstr <- return (map(show.weekdayKinds)days)
    putStrLn $ join "\n" kindstr