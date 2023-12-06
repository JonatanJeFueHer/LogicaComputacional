module DnfSAT
    (
      esSatisfactible
    -----------------------
    , tieneUnterminoSinComp
    , tieneLitComp
    , compLit
    )
-- DNF Satisfiability
-- Author: mcb
--
where
--
import DnfSintaxis

---------------------------------------
--

--
compLit :: Literal v -> Literal v
compLit l = case l of
                 Lpos x -> Lneg x
                 Lneg x -> Lpos x
--

--
-- sonComp :: Eq v => Literal v -> Literal v -> Bool
-- sonComp lit1 lit2 = lit1 == (compLit lit2)

--
tieneLitComp :: Eq v => Termino v -> Bool
tieneLitComp (Termino ll) =
    case ll of
        []   -> False
        l:ll' -> if (compLit l) `elem` ll'
                    then True
                    else (tieneLitComp (Termino ll'))
--

--
tieneUnterminoSinComp :: Eq v => Dnf v -> Bool
tieneUnterminoSinComp (Dnf lt) =
    case lt of
        []      -> False
        t:lt'   -> if not(tieneLitComp t)
                        then True
                        else tieneUnterminoSinComp (Dnf lt')
--

--
esSatisfactible :: Eq v => Dnf v -> Bool
esSatisfactible f = tieneUnterminoSinComp f
--

-- AGREGAR satisfactibilidad "normal" recursiva

---------------------------------------
--

