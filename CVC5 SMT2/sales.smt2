(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)

(declare-fun Oid (Int) Int)
(declare-fun customer_name (Int) String)
(declare-fun Sales_Id (Int) Int)
(declare-fun customerID (Int) String)
(declare-fun customerPhone (Int) String)
(define-fun Person ((o Int)) Bool true)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (str.len (customer_name (Oid o))) 10)
            (str.in_re (customer_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (= (str.len (customerPhone (Oid o))) 10)
            (= (str.at (customerPhone (Oid o)) 0) "9")
            (str.in_re (str.substr (customerPhone (Oid o)) 1 9) (re.* (re.range "0" "9")))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (= (str.len (customerID (Oid o))) 4)
            (str.in_re (customerID (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "0" "9"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (Sales_Id (Oid o)) 9999)
            (< (Sales_Id (Oid o)) 100000)
        )
    ))
)

(assert (exists ((o Int)) (Person o)))

(assert (distinct 
    (customer_name (Oid 1)) 
    (customer_name (Oid 2)) 
    (customer_name (Oid 3)) 
    (customer_name (Oid 4)) 
    (customer_name (Oid 5)) 
))

(assert (distinct 
    (customerID (Oid 1)) 
    (customerID (Oid 2))
    (customerID (Oid 3))
    (customerID (Oid 4))
    (customerID (Oid 5))
))

(assert (distinct 
    (customerPhone (Oid 1))
    (customerPhone (Oid 2)) 
    (customerPhone (Oid 3))  
    (customerPhone (Oid 4))
    (customerPhone (Oid 5))
))

(assert (distinct
    (Sales_Id (Oid 1))
    (Sales_Id (Oid 2))
    (Sales_Id (Oid 3))
    (Sales_Id (Oid 4))
    (Sales_Id (Oid 5))

))

(check-sat)
(get-value ((customer_name (Oid 1))(Sales_Id (Oid 1))(customerID (Oid 1))(customerPhone (Oid 1))))
(get-value ((customer_name (Oid 2))(Sales_Id (Oid 2))(customerID (Oid 2))(customerPhone (Oid 2))))
(get-value ((customer_name (Oid 3))(Sales_Id (Oid 3))(customerID (Oid 3))(customerPhone (Oid 3))))
(get-value ((customer_name (Oid 4))(Sales_Id (Oid 4))(customerID (Oid 4))(customerPhone (Oid 4))))
(get-value ((customer_name (Oid 5))(Sales_Id (Oid 5))(customerID (Oid 5))(customerPhone (Oid 5))))

