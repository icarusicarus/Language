module Main where
import Data.List(intercalate)



data NumberKinds = Pos | Zero | Neg
    deriving Show

numberKinds number =
    if number>0 then Pos
    else if number<0 then Neg
    else Zero

join = intercalate

main = do
    line <- getLine
    let ns = map read (words line)::[Int]
    numbers <- return ns
    kindstr <- return (map(show.numberKinds)numbers)
    putStrLn $ join " " kindstr