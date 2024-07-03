(declare-fun Oid (Int) Int)
(declare-fun Animal_name (Int) String)
(declare-fun Category (Int) String)
(declare-fun laysEgg1 (Int) Bool)
(declare-fun warmBlooded (Int) Bool)
(declare-fun feedMilk (Int) Bool)
(declare-fun Animal_code (Int) String)
(define-fun Animal ((o Int)) Bool true)


(assert 
    (forall ((o Int)) (=> (Animal o)
        (and 
            (> (str.len (Animal_name (Oid o))) 10)  
            (str.in.re (Animal_name (Oid o)) (re.* (re.union (re.range "a" "z") (re.range "A" "Z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (or 
            (= (Category (Oid o)) "Mammals")
            (= (Category (Oid o)) "Birds")
            (= (Category (Oid o)) "Reptiles")
            (= (Category (Oid o)) "Amphibians")
            (= (Category (Oid o)) "Fish")
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (= (warmBlooded (Oid o))
            (or (= (Category (Oid o)) "Mammals") (= (Category (Oid o)) "Birds"))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (=> (= (Category (Oid o)) "Mammals") (feedMilk (Oid o)))
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (ite 
            (or 
                (= (Category (Oid o)) "Birds") 
                (= (Category (Oid o)) "Amphibians") 
                (= (Category (Oid o)) "Fish") 
                (= (Category (Oid o)) "Reptiles")
            ) 
            (laysEgg1 (Oid o))
            (=> (= (Category (Oid o)) "Mammals") (not (laysEgg1 (Oid o))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (= (Animal_code (Oid o)) (str.at (Category (Oid o)) 0))
    ))
)

(assert (exists ((o Int)) (Animal o)))
(assert (distinct 
    (Animal_name (Oid 1))
    (Animal_name (Oid 2))
    (Animal_name (Oid 3))
    (Animal_name (Oid 4))
    (Animal_name (Oid 5))
    (Category (Oid 1))
    (Category (Oid 2))
    (Category (Oid 3))
    (Category (Oid 4))
    (Category (Oid 5))
))

(check-sat)
(get-value ((Animal_name (Oid 1)) (Category (Oid 1)) (warmBlooded (Oid 1)) (feedMilk (Oid 1)) (laysEgg1 (Oid 1)) (Animal_code (Oid 1))))
(get-value ((Animal_name (Oid 2)) (Category (Oid 2)) (warmBlooded (Oid 2)) (feedMilk (Oid 2)) (laysEgg1 (Oid 2)) (Animal_code (Oid 2))))
(get-value ((Animal_name (Oid 3)) (Category (Oid 3)) (warmBlooded (Oid 3)) (feedMilk (Oid 3)) (laysEgg1 (Oid 3)) (Animal_code (Oid 3))))
(get-value ((Animal_name (Oid 4)) (Category (Oid 4)) (warmBlooded (Oid 4)) (feedMilk (Oid 4)) (laysEgg1 (Oid 4)) (Animal_code (Oid 4))))
(get-value ((Animal_name (Oid 5)) (Category (Oid 5)) (warmBlooded (Oid 5)) (feedMilk (Oid 5)) (laysEgg1 (Oid 5)) (Animal_code (Oid 5))))
