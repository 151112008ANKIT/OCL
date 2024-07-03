(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)

(declare-fun Oid (Int) Int)
(declare-fun Atom_name (Int) String)
(declare-fun Atom_weight (Int) Int)
(declare-fun Atom_Symbol (Int) String)
(declare-fun isNobelGas (Int) Bool)
(declare-fun isReactive (Int) Bool)

(define-fun Atom ((o Int)) Bool
   true
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (and
            (> (str.len (Atom_name (Oid o))) 5)
            (str.in_re (Atom_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (and
            (> (Atom_weight (Oid o)) 0)
            (<= (Atom_weight (Oid o)) 295)
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (= (Atom_Symbol (Oid o)) (str.substr (Atom_name (Oid o)) 0 2))
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (=> (isNobelGas (Oid o))
            (not (isReactive (Oid o)))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (or (not (isNobelGas (Oid o))) (isReactive (Oid o)))
    ))
)

(assert (exists ((o Int)) (Atom o)))

(assert (distinct 
(Atom_name (Oid 1)) 
(Atom_name (Oid 2)) 
(Atom_name (Oid 3)) 
(Atom_name (Oid 4)) 
(Atom_name (Oid 5)) 
(Atom_name (Oid 6)) 
(Atom_name (Oid 7)) 
(Atom_name (Oid 8)) 
(Atom_name (Oid 9)) 
(Atom_name (Oid 10)) 
(Atom_name (Oid 11)) 
(Atom_name (Oid 12)) 
(Atom_name (Oid 13)) 
(Atom_name (Oid 14)) 
(Atom_name (Oid 15)) 
))

(assert (distinct 
(Atom_weight (Oid 1)) 
(Atom_weight (Oid 2)) 
(Atom_weight (Oid 3)) 
(Atom_weight (Oid 4)) 
(Atom_weight (Oid 5)) 
(Atom_weight (Oid 6)) 
(Atom_weight (Oid 7)) 
(Atom_weight (Oid 8)) 
(Atom_weight (Oid 9)) 
(Atom_weight (Oid 10)) 
(Atom_weight (Oid 11)) 
(Atom_weight (Oid 12)) 
(Atom_weight (Oid 13)) 
(Atom_weight (Oid 14)) 
(Atom_weight (Oid 15)) 
))

(check-sat)
(get-value ((Atom_name (Oid 1)) (Atom_weight (Oid 1)) (Atom_Symbol (Oid 1)) (isReactive (Oid 1))))
;(get-value ((Atom_name (Oid 2)) (Atom_weight (Oid 2)) (Atom_Symbol (Oid 2)) (isReactive (Oid 2))))
;(get-value ((Atom_name (Oid 3)) (Atom_weight (Oid 3)) (Atom_Symbol (Oid 3)) (isReactive (Oid 3))))
;(get-value ((Atom_name (Oid 4)) (Atom_weight (Oid 4)) (Atom_Symbol (Oid 4)) (isReactive (Oid 4))))
;(get-value ((Atom_name (Oid 5)) (Atom_weight (Oid 5)) (Atom_Symbol (Oid 5)) (isReactive (Oid 5))))
;(get-value ((Atom_name (Oid 6)) (Atom_weight (Oid 6)) (Atom_Symbol (Oid 6)) (isReactive (Oid 6))))
;(get-value ((Atom_name (Oid 7)) (Atom_weight (Oid 7)) (Atom_Symbol (Oid 7)) (isReactive (Oid 7))))
;(get-value ((Atom_name (Oid 8)) (Atom_weight (Oid 8)) (Atom_Symbol (Oid 8)) (isReactive (Oid 8))))
;(get-value ((Atom_name (Oid 9)) (Atom_weight (Oid 9)) (Atom_Symbol (Oid 9)) (isReactive (Oid 9))))
;(get-value ((Atom_name (Oid 10)) (Atom_weight (Oid 10)) (Atom_Symbol (Oid 10)) (isReactive (Oid 10))))
