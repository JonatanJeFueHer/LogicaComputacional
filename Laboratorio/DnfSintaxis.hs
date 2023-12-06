module DnfSintaxis
    (
      Dnf(..)
    , Termino(..)
    , Literal(..)
    )
-- DNF sintaxis
-- Author: mcb
--
where

data Literal v  = Lpos v | Lneg v
                    deriving (Eq,Show)

data Termino v  = Termino [Literal v]
                    deriving (Eq,Show)

data Dnf v      = Dnf [Termino v]
                    deriving (Eq,Show)
--

--
---------------------------------------
--
