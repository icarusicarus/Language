module Main where

main :: IO ()
main = do
    line <- getLine
    let ns = map read (words line)::[Int]
    let ss = map (^2) ns

    print (sum(ss))
