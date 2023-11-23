(declare-fun Animal_name (Int) String)
(declare-fun Category (Int) String)
(declare-fun laysEgg1 (Int) Bool)
(declare-fun warmBlooded (Int) Bool)
(declare-fun feedMilk (Int) Bool)
(declare-fun Animal_code (Int) String)
(declare-fun Animal (Int) Bool)

(assert 
    (forall ((o Int)) (=> (Animal o)
        (and 
            (> (str.len (Animal_name o)) 10)  
            (str.in.re (Animal_name o) (re.* (re.union (re.range "a" "z") (re.range "A" "Z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (or 
            (= (Category o) "Mammals")
            (= (Category o) "Birds")
            (= (Category o) "Reptiles")
            (= (Category o) "Amphibians")
            (= (Category o) "Fish")
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (=> (= (Category o) "Mammals") (warmBlooded o))
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (=> (= (Category o) "Mammals") (feedMilk o))
    ))
)
(assert
    (forall ((o Int)) (=> (Animal o)
        (= (Animal_code o) (str.at (Category o) 0))
    ))
)

(assert (exists ((o Int)) (Animal o)))

(check-sat)
(get-value ((Animal_name 1) (Category 1) (warmBlooded 1) (feedMilk 1) (Animal_code 1)))
