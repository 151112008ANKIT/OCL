(declare-fun Product_name (Int) String)
(declare-fun product_ID (Int) Int)
(declare-fun price1 (Int) Int)
(declare-fun isAvailable1 (Int) Bool)
(declare-fun Product_code (Int) String)
(declare-fun isProduct (Int) Bool)

(assert 
    (forall ((o Int)) (=> (isProduct o)  
        (and 
            (> (str.len (Product_name o)) 5)  
            (str.in.re (Product_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (isProduct o)
        (and
            (and (>= (product_ID o) 111) (<= (product_ID o) 999))
            (= (Product_code o) (str.++ (str.substr (int.to.str (product_ID o)) 0 3) (str.substr (Product_name o) 0 2)))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (isProduct o)
        (> (price1 o) 0)
    ))
)

(assert
    (forall ((o Int)) (=> (isProduct o)
        (isAvailable1 o)
    ))
)

(assert (exists ((o Int)) (isProduct o)))

(check-sat)
(get-value ((Product_name 1) (product_ID 1) (price1 1) (isAvailable1 1) (Product_code 1)))
