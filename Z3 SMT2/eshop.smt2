(declare-fun Product_name (Int) String)
(declare-fun product_ID (Int) Int)
(declare-fun price1 (Int) Int)
(declare-fun isAvailable1 (Int) Bool)
(declare-fun Product_code (Int) String)
(define-fun isProduct ((o Int)) Bool true)


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

(assert (distinct 
(Product_name 1)
(Product_name 2)
(Product_name 3)
(Product_name 4)
(Product_name 5)
(Product_name 6)
(Product_name 7)
(Product_name 8)
(Product_name 9)
(Product_name 10)
(Product_name 11)
(Product_name 12)
(Product_name 13)
(Product_name 14)
(Product_name 15)
))
(assert (distinct 
(price1 1)
(price1 2)
(price1 3)
(price1 4)
(price1 5)
(price1 6)
(price1 7)
(price1 8)
(price1 9)
(price1 10)
(price1 11)
(price1 12)
(price1 13)
(price1 14)
(price1 15)


))

(check-sat)
(get-value ((Product_name 1) (product_ID 1) (price1 1) (isAvailable1 1) (Product_code 1)))

(get-value ((Product_name 2) (product_ID 2) (price1 2) (isAvailable1 2) (Product_code 2)))
(get-value ((Product_name 3) (product_ID 3) (price1 3) (isAvailable1 3) (Product_code 3)))
;(get-value ((Product_name 4) (product_ID 4) (price1 4) (isAvailable1 4) (Product_code 4)))
;(get-value ((Product_name 5) (product_ID 5) (price1 5) (isAvailable1 5) (Product_code 5)))
;(get-value ((Product_name 6) (product_ID 6) (price1 6) (isAvailable1 6) (Product_code 6)))
;(get-value ((Product_name 7) (product_ID 7) (price1 7) (isAvailable1 7) (Product_code 7)))
;(get-value ((Product_name 8) (product_ID 8) (price1 8) (isAvailable1 8) (Product_code 8)))
;(get-value ((Product_name 9) (product_ID 9) (price1 9) (isAvailable1 9) (Product_code 9)))
;(get-value ((Product_name 10) (product_ID 10) (price1 10) (isAvailable1 10) (Product_code 10)))
;(get-value ((Product_name 11) (product_ID 11) (price1 11) (isAvailable1 11) (Product_code 11)))
;(get-value ((Product_name 12) (product_ID 12) (price1 13) (isAvailable1 14) (Product_code 12)))
;(get-value ((Product_name 13) (product_ID 13) (price1 13) (isAvailable1 13) (Product_code 13)))
;(get-value ((Product_name 14) (product_ID 14) (price1 14) (isAvailable1 14) (Product_code 14)))
;(get-value ((Product_name 15) (product_ID 15) (price1 15) (isAvailable1 115) (Product_code 15)))
