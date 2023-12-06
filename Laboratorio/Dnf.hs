module Dnf
-- dnf
where


data Literal v  = Lpos v | Lneg v
                    deriving (Eq,Show)

data Termino v  = Termino [Literal v]
                    deriving (Eq,Show)

data Dnf v      = Dnf [Termino v]
                    deriving (Eq,Show)

--ejemplo
l1= Lpos "x"
l2= Lneg "y"
l3= Lneg "z"

t1= Termino [l1,l2, Lneg "x"]
t2= Termino [l1,l3, Lneg "x"]
t3= Termino [l2,l3, Lpos "y"]

f1 :: Dnf String
f1 = Dnf [t1,t2,t3]

compLit l = case l of
                 Lpos x -> Lneg x
                 Lneg x -> Lpos x

sonComp l1 l2 = l1 == (compLit l2)

--tieneLitComp :: Termino String -> Bool
tieneLitComp (Termino ll) = case ll of
                               []   -> False
                               l:ll' -> if (compLit l) `elem` ll'
                                          then True
                                          else (tieneLitComp (Termino ll'))


tieneUnterminoSinComp (Dnf lt) =
    case lt of
        []      -> False
        t:lt'   -> if not(tieneLitComp t)
                        then True
                        else tieneUnterminoSinComp (Dnf lt')



esSatisfactible f = tieneUnterminoSinComp f

