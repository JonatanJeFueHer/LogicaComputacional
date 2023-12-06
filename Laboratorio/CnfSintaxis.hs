module CnfSintaxis
    (
      Cnf(..)
    , Clausula(..)
    , Literal(..)
    )
-- CNF sintaxis
-- Author: jjfh
--
where

data Literal v  = Lpos v | Lneg v
                    deriving (Eq, Show)

data Clausula v = Clausula [Literal v]
                    deriving (Eq, Show)

data Cnf v      = Cnf [Clausula v]
                    deriving (Eq, Show)
