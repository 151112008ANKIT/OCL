(declare-fun father_name (Int) String)
(declare-fun mother_name (Int) String)
(declare-fun child_name (Int) String)
(declare-fun Partner (Int) String)
(declare-fun parent (Int) String)
(declare-fun relationship_status (Int) String)
(declare-fun isPerson (Int) Bool)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len (father_name o)) 15)  
            (str.in.re (father_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len (mother_name o)) 15)  
            (str.in.re (mother_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len (child_name o)) 15)  
            (str.in.re (child_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (isPerson o)
        (=> (and (= o 0) (= (Partner o) "father") (= (parent o) "child")) (= (father_name o) (child_name o)))
        (=> (and (= o 0) (= (Partner o) "mother") (= (parent o) "child")) (= (mother_name o) (child_name o)))
    ))
)

(define-fun parent_name ((o Int)) String
    (str.++ (father_name o) " " (mother_name o))
)

(define-fun rel_status ((o Int)) String
    "Partners"
)

(assert (isPerson 0)) ; Adding an assertion to assign values to quantified variables
(check-sat)
(get-value ((father_name 0) (mother_name 0) (child_name 0) (rel_status 0) (parent_name 0)))
