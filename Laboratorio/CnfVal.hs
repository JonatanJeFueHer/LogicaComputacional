module CnfValidacion
    (
      esValida
    , tieneClausulaSinLitComp
    , tieneLitComp
    , compLit
    )
-- CNF Validation
-- Author: jjfh
--
where
--
import CnfSintaxis

---------------------------------------
--

--
compLit :: Literal v -> Literal v
compLit l = case l of
                 Lpos x -> Lneg x
                 Lneg x -> Lpos x
--

tieneLitComp :: Eq v => Clausula v -> Bool
tieneLitComp (Clausula ll) =
    case ll of
        []   -> False
        l:ll' -> if (compLit l) `elem` ll'
                    then True
                    else (tieneLitComp (Clausula ll'))
--

tieneClausulaSinLitComp :: Eq v => Cnf v -> Bool
tieneClausulaSinLitComp (Cnf lt) =
    case lt of
        []      -> False
        t:lt'   -> if not(tieneLitComp t)
                        then True
                        else tieneClausulaSinLitComp (Cnf lt')
--

esValida :: Eq v => Cnf v -> Bool
esValida f = not (tieneClausulaSinLitComp f)
--

