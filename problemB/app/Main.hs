module Main where

import Boilerplate
import DataTypes (Case, SolvedCase)
import Text.ParserCombinators.Parsec

-- This file uses some adapted 'boilerplate' code from http://brandon.si/code/haskell-boilerplate-for-google-codejam/
import Data.List (group)

algorithm :: Case -> SolvedCase
algorithm pancakes = length $ group $ dropWhile (=='+') (reverse pancakes)

caseParser :: Parser Case
caseParser = word


formatCase :: SolvedCase -> String
formatCase = show

main :: IO ()
main = makeMain algorithm caseParser formatCase
