{
module Grammar where
import Tokens
}

%name parseList
%tokentype { Token }
%error { parseError }

%attributetype { Attrs }
%attribute value { Integer }
%attribute depth { Int }

%token
    int { TokenInt $$ }
    id  { TokenId $$ }
    lparen { TokenLP }
    rparen { TokenRP }

%%

List: lparen sLst rparen  { $2; $$.depth = $2.depth + 1 }

sLst: Atom sLst     { Pair (Atom $1) $2
                    ; $$.depth = (max $1.depth $2.depth + 1) }
    |               { Atom AtomNil; $$.depth = 0 }

Atom: int           { AtomInt $1; $$.depth = 0 }
    | id            { AtomId $1; $$.depth = 0 }

{
parseError :: [Token] -> a
parseError _= error "Parse error"

data Sexp
    = Atom Atom
    | Pair Sexp Sexp
    deriving (Eq, Show)

data Atom
    = AtomInt Int
    | AtomId String
    | AtomSym Char
    | AtomNil
    deriving (Eq, Show)

showInfo (AtomInt x) = "Int (" ++ (show x) ++ ")"
}