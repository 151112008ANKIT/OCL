(declare-const Atom_name String)
(declare-const Atomic_Weight Int)
(declare-const Atomic_Symbol String)
(declare-const isNobelGas1 Bool)
(declare-const isReactive1 Bool)
(declare-fun Atom (Int) Bool)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (and 
            (> (str.len Atom_name) 5)
            (str.in.re Atom_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Atom o)
        (and
            (= (str.substr Atom_name 0 2) Atomic_Symbol)
            (not (= Atom_name Atomic_Symbol))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Atom o)
        (> Atomic_Weight 0)
    ))
)

(assert
    (forall ((o Int)) (=> (Atom o)
        (=> isNobelGas1 (not isReactive1))
    ))
)

(assert (exists ((o Int)) (Atom o)))

(check-sat)
(get-value (Atom_name Atomic_Weight Atomic_Symbol isNobelGas1 isReactive1))
