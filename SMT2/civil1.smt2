(declare-sort Person)

(declare-const first_name String)
(declare-const last_name String)
(declare-const email String)
(declare-fun marital_status (Person) String)
(declare-fun gender (Person) String)
(declare-fun age (Person) Int)
(declare-fun isPerson (Int) Bool)

(assert 
    (forall ((o Int)) (=> (isPerson o)
        (and 
            (> (str.len first_name) 5)  
            (str.in.re first_name (re.* (re.range "a" "z")))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len last_name) 5)  
            (str.in.re last_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((p Person))
        (or 
            (= (marital_status p) "single")
            (= (marital_status p) "married")
            (= (marital_status p) "divorced")
            (= (marital_status p) "widowed")
        )
    )
)

(assert 
    (forall ((p Person))
        (or 
            (= (gender p) "male")
            (= (gender p) "female")
        )
    )
)

(assert 
    (forall ((p Person))
        (> (age p) 18)
    )
)

(assert 
    (not (= first_name last_name))
)

(assert 
    (= email (str.++ first_name last_name "@gmail.com"))
)

(assert (exists ((o Int)) (isPerson o)))

(check-sat)
(get-value (first_name last_name marital_status gender age email))
