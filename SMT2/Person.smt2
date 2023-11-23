(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)
(declare-fun Gender (Int) String)
(declare-fun Address (Int) String)
(declare-fun Area_code (Int) String)
(declare-fun Street_code (Int) String)
(declare-fun isCatholicPriest (Int) String)
(declare-fun Person (Int) Bool)
(declare-fun gender (Int) String)

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
        (and 
            (= (str.len (Address o)) 5)
            (str.in.re (Address o) (re.* (re.union (re.range "A" "Z") (re.range "0" "9"))))
            (= (str.at (Address o) 0) (Area_code o))
            (= (str.at (Address o) 4) (Street_code o))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (or (= (gender o) "male") (= (gender o) "female"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (= (email o) (str.++ (first_name o) "." (last_name o) "@gmail.com"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (=> (= (gender o) "male") (= (isCatholicPriest o) "Yes"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (=> (= (gender o) "female") (= (isCatholicPriest o) "No"))
    ))
)

(assert (exists ((o Int)) (Person o)))

(check-sat)
(get-value ((first_name 1) (last_name 1) (email 1) (Address 1) (Area_code 1) (Street_code 1) (isCatholicPriest 1) (gender 1)))
