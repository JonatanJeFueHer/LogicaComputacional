module DnfRandom
    (
      randomDnf
    , randomlist
    ---------------
    , termListTOdnf
    , randTermList
    , randLitList
    , randVarList
    )
-- Formulas DNF random
-- Author: mcb
where
--
import System.Random
-- Instalado con:
--      cabal install --lib random
--      Y tal vez (muy tardada):
--      curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh


--
--import Data.List
--
import DnfSintaxis
--

--
------------------------
--

--
randomlist :: StdGen -> Int -> Int -> Int -> ([Int], StdGen)
randomlist gen1 size m n = (take size randL,g2)
    where
    randL   = randomRs (m,n) gen1 -- Una lista de randoms en un rango (mn)
    (g2,_)  = split gen1
--

--
randVarList :: StdGen -> Int -> Int -> ([String], StdGen)
randVarList gen0 listSize maxVar = (["v"++(show i) | i <- indexL], g1)
    where
    (indexL,g1) = randomlist gen0 listSize 1 maxVar
--

--
litOf :: Int -> v -> Literal v
litOf signo v = if signo > 0
                then Lpos v
                else Lneg v
--

--
randLitList :: StdGen -> Int -> Int -> ([Literal String], StdGen)
randLitList gen0 listSize maxVar = ([litOf signo v | (signo,v) <- signoVarList], gen2)
    where
    (varList,gen1)  = randVarList gen0 listSize maxVar
    (signosL,gen2)  = randomlist  gen1 listSize 0 1
    signoVarList    = zip signosL varList
--

--
randTermList :: StdGen->Int->Int->Int -> ([[Literal String]], StdGen)
randTermList gen0 termNum maxNumLit maxNumVar =
    ([ fst(randLitList gen0 litListSize maxNumVar)
        | litListSize <- litListSizesList], gen1)
    where
    (litListSizesList,gen1) = randomlist gen0 termNum 1 maxNumLit
--

--
termListTOdnf :: ([[Literal String]], StdGen) -> Dnf String
termListTOdnf (termList, _) = Dnf (map Termino termList)
--

--
randomDnf :: StdGen->Int->Int->Int -> Dnf String
randomDnf gen0 termNum maxNumLit maxNumVar = termListTOdnf termList_Gen
    where
    termList_Gen = randTermList gen0 termNum maxNumLit maxNumVar
--

--
---------------------------------------
--
