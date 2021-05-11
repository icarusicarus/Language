{
module Tokens where
}

%wrapper "basic"

$digit = [0-9]
$alpha = [a-zA-Z]

tokens :-
    $white+        ;
    $digit+        { \s -> TokenInt (read s :: Int) }
    $alpha+        { \s -> TokenId (s) }
    \(             { \s -> TokenLP }
    \)             { \s -> TokenRP }

{
data Token
    = TokenInt Int
    | TokenId String
    | TokenLP
    | TokenRP
    deriving (Eq, Show)

}