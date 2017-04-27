module Main where

import Boilerplate
import DataTypes (Case, SolvedCase)
import Text.ParserCombinators.Parsec

-- This file uses some adapted 'boilerplate' code from http://brandon.si/code/haskell-boilerplate-for-google-codejam/

makeWord :: String -> String -> String
makeWord [] (l:ls) = makeWord [l] ls
makeWord (s:ss) (l:ls)
  | l >= s = makeWord (l:s:ss) ls
  | otherwise = makeWord ((s:ss) ++ [l]) ls
makeWord s [] = s

algorithm :: Case -> SolvedCase
algorithm = makeWord []

caseParser :: Parser Case
caseParser = word


formatCase :: SolvedCase -> String
formatCase = id

main :: IO ()
main = makeMain algorithm caseParser formatCase
