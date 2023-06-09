(declare-const customer_name String)
(declare-const Sales_Id Int)
(declare-const customerID Int)
(declare-const customerPhone String)
(declare-fun Person (Int) Bool)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (str.len customer_name) 10)
            (str.in.re customer_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o1 Int) (o2 Int)) (=> (and (Person o1) (Person o2) (= o1 o2))
        (distinct Sales_Id)
    ))
)

(assert
    (forall ((o Int)) (=> (Person o) (and (= (str.len customerPhone) 10) (str.in.re customerPhone (re.* (re.range "0" "9"))))))
)

(assert
    (forall ((o Int)) (=> (Person o) (> Sales_Id 0)))
)

(assert
    (forall ((o Int)) (=> (Person o) (> customerID 0)))
)

(assert (exists ((o Int)) (Person o)))

(check-sat)
(get-value (customer_name Sales_Id customerID customerPhone))
