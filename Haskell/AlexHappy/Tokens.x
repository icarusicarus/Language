{
    module Tokens where
}

%wrapper "basic"

$digit = 1-9
$zero = 0
$nega = \-

tokens :-
    $white+ ;
    $zero+  { \s -> TokenZero }
    $digit+ { \s -> TokenPos }
    $nega+  { \s -> TokenNeg}

{
data Token = TokenZero
            | TokenPos
            | TokenNeg deriving (Eq, Show)
}