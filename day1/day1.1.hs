import Data.List.Split
import Data.Char (isSpace)

main = do
    elves <- readElves <$> getContents
    print (maximum $ totalCalories elves)
    where
      totalCalories = map sum
      readElf = map read . splitOn "\n"
      readElves = map readElf . splitOn "\n\n" . rstrip
      rstrip = reverse . dropWhile isSpace . reverse
