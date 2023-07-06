(declare-const first_name String)
(declare-const last_name String)
(declare-const email String)
(declare-const account_number String)
(declare-const address String)
(declare-fun Person (Int) Bool)

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
   (forall ((o Int)) (=> (Person o) (not (= first_name last_name))))
)

(assert
  (forall ((o Int)) (=> (Person o) (= email (str.++ first_name "." last_name "@mu.ie"))))
)

(assert
  (forall ((o Int)) (=> (Person o) (str.suffixof "mu.ie" email)))
)

(assert
  (forall ((o Int)) (=> (Person o) (= (str.len account_number) 10)))
)

(assert
  (forall ((o Int)) (=> (Person o) (str.in.re account_number (re.* (re.range "0" "9")))))
)

(assert
  (forall ((o Int)) (=> (Person o) (and 
            (> (str.len address) 20)  
            (str.in.re address (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
)   ))
)

(assert (exists ((o Int)) (Person o)))

(check-sat)
(get-value (first_name last_name email account_number address))
