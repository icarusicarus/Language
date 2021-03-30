{
module Grammar where
import Tokens
}

%name parseNums
%tokentype { Token }
%error { parseError }

%token
    zero    { TokenZero }
    pos     { TokenPos }
    nega    { TokenNeg }
%%

List: Num           {[$1]}
    | List Num      {$1++[$2]}
Num: pos            {Pos}
    | nega pos      {Neg}
    | zero          {Zero}

{
parseError :: [Token] -> a
parseError _= error "Parse Error"

data Num
        = Pos
        | Neg
        | Zero deriving Show
}