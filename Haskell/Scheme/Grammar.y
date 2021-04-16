{
module Grammar where
import Tokens
}

%name parseList
%tokentype { Token }
%error { parseError }

%token 
    integer    { T_Int $$ }
    id         { T_Id $$ }
    plus       { T_Plus } 
    minus      { T_Minus }
    multi      { T_Multi }
    divid      { T_Divid }
    quote      { T_Quote }
    quotesym   { T_QuoteSym }
    dot        { T_Dot }
    lparen     { T_LParen }
    rparen     { T_RParen }
    gt         { T_GT }
    lt         { T_LT }
    true       { T_True }
    false      { T_False }   
    define     { T_Define }  
    if         { T_If }
    cond       { T_Cond }
    else       { T_Else }
    'Null\?'   { T_Null }
    'Pair\?'   { T_Pair }
    'Atom\?'   { T_Atom }
    'Number\?' { T_Number }
    'Eq\?'     { T_Eq }
    cons       { T_Cons }
    car        { T_Car }
    cdr        { T_Cdr }
    read       { T_Read }
    write      { T_Write }
    display    { T_Display }
    '\'\(\)'   { T_EmptyL }
%%

SExp : List                 { $1 }
    | Atom                  { $1 }
    | Predicate             { $1 }
    | MkList                { $1 }
    | Symbol                { $1 }

List : lparen OpKeyword SExp SExp rparen    { HS_List $2 $3 $4 }               
    | lparen read Atom rparen               { HS_Read $3 }
    | lparen write Atom rparen              { HS_Write $3 }
    | lparen display Atom rparen            { HS_Display $3 }
    | VarDec                                { $1 }
    | FuncDec                               { $1 }
    | Conditional                           { $1 }

FuncDec : lparen define FuncHdr SExp rparen  { HS_Func $3 $4 }

FuncHdr : lparen Id Atoms rparen            { HS_FuncHdr $2 $3 }

VarDec : lparen define Id SExp rparen       { HS_List HS_Define $3 $4 }

Conditional : lparen if SExp SExp SExp rparen   { HS_If $3 $4 $5 }
            | lparen cond SerCases lparen else SExp rparen rparen   { HS_Cond $3 $6 }

SerCases : SerCases OneCase     { HS_SerCases $1 $2 }
        | OneCase               { $1 }

OneCase : lparen SExp SExp rparen   { HS_OneCase $2 $3 }

MkList : lparen cons ConsEle ConsEle rparen   { HS_List HS_Cons $3 $4 }
        | lparen car lparen cons ConsEle ConsEle rparen rparen { $5 }
        | lparen car Atom rparen { $3 }
        | lparen cdr lparen cons ConsEle ConsEle rparen rparen { $6 }
        | lparen cdr Atom rparen { $3 }

ConsEle : Atom              { $1 }
        | '\'\(\)'          { HS_EmptyL }
        | MkList            { $1 }

Symbol : quotesym BabySymb                  { $2 }
        | lparen quote BabySymb rparen      { $3 }

BabySymb : Atoms                            { $1 }
        | lparen Atoms rparen               { $2 }
        | lparen Atom dot Atom rparen       { HS_Dot $2 $4 }

Atoms : Atoms Atom                          { HS_Atoms $1 $2 }
        | Atom                              { $1 }

Atom : integer             { HS_Int $1 }
    | Id                   { $1 }
    | Bool                 { $1 }

Id  : id                   { HS_Id $1 }

Bool : true                { HS_Bool True }
    | false                { HS_Bool False }

OpKeyword : plus           { HS_Plus }
    | minus                { HS_Minus }
    | multi                { HS_Multi } 
    | divid                { HS_Divid }
    | gt                   { HS_GT }
    | lt                   { HS_LT }

Predicate : lparen 'Null\?' Atom rparen   { HS_Null $3 }
        | lparen 'Pair\?' Atom rparen   { HS_Pair $3 }
        | lparen 'Atom\?' Atom rparen   { HS_Atom $3 }
        | lparen 'Number\?' Atom rparen   { HS_Number $3 }
        | lparen 'Eq\?' Atom Atom rparen   { HS_Eq $3 $4 }

{
parseError :: [Token] -> a 
parseError _ = error "Parse error"

data Node = HS_List Node Node Node 
         | HS_If Node Node Node
         | HS_Cond Node Node
         | HS_SerCases Node Node
         | HS_OneCase Node Node
         | HS_Func Node Node
         | HS_FuncHdr Node Node
         | HS_Int Int
         | HS_Bool Bool
         | HS_Id String
         | HS_Divid
         | HS_Multi
         | HS_Plus
         | HS_Minus
         | HS_GT
         | HS_LT
         | HS_Define
         | HS_Null Node
         | HS_Pair Node
         | HS_Atom Node
         | HS_Number Node
         | HS_Eq Node Node
         | HS_Cons
         | HS_EmptyL
         | HS_Read Node
         | HS_Write Node
         | HS_Display Node
         | HS_Atoms Node Node
         | HS_Dot Node Node
         deriving (Show)

showInfo :: Node -> String 
showInfo (HS_List b c d) = (showInfo b) ++ "\n" ++ (showInfo c) ++ "\n" ++ (showInfo d) ++ "\n"  
showInfo (HS_Int x) = "Int (" ++ (show x) ++ ")"
showInfo (HS_Id x) = "Id (" ++ x ++ ")"
showInfo x = (show x)
showInfo (HS_Null a) = "Null? " ++ (showInfo a)
showInfo (HS_Pair a) = "Pair? " ++ (showInfo a)
showInfo (HS_Atom a) = "Atom? " ++ (showInfo a)
showInfo (HS_Number a) = "Number? " ++ (showInfo a)
showInfo (HS_Eq a b) = "Eq? " ++ (showInfo a) ++ " " ++ (showInfo b)
showInfo (HS_EmptyL) = "()"
showInfo (HS_Read a) = "HS_Read" ++ "\n" ++ (showInfo a)
showInfo (HS_Write a) = "HS_Write" ++ "\n" ++ (showInfo a)
showInfo (HS_Display a) = "HS_Display" ++ "\n" ++ (showInfo a)
}