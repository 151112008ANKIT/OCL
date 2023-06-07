(declare-const Animal_name String)
(declare-const Category String)
(declare-const laysEgg1 Bool)
(declare-const warmBlooded Bool)
(declare-const feedMilk Bool)
(declare-const Animal_code String)
(declare-fun Animal (Int) Bool)

(assert 
    (forall ((o Int)) (=> (Animal o)
        (and 
            (> (str.len Animal_name) 10)  
            (str.in.re Animal_name (re.* (re.range "a" "z")))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (or 
            (= Category "Mammals")
            (= Category "Birds")
            (= Category "Reptiles")
            (= Category "Amphibians")
            (= Category "Fish")
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (=> (= Category "Mammals") warmBlooded)
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (=> (= Category "Mammals") feedMilk)
    ))
)
(assert
    (forall ((o Int)) (=> (Animal o)
        (= Animal_code (str.at Category 0))
    ))
)

(assert (exists ((o Int)) (Animal o)))

(check-sat)
(get-value (Animal_name Category warmBlooded feedMilk Animal_code))
