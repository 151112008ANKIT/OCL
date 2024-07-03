(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)
;(set-option:incremental true)

(declare-fun Oid (Int) Int)
(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)
(declare-fun Address (Int) String)
(declare-fun Area_code (Int) String)
(declare-fun Street_code (Int) String)
(declare-fun isCatholicPriest (Int) String)
(declare-fun gender (Int) String)
(declare-fun account_number (Int) Int)

(define-fun Person ((o Int)) Bool true)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (str.len (first_name (Oid o))) 5)
            (str.in_re (first_name (Oid o)) (re.* (re.range "a" "z")))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (str.len (last_name (Oid o))) 5)
            (str.in_re (last_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (and 
            (= (str.len (Address (Oid o))) 5)
            (str.in_re (Address (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "0" "9"))))
            (= (str.at (Address (Oid o)) 0) (Area_code (Oid o)))
            (= (str.at (Address (Oid o)) 4) (Street_code (Oid o)))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (or (= (gender (Oid o)) "male") (= (gender (Oid o)) "female"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (= (email (Oid o)) (str.++ (first_name (Oid o)) "." (last_name (Oid o)) "@gmail.com"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (=> (= (gender (Oid o)) "male") (= (isCatholicPriest (Oid o)) "Yes"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (=> (= (gender (Oid o)) "female") (= (isCatholicPriest (Oid o)) "No"))
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (<= (account_number (Oid o)) 9999999999)
            (>= (account_number (Oid o)) 1000000000)
        )
    ))
)

(assert (exists ((o Int)) (Person o)))

(assert (distinct 
    (first_name (Oid 1)) 
    (first_name (Oid 2)) 
    
    (last_name (Oid 1)) 
    (last_name (Oid 2)) 
    
    (Address (Oid 1)) 
    (Address (Oid 2)) 
    
))
(assert (distinct 
    (account_number (Oid 1))
    (account_number (Oid 2))

))




(check-sat)
(get-value ((first_name (Oid 1))(last_name (Oid 1))(email (Oid 1))(Address (Oid 1))(Area_code (Oid 1))(Street_code (Oid 1))(account_number (Oid 1))(gender (Oid 1))(isCatholicPriest (Oid 1))))
(get-value ((first_name (Oid 2))(last_name (Oid 2))(email (Oid 2))(Address (Oid 2))(Area_code (Oid 2))(Street_code (Oid 2))(account_number (Oid 2))(gender (Oid 2))(isCatholicPriest (Oid 2))))
;(get-value ((first_name (Oid 3))(last_name (Oid 3))(email (Oid 3))(Address (Oid 3))(Area_code (Oid 3))(Street_code (Oid 3))(account_number (Oid 3))(gender (Oid 3))(isCatholicPriest (Oid 3))))
;(get-value ((first_name (Oid 4))(last_name (Oid 4))(email (Oid 4))(Address (Oid 4))(Area_code (Oid 4))(Street_code (Oid 4))(account_number (Oid 4))(gender (Oid 4))(isCatholicPriest (Oid 4))))
;(get-value ((first_name (Oid 5))(last_name (Oid 5))(email (Oid 5))(Address (Oid 5))(Area_code (Oid 5))(Street_code (Oid 5))(account_number (Oid 5))(gender (Oid 5))(isCatholicPriest (Oid 5))))
