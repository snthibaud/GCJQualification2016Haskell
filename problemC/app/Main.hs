module Main where

import Boilerplate
import DataTypes (Case, SolvedCase, JamCoin)
import Text.ParserCombinators.Parsec

-- This file uses some adapted 'boilerplate' code from http://brandon.si/code/haskell-boilerplate-for-google-codejam/
import Math.NumberTheory.Primes.Factorisation (factorise)
import Data.Maybe (fromJust, isNothing)
import Data.List (intercalate)

value2Binary :: Int -> [Int]
value2Binary value
  | value > 0 = value `mod` 2:value2Binary (value `div` 2)
  | value == 0 = []

paddedBinary :: Int -> Int -> [Int]
paddedBinary size value =
  let
    binary = reverse . value2Binary $ value
    binarysize = length binary
    in replicate (size - binarysize) 0 ++ binary

makeJamCoinCandidate :: Int -> Int -> JamCoin
makeJamCoinCandidate size value = 1:paddedBinary (size-2) value ++ [1]

makeJamCoinCandidates :: Int -> [JamCoin]
makeJamCoinCandidates size = [makeJamCoinCandidate size value | value <- [0..2^(size-2)-1]]

getJamCoinValue :: Int -> JamCoin -> Integer
getJamCoinValue base jamcoin = sum [(toInteger base^i)*toInteger v | (i, v) <- zip [coinsize-1, coinsize-2..0] jamcoin]
  where
    coinsize = length jamcoin

getJamCoinFactor :: Int -> JamCoin -> Maybe Integer
getJamCoinFactor base jamcoin
  | null factors = Nothing
  | otherwise = Just v
  where
    (v,e):factors = factorise (getJamCoinValue base jamcoin)

getJamCoinFactors :: JamCoin -> [Int] -> Maybe [Integer]
getJamCoinFactors jamcoin [] = Just []
getJamCoinFactors jamcoin (b:bases)
  | isNothing jamcoinfactor = Nothing
  | isNothing jamcoinfactors = Nothing
  | otherwise = Just (fromJust jamcoinfactor:fromJust jamcoinfactors)
  where
    jamcoinfactor = getJamCoinFactor b jamcoin
    jamcoinfactors = getJamCoinFactors jamcoin bases

getJamCoinsWithFactors :: Int -> [JamCoin] -> [(JamCoin, [Integer])]
getJamCoinsWithFactors _ [] = []
getJamCoinsWithFactors 0 _ = []
getJamCoinsWithFactors count (c:candidates)
  | isNothing factors = getJamCoinsWithFactors count candidates
  | otherwise = (c, fromJust factors):getJamCoinsWithFactors (count-1) candidates
  where
    factors = getJamCoinFactors c [2..10]

algorithm :: Case -> SolvedCase
algorithm (size, count) = getJamCoinsWithFactors count (makeJamCoinCandidates size)

caseParser :: Parser Case
caseParser = do
  n <- word
  bffs <- whiteSepLine
  return (read bffs)


formatCase :: SolvedCase -> String
formatCase scase = "\n" ++ intercalate "\n" lines
  where
    lines = map (\(c, fs) -> concatMap show c ++ " " ++ unwords (map show fs)) scase

main :: IO ()
main = makeMain algorithm caseParser formatCase
