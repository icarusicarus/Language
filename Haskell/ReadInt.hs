module Main where

main = do
    line <- getLine
    num <- return(read line :: Int)
    print num