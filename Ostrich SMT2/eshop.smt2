(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)

(declare-fun Oid (Int) Int)
(declare-fun Product_name (Int) String)
(declare-fun product_ID (Int) Int)
(declare-fun price1 (Int) Int)
(declare-fun isAvailable1 (Int) Bool)
(declare-fun Product_code (Int) String)
(define-fun isProduct ((o Int)) Bool true)

(assert 
    (forall ((o Int)) (=> (isProduct o)
        (and
            (> (str.len (Product_name (Oid o))) 5)
            (str.in_re (Product_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (isProduct o)
        (and
            (>= (product_ID (Oid o)) 111)
            (<= (product_ID (Oid o)) 999)
            (= (Product_code (Oid o)) 
               (str.++ 
                   (str.substr (str.from_int (product_ID (Oid o))) 0 3) 
                   (str.substr (Product_name (Oid o)) 0 2)
               )
            )
        )
    ))
)

(assert
    (forall ((o Int)) (=> (isProduct o)
        (> (price1 (Oid o)) 0)
    ))
)

(assert
    (forall ((o Int)) (=> (isProduct o)
        (isAvailable1 (Oid o))
    ))
)

(assert (exists ((o Int)) (isProduct o)))

(assert (distinct 
(Product_name (Oid 1))
(Product_name (Oid 2))
(Product_name (Oid 3))
(Product_name (Oid 4))
(Product_name (Oid 5))
(Product_name (Oid 6))
(Product_name (Oid 7))
(Product_name (Oid 8))
(Product_name (Oid 9))
(Product_name (Oid 10))
))

(assert (distinct 
(price1 (Oid 1))
(price1 (Oid 2))
(price1 (Oid 3))
(price1 (Oid 4))
(price1 (Oid 5))
(price1 (Oid 6))
(price1 (Oid 7))
(price1 (Oid 8))
(price1 (Oid 9))
(price1 (Oid 10))
))

(check-sat)
(get-value ((Product_name (Oid 1)) (product_ID (Oid 1)) (price1 (Oid 1)) (isAvailable1 (Oid 1)) (Product_code (Oid 1))))
(get-value ((Product_name (Oid 2)) (product_ID (Oid 2)) (price1 (Oid 2)) (isAvailable1 (Oid 2)) (Product_code (Oid 2))))
(get-value ((Product_name (Oid 3)) (product_ID (Oid 3)) (price1 (Oid 3)) (isAvailable1 (Oid 3)) (Product_code (Oid 3))))
;(get-value ((Product_name (Oid 4)) (product_ID (Oid 4)) (price1 (Oid 4)) (isAvailable1 (Oid 4)) (Product_code (Oid 4))))
;(get-value ((Product_name (Oid 5)) (product_ID (Oid 5)) (price1 (Oid 5)) (isAvailable1 (Oid 5)) (Product_code (Oid 5))))
;(get-value ((Product_name (Oid 6)) (product_ID (Oid 6)) (price1 (Oid 6)) (isAvailable1 (Oid 6)) (Product_code (Oid 6))))
;(get-value ((Product_name (Oid 7)) (product_ID (Oid 7)) (price1 (Oid 7)) (isAvailable1 (Oid 7)) (Product_code (Oid 7))))
;(get-value ((Product_name (Oid 8)) (product_ID (Oid 8)) (price1 (Oid 8)) (isAvailable1 (Oid 8)) (Product_code (Oid 8))))
;(get-value ((Product_name (Oid 9)) (product_ID (Oid 9)) (price1 (Oid 9)) (isAvailable1 (Oid 9)) (Product_code (Oid 9))))
;(get-value ((Product_name (Oid 10)) (product_ID (Oid 10)) (price1 (Oid 10)) (isAvailable1 (Oid 10)) (Product_code (Oid 10))))
