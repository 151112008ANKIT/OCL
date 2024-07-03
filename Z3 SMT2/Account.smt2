(declare-fun Oid (Int) Int)
(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)
(declare-fun Address (Int) String)
(declare-fun Account_number (Int) Int)
(define-fun Person ((o Int)) Bool true)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (first_name (Oid o))) 5)
            (str.in.re (first_name (Oid o)) (re.* (re.range "a" "z")))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (last_name (Oid o))) 5)
            (str.in.re (last_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
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
            (> (str.len (Address (Oid o))) 14)
            (str.in.re (Address (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
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

(assert (distinct 
    (str.++ (first_name (Oid 1)) "1")
    (str.++ (last_name (Oid 1)) "1")
    (str.++ (Address (Oid 1)) "1")
    (str.++ (first_name (Oid 2)) "2")
    (str.++ (last_name (Oid 2)) "2")
    (str.++ (Address (Oid 2)) "2")
    (str.++ (first_name (Oid 3)) "3")
    (str.++ (last_name (Oid 3)) "3")
    (str.++ (Address (Oid 3)) "3")
    (str.++ (first_name (Oid 4)) "4")
    (str.++ (last_name (Oid 4)) "4")
    (str.++ (Address (Oid 4)) "4")
    (str.++ (first_name (Oid 5)) "5")
    (str.++ (last_name (Oid 5)) "5")
    (str.++ (Address (Oid 5)) "5")
))

(assert (distinct 
    (Account_number (Oid 1))
    (Account_number (Oid 2))
    (Account_number (Oid 3))
    (Account_number (Oid 4))
    (Account_number (Oid 5))
))



(assert (exists ((o Int)) (Person o)))

(check-sat)
(get-value ((first_name (Oid 1))(last_name (Oid 1))(email (Oid 1))(Address (Oid 1))(Account_number (Oid 1))))
(get-value ((first_name (Oid 2))(last_name (Oid 2))(email (Oid 2))(Address (Oid 2))(Account_number (Oid 2))))
(get-value ((first_name (Oid 3))(last_name (Oid 3))(email (Oid 3))(Address (Oid 3))(Account_number (Oid 3))))
(get-value ((first_name (Oid 4))(last_name (Oid 4))(email (Oid 4))(Address (Oid 4))(Account_number (Oid 4))))
(get-value ((first_name (Oid 5))(last_name (Oid 5))(email (Oid 5))(Address (Oid 5))(Account_number (Oid 5))))
