(declare-const Product_name String)
(declare-const product_ID Int)
(declare-const price1 Int)
(declare-const isAvailable1 Bool)
(declare-const Product_code String)
(declare-fun isProduct (Int) Bool)

(assert 
    (forall ((o Int)) (=> (isProduct o)  
        (and 
            (> (str.len Product_name) 5)  
            (str.in.re Product_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (isProduct o)
        (and
            (and (>= product_ID 111) (<= product_ID 999))
            (= Product_code (str.++ (str.substr (int.to.str product_ID) 0 3) (str.substr Product_name 0 2)))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (isProduct o)
        (> price1 0)
    ))
)

(assert
    (forall ((o Int)) (=> (isProduct o)
        isAvailable1
    ))
)

(assert (exists ((o Int)) (isProduct o)))

(check-sat)
(get-value (Product_name product_ID price1 isAvailable1 Product_code))
