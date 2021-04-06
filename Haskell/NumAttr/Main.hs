module Main where
import Data.List(intercalate)
import Grammar
import Tokens


main = do
    s <- getContents
    let ls = map show $ parseList (alexScanTokens s)
    if null ls
        then putStrLn "[]"
        else putStrLn $ intercalate "\n" ls