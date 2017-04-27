{-# LANGUAGE FlexibleContexts #-}
module Boilerplate (makeMain, word, wholeLine)
where

import Text.ParserCombinators.Parsec
import System.IO hiding (try)
import System.Environment
import DataTypes (Case, SolvedCase)

-- This file uses some adapted 'boilerplate' code from http://brandon.si/code/haskell-boilerplate-for-google-codejam/


-- the input file will be parsed into a list of some type representing
-- individual cases to be solved by our algorithm:
type Input = [Case]

-- our algorithms will produce a list of some type SolutionCase:
type Solution = [SolvedCase]

-- we convert each solved case into a String, which is zipped with
-- the standard "Case #x: " strings for the final output
type Output = [String]




--------------------
-- IO BOILERPLATE --
--------------------


makeMain algorithm caseParser formatCase = do
    -- pass the input file name to our program:
    (f:_) <- getArgs
    file <- readFile f

    -- start parsing, solve problem, and prepare output:
    let inp = parseWith (mainParser caseParser) file
        solution = map algorithm inp
        solutionStrings = map formatCase solution
        outp = zipWith (++) prefixes solutionStrings

    -- write the prepared output to screen:
    putStr $ unlines outp


-- dies with error, or returns some datatype with our parsed data:
parseWith p = either (error . show) id . parse p ""

-- to begin parsing, we read in a line containing the number of test cases
-- to follow. We parse them with caseParser, returning a list:
mainParser :: Parser Case -> Parser Input
mainParser caseParser = do
    n <- word
    count (read n) caseParser
   <?> "mainParser"

-- strings to prepend to output:
prefixes = [ "Case #" ++ show n ++ ": " | n <- [1..]]



---------------------
-- VARIOUS PARSERS --
---------------------


-- -- LINE PARSERS -- --


-- a single line String, up to the newline:
wholeLine :: Parser String
wholeLine = manyTill anyChar (try newline) <?> "wholeLine"

-- parse a String with whitespace-separated values into [String]
whiteSepLine = manyTill spaceSepWord newline <?> "whiteSepLine"


-- -- WORD PARSERS -- --

-- a single word followed by whitespace (space, newline, etc.):
word = do
    w <- many1 nonWhite
    spaces
    return w
   <?> "word"

-- a single word followed by one or more ' ' characters (won't consume '\n')
spaceSepWord = do
    w <- many1 nonWhite
    many (char ' ')
    return w
   <?> "spaceSepWord"


-- e.g. "hello:world" ---> ("hello","world")
-- won't consume newlines
twoWordsSepBy c = do
    x <- manyTill nonWhite (try$ char c)
    y <- many1 nonWhite
    many (char ' ')
    return (x,y)
   <?> "twoWordsSepBy"


-- -- CHARACTER PARSERS -- --

-- nonWhitespace character:
nonWhite = noneOf " \v\f\t\r\n" <?> "nonWhite"
