import System.Random
import Control.Monad

data Literal v  = Lpos v | Lneg v
                    deriving (Eq,Show)
makeBool :: Int -> IO [Bool]
makeBool n = replicateM n randomIO

useBoolList :: [Bool] -> String
useBoolList [] = ""
useBoolList (x:xs) = (if x == True then "T" else "F") ++ useBoolList xs

litRandom :: [Char] -> [Char] -> [Literal [Char]]
litRandom [] [] = []
litRandom _ [] = []
litRandom [] _ = []
litRandom (x:xs) (y:ys) = ((if x == 'T' then (Lpos [y]) else (Lneg [y])): litRandom xs ys)

main = do
    g <- newStdGen
    let n = take
    l <- makeBool 10
    let m = useBoolList l
    let s = take 10 $ (randomRs ('a', 'z') g)
    let q = litRandom m s
    print q
