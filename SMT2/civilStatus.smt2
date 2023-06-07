(declare-const husband_name String)
(declare-const wife_name String)
(declare-const husband_email String)
(declare-const wife_email String)
(declare-const husband_marital_status String)
(declare-const wife_marital_status String)
(declare-const husband_gender String)
(declare-const wife_gender String)
(declare-const husband_age Int)
(declare-const wife_age Int)
(declare-fun isPerson (Int) Bool)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len husband_name) 15)  
            (str.in.re husband_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (and 
            (> (str.len wife_name) 15)  
            (str.in.re wife_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (or 
            (= husband_marital_status "Single")
            (= husband_marital_status "Married")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (or 
            (= wife_marital_status "Single")
            (= wife_marital_status "Married")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (or 
            (= husband_gender "Male")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (or 
            (= wife_gender "Female")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (> husband_age 18)
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (> wife_age 18)
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (= husband_email (str.++ husband_name "@gmail.com"))
    ))
)

(assert 
    (forall ((o Int)) (=> (isPerson o)  
        (= wife_email (str.++ wife_name "@gmail.com"))
    ))
)

(assert (= husband_marital_status "Married"))
(assert (= wife_marital_status "Married"))
(assert (exists ((o Int)) (isPerson o)))
(check-sat)
(get-value (husband_name wife_name husband_email wife_email husband_marital_status wife_marital_status husband_gender wife_gender husband_age wife_age))
