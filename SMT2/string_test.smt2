(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)

(define-fun Person ((o Int)) Bool
    (and (>= o 1) (<= o 10))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (first_name o)) 5)
            (str.in.re (first_name o) (re.* (re.range "a" "z")))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (last_name o)) 5)
            (str.in.re (last_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (not (= (first_name o) (last_name o)))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (= (email o) (str.++ (first_name o) "." (last_name o) "@mu.ie"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (str.suffixof "mu.ie" (email o))
    ))
)

(assert (exists ((o Int)) (Person o)))

; Ensure unique first_name values by appending the index
(assert (distinct 
    (str.++ (first_name 1) "1")
    (str.++ (first_name 2) "2")
    (str.++ (first_name 3) "3")
    ; Continue for other indices as needed
))

(check-sat)
(get-value ((first_name 1)(last_name 1)(email 1)))
(get-value ((first_name 2)(last_name 2)(email 2)))
(get-value ((first_name 3)(last_name 3)(email 3)))
