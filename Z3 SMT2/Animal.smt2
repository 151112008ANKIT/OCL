(declare-fun Animal_name (Int) String)
(declare-fun Category (Int) String)
(declare-fun laysEgg1 (Int) Bool)
(declare-fun warmBlooded (Int) Bool)
(declare-fun feedMilk (Int) Bool)
(declare-fun Animal_code (Int) String)

(define-fun Animal ((o Int)) Bool
     (and (>= o 1) (<= o 15))
)

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
        (= (warmBlooded o)
            (or (= (Category o) "Mammals") (= (Category o) "Birds"))
        )
    ))
)


(assert
    (forall ((o Int)) (=> (Animal o)
        (=> (= (Category o) "Mammals") (feedMilk o))
    ))
)


(assert
    (forall ((o Int)) (=> (Animal o)
        (ite 
            (or 
                (= (Category o) "Birds") 
                (= (Category o) "Amphibians") 
                (= (Category o) "Fish") 
                (= (Category o) "Reptiles")
            ) 
            (laysEgg1 o)
            (=> (= (Category o) "Mammals") (not (laysEgg1 o)))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Animal o)
        (= (Animal_code o) (str.at (Category o) 0))
    ))
)

(assert (exists ((o Int)) (Animal o)))
(assert (distinct 
(Animal_name 1)
(Animal_name 2)
(Animal_name 3)
(Animal_name 4)
(Animal_name 5)
;(Animal_name 6)
;(Animal_name 7)
;(Animal_name 8)
;(Animal_name 9)
;(Animal_name 10)
;(Animal_name 11)
;(Animal_name 12)
;(Animal_name 13)
;(Animal_name 14)
;(Animal_name 15)
(Category 1)
(Category 2)
(Category 3)
(Category 4)
(Category 5)

))

(check-sat)
(get-value ((Animal_name 1) (Category 1) (warmBlooded 1) (feedMilk 1) (laysEgg1 1) (Animal_code 1)))
;(get-value ((Animal_name 2) (Category 2) (warmBlooded 2) (feedMilk 2) (laysEgg1 2) (Animal_code 2)))
;(get-value ((Animal_name 3) (Category 3) (warmBlooded 3) (feedMilk 3) (laysEgg1 3) (Animal_code 3)))
;(get-value ((Animal_name 4) (Category 4) (warmBlooded 4) (feedMilk 4) (laysEgg1 4) (Animal_code 4)))
;(get-value ((Animal_name 5) (Category 5) (warmBlooded 5) (feedMilk 5) (laysEgg1 5) (Animal_code 5)))
;(get-value ((Animal_name 6) (Category 6) (warmBlooded 6) (feedMilk 6) (laysEgg1 6) (Animal_code 6)))
;(get-value ((Animal_name 7) (Category 7) (warmBlooded 7) (feedMilk 7) (laysEgg1 7) (Animal_code 7)))
;(get-value ((Animal_name 8) (Category 8) (warmBlooded 8) (feedMilk 8) (laysEgg1 8) (Animal_code 8)))
;(get-value ((Animal_name 9) (Category 9) (warmBlooded 9) (feedMilk 9) (laysEgg1 9) (Animal_code 9)))
;(get-value ((Animal_name 10) (Category 10) (warmBlooded 10) (feedMilk 10) (laysEgg1 10) (Animal_code 10)))
;(get-value ((Animal_name 11) (Category 11) (warmBlooded 11) (feedMilk 11) (laysEgg1 11) (Animal_code 11)))
;(get-value ((Animal_name 12) (Category 12) (warmBlooded 12) (feedMilk 12) (laysEgg1 12) (Animal_code 12)))
;(get-value ((Animal_name 13) (Category 13) (warmBlooded 13) (feedMilk 13) (laysEgg1 13) (Animal_code 13)))
;(get-value ((Animal_name 14) (Category 14) (warmBlooded 14) (feedMilk 14) (laysEgg1 14) (Animal_code 14)))
;(get-value ((Animal_name 15) (Category 15) (warmBlooded 15) (feedMilk 15) (laysEgg1 15) (Animal_code 15)))
