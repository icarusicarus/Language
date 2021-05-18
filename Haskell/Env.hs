module Main
where

newtype Program = Pgm Stmt
                deriving (Read, Show)
data Stmt = Seq Stmt Stmt
        | Assn Indent Expr
        | If BoolExpr Stmt Stmt
        deriving (Read, Show)
data Expr = Add Expr Expr
        | Sub Expr Expr
        | Mul Expr Expr
        | Div Expr Expr
        | Mod Expr Expr
        | Id Indent
        | N Int
        deriving (Read, Show)
data BoolExpr = Equ Expr Expr
            | Not BoolExpr
            deriving (Read, Show)
type Indent = Char
type Store = Indent -> Int

newstore :: Store
newstore id = 0

update :: Indent -> Int -> Store -> Store
update id val store = store'
        where store' id' | id' == id = val
                        | otherwise = store id'

pp :: Program -> Int -> Int
pp (Pgm stmt) n = ss stmt (update 'i' n newstore) 'o'

ss :: Stmt -> Store -> Store
ss (Seq c1 c2) s = ss c2 (ss c1 s)
ss (Assn id e) s = update id (ee e s) s
ss (If b c1 c2) s = if bb b s then ss c1 s else ss c2 s

ee :: Expr -> Store -> Int
ee (Add e1 e2) s = ee e1 s + ee e2 s
ee (Sub e1 e2) s = ee e1 s - ee e2 s
ee (Mul e1 e2) s = ee e1 s * ee e2 s
ee (Div e1 e2) s = ee e1 s `div` ee e2 s
ee (Mod e1 e2) s = ee e1 s `mod` ee e2 s
ee (Id id) s = s id
ee (N n) s = n

bb :: BoolExpr -> Store -> Bool
bb (Equ e1 e2) s = ee e1 s == ee e2 s
bb (Not b) s = not (bb b s)

pgm1 = Pgm (Seq
            (Assn 'o' (N 1))
            (If (Equ (Id 'i') (N 0))
            (Assn 'o' (N 3))
            (Assn 'o' (Add (Id 'o') (Id 'o')))))

main = do
    n <- getLine
    let ns = read n
    s <- getLine
    let ls = read s :: Program
    print $ pp ls ns