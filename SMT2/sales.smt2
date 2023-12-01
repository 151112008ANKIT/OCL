(declare-fun customer_name (Int) String)
(declare-fun Sales_Id (Int) Int)
(declare-fun customerID (Int) String)
(declare-fun customerPhone (Int) String)
(declare-fun Person (Int) Bool)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (str.len (customer_name o)) 10)
            (str.in.re (customer_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (= (str.len (customerPhone o)) 10)
            (= (str.at (customerPhone o) 0) "9")
            (str.in.re (str.substr (customerPhone o) 1 9) (re.* (re.range "0" "9")))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (= (str.len (customerID o)) 4)
            (str.in.re (customerID o) (re.* (re.union (re.range "A" "Z") (re.range "0" "9"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (Sales_Id o) 1)
            (< (Sales_Id o) 100000)
        )
    ))
)

(assert (exists ((o Int)) (Person o)))

(check-sat)
(get-value ((customer_name 0) (Sales_Id 0) (customerID 0) (customerPhone 0)))
