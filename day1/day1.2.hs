import Data.List
import Data.List.Split
import Data.Char (isSpace)

main = do
    elves <- readElves <$> getContents
    let calories = totalCalories elves
    print $ maximum calories
    print $ (sum . take 3 . reverse . sort) calories
    where
      totalCalories = map sum
      readElf = map read . splitOn "\n"
      readElves = map readElf . splitOn "\n\n" . rstrip
      rstrip = reverse . dropWhile isSpace . reverse
