(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)
(declare-fun address (Int) String)
(declare-fun Account_number (Int) Int)

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

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (address o)) 14)
            (str.in.re (address o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (<= (Account_number o) 9999999999)
            (>= (Account_number o) 1000000000)
        )
    ))
)

(assert (exists ((o Int)) (Person o)))

(assert (distinct 
    (str.++ (first_name 1) "1")
    (str.++ (first_name 2) "2")
    (str.++ (first_name 3) "3")
    (str.++ (last_name 1) "1")
    (str.++ (last_name 2) "2")
    (str.++ (last_name 3) "3")
    (str.++ (address 1) "1")
    (str.++ (address 2) "2")
    (str.++ (address 3) "3")
))
(assert (distinct 
    (Account_number 1)
    (Account_number 2)
    (Account_number 3)
))


(check-sat)
(get-value ((first_name 1)(last_name 1)(email 1)(address 1)(Account_number 1)))
(get-value ((first_name 2)(last_name 2)(email 2)(address 2)(Account_number 2)))
(get-value ((first_name 3)(last_name 3)(email 3)(address 3)(Account_number 3)))
