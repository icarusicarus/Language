module Main where
import Data.List(intercalate)
import Grammar
import Tokens

main = do
    s <- getContents
    let ss = map show $ parseNums (alexScanTokens s)
    putStrLn $ intercalate " " ss