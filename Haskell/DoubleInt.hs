module Main where

main = do
    putStrLn "Enter your number: "
    line <- getLine
    num <- return (read line)
    putStrLn (show (num * 2))