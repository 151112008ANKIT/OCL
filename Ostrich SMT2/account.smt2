(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)
;(set-option:incremental true)

(declare-fun Oid (Int) Int)
(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)
(declare-fun address (Int) String)
(declare-fun Account_number (Int) Int)

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
        (not (= (first_name (Oid o)) (last_name (Oid o))))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (= (email (Oid o)) (str.++ (first_name (Oid o)) "." (last_name (Oid o)) "@mu.ie"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (str.suffixof "mu.ie" (email (Oid o)))
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (<= (Account_number (Oid o)) 9999999999)
            (>= (Account_number (Oid o)) 1000000000)
        )
    ))
)

(assert (exists ((o Int)) (Person o)))

(assert (distinct (first_name (Oid 1)) (first_name (Oid 2)) (first_name (Oid 3)) (first_name (Oid 4)) (first_name (Oid 5))))
(assert (distinct (last_name (Oid 1)) (last_name (Oid 2)) (last_name (Oid 3)) (last_name (Oid 4)) (last_name (Oid 5))))

(assert (distinct 
    (Account_number (Oid 1)) (Account_number (Oid 2)) (Account_number (Oid 3)) (Account_number (Oid 4)) (Account_number (Oid 5))
))

(check-sat)
(get-value ((first_name (Oid 1)) (last_name (Oid 1)) (email (Oid 1)) (Account_number (Oid 1))))
;(get-value ((first_name (Oid 2)) (last_name (Oid 2)) (email (Oid 2)) (Account_number (Oid 2))))
;(get-value ((first_name (Oid 3)) (last_name (Oid 3)) (email (Oid 3)) (Account_number (Oid 3))))
;(get-value ((first_name (Oid 4)) (last_name (Oid 4)) (email (Oid 4)) (Account_number (Oid 4))))
;(get-value ((first_name (Oid 5)) (last_name (Oid 5)) (email (Oid 5)) (Account_number (Oid 5))))
