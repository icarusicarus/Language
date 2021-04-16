{
module Tokens where
}

%wrapper "basic"

$digit = [0-9] 
$alpha = [a-zA-Z]

tokens :-  
  define         {\s -> T_Define}
  if             {\s -> T_If }
  cond           {\s -> T_Cond}
  else           {\s -> T_Else}
  cons           {\s -> T_Cons}
  car            {\s -> T_Car}
  cdr            {\s -> T_Cdr}
  read           {\s -> T_Read}
  write          {\s -> T_Write}
  display        {\s -> T_Display}
  quote          {\s -> T_Quote}
  $digit+        {\s -> T_Int (read s :: Int)}
  $alpha+        {\s -> T_Id (s)}
  \#t            {\s -> T_True }
  \#f            {\s -> T_False}
  \+             {\s -> T_Plus}
  \-             {\s -> T_Minus}
  \*             {\s -> T_Multi}
  \/             {\s -> T_Divid}
  \(             {\s -> T_LParen}
  \)             {\s -> T_RParen}
  \'             {\s -> T_QuoteSym}
  \.             {\s -> T_Dot}
  \>             {\s -> T_GT}
  \<             {\s -> T_LT}
  \#t            {\s -> T_True}
  \#f            {\s -> T_False}
  Null\?         {\s -> T_Null}
  Pair\?         {\s -> T_Pair}
  Atom\?         {\s -> T_Atom}
  Number\?       {\s -> T_Number}
  Eq\?           {\s -> T_Eq}
  \'\(\)         {\s -> T_EmptyL}
  $white+       ;
{
data Token
  = T_Int Int
  | T_Id String 
  | T_If
  | T_Cond
  | T_Else
  | T_Plus
  | T_Minus 
  | T_Multi
  | T_Divid   
  | T_LParen
  | T_RParen
  | T_GT
  | T_LT
  | T_Define
  | T_True
  | T_False
  | T_Null
  | T_Pair
  | T_Atom
  | T_Number
  | T_Eq
  | T_Cons
  | T_Car
  | T_Cdr
  | T_EmptyL
  | T_Read
  | T_Write
  | T_Display
  | T_Quote
  | T_QuoteSym
  | T_Dot
  deriving (Eq, Show)   
}