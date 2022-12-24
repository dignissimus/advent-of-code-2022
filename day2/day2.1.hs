import Data.List
import Data.Maybe
import Data.List.Split
import Data.Char
import Control.Monad

main = do
  input <- rtrim <$> getContents
  let results = readResults $ readRounds input
  print $ sum results
  where
    readResults = map readResult
    readResult = liftM2 (+) resultScore materialScore
    readRounds = map readRound . splitOn "\n"
    readRound = map readMaterial . splitOn " "
    readMaterial = fromJust . flip findIndex values . in2 . head
    resultScore [x, y] = (+3) . (*3) . subtract 1 . (`mod` 3) . (+1) $ (y - x) `mod` 3
    materialScore =  (+1) . (!!1)
    values = zip ['A' .. 'C'] ['X' .. 'Z']
    in2 x (a, b) =  a == x || b == x
    rtrim = reverse . dropWhile isSpace . reverse
