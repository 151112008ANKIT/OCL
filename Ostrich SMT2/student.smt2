(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)

(declare-fun Oid (Int) Int)
(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)

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

(assert (exists ((o Int)) (Person o)))

(assert (distinct (first_name (Oid 1)) (first_name (Oid 2)) (first_name (Oid 3)) (first_name (Oid 4)) (first_name (Oid 5))))
(assert (distinct (last_name (Oid 1)) (last_name (Oid 2)) (last_name (Oid 3)) (last_name (Oid 4)) (last_name (Oid 5))))

(check-sat)
(get-value ((first_name (Oid 1))(last_name (Oid 1))(email (Oid 1))))
(get-value ((first_name (Oid 2))(last_name (Oid 2))(email (Oid 2))))
(get-value ((first_name (Oid 3))(last_name (Oid 3))(email (Oid 3))))
(get-value ((first_name (Oid 4))(last_name (Oid 4))(email (Oid 4))))
(get-value ((first_name (Oid 5))(last_name (Oid 5))(email (Oid 5))))
