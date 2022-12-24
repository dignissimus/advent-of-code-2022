import Data.Char
import Data.Set (fromList, intersection, elems)
import qualified Data.Set as Set
import Data.List.Split
import Data.Bifunctor
import Control.Arrow

priority character
    | isUpper character = 27 + ord character - ord 'A' 
    | otherwise         = 1 + ord character - ord 'a'

parts string = (left, right)
    where
    left = take half string
    right = drop half string
    half = length string `div` 2

solution = readRucksack >>> findDuplicates >>> readPriorities >>> sum
    where
    readRucksack = map2 fromList . parts
    findDuplicates = uncurry intersection
    readPriorities = elems . Set.map priority
    map2 f = bimap f f

solve = sum . map solution

main = do
    input <- splitOn "\n" <$> getContents
    let lines = removeEmptyLines input
    print $ solve lines
    where
    removeEmptyLines = filter (/=[])
