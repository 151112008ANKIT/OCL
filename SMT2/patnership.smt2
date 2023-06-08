(declare-const father_name String)
(declare-const mother_name String)
(declare-const child_name String)
(declare-const Partner String)
(declare-const parent String)
(declare-const relationship_status String)
(declare-fun isPerson (Int) Bool)

; Constraint: Length and character pattern for father's name
(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len father_name) 15)  
            (str.in.re father_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

; Constraint: Length and character pattern for mother's name
(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len mother_name) 15)  
            (str.in.re mother_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

; Constraint: Length and character pattern for child's name
(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len child_name) 15)  
            (str.in.re child_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

; Constraint: Child's parent should be the father and mother
(assert
    (forall ((o Int)) (=> (isPerson o)
        (=> (and (= o 0) (= Partner "father") (= parent "child")) (= father_name child_name))
        (=> (and (= o 0) (= Partner "mother") (= parent "child")) (= mother_name child_name))
    ))
)

; Constraint: Generate parent's name as concatenation of father's name and mother's name
(declare-const parent_name String)
(assert (= parent_name (str.++ father_name " " mother_name)))

; Constraint: Set relationship as "Partners" between the father and mother
(assert (= relationship_status "Partners"))

(assert (exists ((o Int)) (isPerson o)))
(check-sat)
(get-value (father_name mother_name child_name parent_name relationship_status))
