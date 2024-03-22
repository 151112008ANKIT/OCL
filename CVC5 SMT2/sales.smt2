(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)
(declare-fun customer_name (Int) String)
(declare-fun Sales_Id (Int) Int)
(declare-fun customerID (Int) String)
(declare-fun customerPhone (Int) String)
(define-fun Person ((o Int)) Bool
   true)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (str.len (customer_name o)) 10)
            (str.in_re (customer_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (= (str.len (customerPhone o)) 10)
            (= (str.at (customerPhone o) 0) "9")
            (str.in_re (str.substr (customerPhone o) 1 9) (re.* (re.range "0" "9")))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (= (str.len (customerID o)) 4)
            (str.in_re (customerID o) (re.* (re.union (re.range "A" "Z") (re.range "0" "9"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (Sales_Id o) 9999)
            (< (Sales_Id o) 100000)
        )
    ))
)



(assert (exists ((o Int)) (Person o)))

(assert (distinct 
(customer_name 1) 
(customer_name 2) 
(customer_name 3) 
(customer_name 4) 
(customer_name 5) 
(customer_name 6) 
(customer_name 7) 
(customer_name 8) 
(customer_name 9) 
(customer_name 10) 
))
(assert (distinct 
(customerID 1) 
(customerID 2)
(customerID 3)
(customerID 4)
(customerID 5)
(customerID 6) 
(customerID 7)
(customerID 8)
(customerID 9)
(customerID 10)
))
(assert (distinct 
(customerPhone 1)
(customerPhone 2) 
(customerPhone 3)  
(customerPhone 4)
(customerPhone 5)
(customerPhone 6)
(customerPhone 7) 
(customerPhone 8)  
(customerPhone 9)
(customerPhone 10)    

))

(assert(distinct
(Sales_Id 1)
(Sales_Id 2)
(Sales_Id 3)
(Sales_Id 4)
(Sales_Id 5)
(Sales_Id 6)
(Sales_Id 7)
(Sales_Id 8)
(Sales_Id 9)
(Sales_Id 10)
;(Sales_Id 11)
;(Sales_Id 12)
;(Sales_Id 13)
;(Sales_Id 14)
;(Sales_Id 15)

))
(check-sat)
(get-value ((customer_name 1)(Sales_Id 1)(customerID 1)(customerPhone 1)))
;(get-value ((customer_name 2)(Sales_Id 2)(customerID 2)(customerPhone 2)))
;(get-value ((customer_name 3)(Sales_Id 3)(customerID 3)(customerPhone 3)))
;(get-value ((customer_name 4)(Sales_Id 4)(customerID 4)(customerPhone 4)))
;(get-value ((customer_name 5)(Sales_Id 5)(customerID 5)(customerPhone 5)))
;(get-value ((customer_name 6)(Sales_Id 6)(customerID 6)(customerPhone 6)))
;(get-value ((customer_name 7)(Sales_Id 7)(customerID 7)(customerPhone 7)))
;(get-value ((customer_name 8)(Sales_Id 8)(customerID 8)(customerPhone 8)))
;(get-value ((customer_name 9)(Sales_Id 9)(customerID 9)(customerPhone 9)))
;(get-value ((customer_name 10)(Sales_Id 10)(customerID 10)(customerPhone 10)))
;(get-value ((customer_name 11)(Sales_Id 11)(customerID 11)(customerPhone 11)))
;(get-value ((customer_name 12)(Sales_Id 12)(customerID 12)(customerPhone 12)))
;(get-value ((customer_name 13)(Sales_Id 13)(customerID 13)(customerPhone 13)))
;(get-value ((customer_name 14)(Sales_Id 14)(customerID 14)(customerPhone 14)))
;(get-value ((customer_name 15)(Sales_Id 15)(customerID 15)(customerPhone 15)))