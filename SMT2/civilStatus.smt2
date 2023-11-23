(declare-fun husband_name (Int) String)
(declare-fun wife_name (Int) String)
(declare-fun husband_email (Int) String)
(declare-fun wife_email (Int) String)
(declare-fun husband_marital_status (Int) String)
(declare-fun wife_marital_status (Int) String)
(declare-fun husband_gender (Int) String)
(declare-fun wife_gender (Int) String)
(declare-fun husband_age (Int) Int)
(declare-fun wife_age (Int) Int)
(declare-fun isPerson (Int) Bool)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len (husband_name o)) 15)  
            (str.in.re (husband_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len (wife_name o)) 15)  
            (str.in.re (wife_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (or 
            (= (husband_marital_status o) "Single")
            (= (husband_marital_status o) "Married")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (or 
            (= (wife_marital_status o) "Single")
            (= (wife_marital_status o) "Married")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (or 
            (= (husband_gender o) "Male")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (or 
            (= (wife_gender o) "Female")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (> (husband_age o) 18)
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (> (wife_age o) 18)
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (= (husband_email o) (str.++ (husband_name o) "@gmail.com"))
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (= (wife_email o) (str.++ (wife_name o) "@gmail.com"))
    ))
)

(assert (= (husband_marital_status 1) "Married"))
(assert (= (wife_marital_status 1) "Married"))
(assert (exists ((o Int)) (isPerson o)))
(check-sat)
(get-value ((husband_name 1) (wife_name 1) (husband_email 1) (wife_email 1) (husband_marital_status 1) (wife_marital_status 1) (husband_gender 1) (wife_gender 1) (husband_age 1) (wife_age 1)))
