module DnfTests
--
-- Author: mcb
--
where
---------------------------------------
--
import System.Random
--
--
import DnfSintaxis
--
import DnfSAT
--
import DnfRandom
--
---------------------------------------
--

--
-- Tests: --------------------------
l1 :: Literal String
l1= Lpos "x"
--
l2 :: Literal String
l2= Lneg "y"
--
l3 :: Literal String
l3= Lneg "z"
--
t1 :: Termino String
t1= Termino [l1,l2, Lneg "x"]
--
t2 :: Termino String
t2= Termino [l1,l3, Lneg "x"]
--
t3 :: Termino String
t3= Termino [l2,l3, Lpos "y"]
--
f1 :: Dnf String
f1 = Dnf [t1,t2,t3]
---------------------------------------
--

--
-- Tests: -----------------------------
--
--

dnf_20_10_10 :: Dnf String
dnf_20_10_10 = randomDnf (mkStdGen 9223372036854775807) 20 10 10
--                randomDnf gen0 termNum maxNumLit maxNumVar

--
esSATdnf_20_10_10 :: Bool
esSATdnf_20_10_10 = esSatisfactible dnf_20_10_10
--
dnf_2000_1000_1000 :: Dnf String
dnf_2000_1000_1000 = randomDnf (mkStdGen 9223372036854775807) 2000 1000 1000
--
esSatDnf_2000_1000_1000 :: Bool
esSatDnf_2000_1000_1000 = esSatisfactible dnf_2000_1000_1000
--
dnf_1000_1000_2000 :: Dnf String
dnf_1000_1000_2000 = randomDnf (mkStdGen 9223372036854775807) 1000 1000 2000
--
esSatDnf_1000_1000_2000 :: Bool
esSatDnf_1000_1000_2000 = esSatisfactible dnf_1000_1000_2000
--
esSatDnf_1000_1000_20000 :: Bool
esSatDnf_1000_1000_20000 =
    esSatisfactible $ randomDnf (mkStdGen 9223372036854775807) 1000 1000 20000
--
--
--
esSatDnf_20000_2000_1000 :: Dnf String
esSatDnf_20000_2000_1000 = randomDnf (mkStdGen 9223372036854775807) 20000 2000 1000
--
esSatDnf_20000_2000_100 :: Bool
esSatDnf_20000_2000_100 =
    esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 20000 2000 100)
--                   randomDnf gen0                         termNum maxNumLit maxNumVar
--
esSatDnf_1_10_2 :: Bool
esSatDnf_1_10_2 = esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 1 10 2)
-- False
--
esSatDnf_1_5_2 :: Bool
esSatDnf_1_5_2 = esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 1 5 2)
-- False
--
esSatDnf_1_4_2 :: Bool
esSatDnf_1_4_2 = esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 1 4 2)
-- True
esSatDnf_1_6_2 :: Bool
esSatDnf_1_6_2 = esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 1 6 2)
-- False
esSatDnf_10_6_2 :: Bool
esSatDnf_10_6_2 = esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 10 6 2)
-- True
esSatDnf_2_6_2 :: Bool
esSatDnf_2_6_2 = esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 2 6 2)
-- False
esSatDnf_20_60_20 :: Bool
esSatDnf_20_60_20 =
    esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 20 60 20)
-- True
esSatDnf_10_600_200 :: Bool
esSatDnf_10_600_200 =
    esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 10 600 200)
-- False
esSatDnf_100_6000_2000 :: Bool
esSatDnf_100_6000_2000 =
    esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 100 6000 2000)
-- True
esSatDnf_100_60000_20000 :: Bool
esSatDnf_100_60000_20000 =
    esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 100 60000 20000)
-- True
--
esSatDnf_10_60000_20000 :: Bool
esSatDnf_10_60000_20000 =
    esSatisfactible (randomDnf (mkStdGen 9223372036854775807) 10 60000 20000)
-- False
--

--
--
---------------------------------------
--

--
