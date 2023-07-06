(set-logic QF_SLIA)
(set-option :produce-models true)

(declare-const Animal_name String)
(declare-const Category String)
(declare-const laysEgg1 Bool)
(declare-const warmBlooded Bool)
(declare-const feedMilk Bool)
(declare-const Animal_code String)

(assert (> (str.len Animal_name) 7))
(assert (str.in_re Animal_name (re.* (re.range "a" "z"))))

(assert
  (or 
    (= Category "Mammals")
    (= Category "Birds")
    (= Category "Reptiles")
    (= Category "Amphibians")
    (= Category "Fish")
  )
)

(assert
  (=> (= Category "Mammals") warmBlooded)
)

(assert
  (=> (= Category "Mammals") feedMilk)
)

(assert
  (= Animal_code (str.at Category 0))
)

(check-sat)
(get-value (Animal_name Category warmBlooded feedMilk Animal_code))
