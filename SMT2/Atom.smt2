(declare-fun Atom_name (Int) String)
(declare-fun Atom_weight (Int) Int)
(declare-fun Atom_Symbol (Int) String)
(declare-fun isNobelGas (Int) Bool)
(declare-fun isReactive (Int) Bool)

(define-fun Atom ((o Int)) Bool
    (and (>= o 1) (<= o 10))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (and
            (> (str.len (Atom_name o)) 5)
            (str.in.re (Atom_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (and
            (> (Atom_weight o) 0)
            (<= (Atom_weight o) 295)
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (= (Atom_Symbol o) (str.substr (Atom_name o) 0 2))
    ))
)


(assert 
    (forall ((o Int)) (=> (Atom o)
        (=> (isNobelGas o)
            (not (isReactive o))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (or (not (isNobelGas o)) (isReactive o))
    ))
)



(assert (exists ((o Int)) (Atom o)))

(assert (distinct 
    (str.++ (Atom_name 1) "1")
    (str.++ (Atom_name 2) "2")
    (str.++ (Atom_name 3) "3") 
     (str.++ (Atom_Symbol 1) "1") 
      (str.++ (Atom_Symbol 2) "2") 
       (str.++ (Atom_Symbol 3) "3") 
))

(assert (distinct 
    (Atom_weight 1)
    (Atom_weight 2)
    (Atom_weight 3)

))

(check-sat)
(get-value ((Atom_name 1) (Atom_weight 1)(Atom_Symbol 1)(isReactive 1)))
(get-value ((Atom_name 2) (Atom_weight 2)(Atom_Symbol 2)(isReactive 2)))
(get-value ((Atom_name 3)(Atom_weight 3)(Atom_Symbol 3)(isReactive 3)))

