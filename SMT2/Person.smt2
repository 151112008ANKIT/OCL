(declare-const first_name String)
(declare-const last_name String)
(declare-const email String)
(declare-const Gender String)
(declare-const Address String)
(declare-const Area_code String)
(declare-const Street_code String)
(declare-const isCatholicPriestBool Bool)
(declare-fun Person (Int) Bool)
(declare-fun gender (Int) String)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (str.len first_name) 5)
            (str.in.re first_name (re.* (re.range "a" "z")))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (str.len last_name) 5)
            (str.in.re last_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (= (str.len Address) 5)
            (str.in.re Address (re.* (re.union (re.range "A" "Z") (re.range "0" "9"))))
            (= (str.at Address 0) Area_code)
            (= (str.at Address 4) Street_code)
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
        (= email (str.++ first_name "." last_name "@gmail.com"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (=> isCatholicPriestBool (= (gender o) "male"))
    ))
)

(assert (exists ((o Int)) (Person o)))

(check-sat)
(get-value (first_name last_name email Address Area_code Street_code isCatholicPriestBool gender))
