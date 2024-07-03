
(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)

(declare-fun Oid (Int) Int)
(declare-fun husband_name (Int) String)
(declare-fun wife_name (Int) String)
(declare-fun husband_email (Int) String)
(declare-fun wife_email (Int) String)
(declare-fun husband_marital_status (Int) String)
(declare-fun wife_marital_status (Int) String)
(declare-fun husband_gender (Int) String)
(declare-fun wife_gender (Int) String)
(declare-fun husband_age (Int) Int)
(declare-fun wife_age (Int) Int)

(define-fun Person ((o Int)) Bool true)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (husband_name (Oid o))) 5)
            (str.in_re (husband_name (Oid o)) (re.* (re.range "a" "z")))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (wife_name (Oid o))) 5)
            (str.in_re (wife_name (Oid o)) (re.* (re.range "A" "Z")))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (not (= (husband_name (Oid o)) (wife_name (Oid o))))
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (or 
            (= (husband_marital_status (Oid o)) "Single")
            (= (husband_marital_status (Oid o)) "Married")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (or 
            (= (wife_marital_status (Oid o)) "Single")
            (= (wife_marital_status (Oid o)) "Married")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (or 
            (= (husband_gender (Oid o)) "Male")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (or 
            (= (wife_gender (Oid o)) "Female")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (>= (husband_age (Oid o)) 18)
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (>= (wife_age (Oid o)) 18)
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (= (husband_email (Oid o)) (str.++ (husband_name (Oid o)) "@gmail.com"))
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (= (wife_email (Oid o)) (str.++ (wife_name (Oid o)) "@gmail.com"))
    ))
)

(assert (exists ((o Int)) (Person o)))

(assert (distinct 
(husband_name (Oid 1))
(husband_name (Oid 2))
(husband_name (Oid 3))
(husband_name (Oid 4))
(husband_name (Oid 5))
(husband_name (Oid 6))
(husband_name (Oid 7))
(husband_name (Oid 8))
(husband_name (Oid 9))
(husband_name (Oid 10))
))

(assert (distinct 
(wife_name (Oid 1))
(wife_name (Oid 2)) 
(wife_name (Oid 3)) 
(wife_name (Oid 4))
(wife_name (Oid 5)) 
(wife_name (Oid 6))
(wife_name (Oid 7)) 
(wife_name (Oid 8)) 
(wife_name (Oid 9))
(wife_name (Oid 10))
)) 

(assert (distinct 
(husband_age (Oid 1))
(husband_age (Oid 2))
(husband_age (Oid 3))
(husband_age (Oid 4))
(husband_age (Oid 5))
(husband_age (Oid 6))
(husband_age (Oid 7))
(husband_age (Oid 8))
(husband_age (Oid 9))
(husband_age (Oid 10))
))

(assert (distinct 
(wife_age (Oid 1))
(wife_age (Oid 2))
(wife_age (Oid 3))
(wife_age (Oid 4))
(wife_age (Oid 5))
(wife_age (Oid 6))
(wife_age (Oid 7))
(wife_age (Oid 8))
(wife_age (Oid 9))
(wife_age (Oid 10))
))

(check-sat)
(get-value ((husband_name (Oid 1))(wife_name (Oid 1))(husband_email (Oid 1))(wife_email (Oid 1))(husband_marital_status (Oid 1))(wife_marital_status (Oid 1))(husband_gender (Oid 1))(wife_gender (Oid 1))(husband_age (Oid 1))(wife_age (Oid 1))))
;(get-value ((husband_name (Oid 2))(wife_name (Oid 2))(husband_email (Oid 2))(wife_email (Oid 2))(husband_marital_status (Oid 2))(wife_marital_status (Oid 2))(husband_gender (Oid 2))(wife_gender (Oid 2))(husband_age (Oid 2))(wife_age (Oid 2))))
;(get-value ((husband_name (Oid 3))(wife_name (Oid 3))(husband_email (Oid 3))(wife_email (Oid 3))(husband_marital_status (Oid 3))(wife_marital_status (Oid 3))(husband_gender (Oid 3))(wife_gender (Oid 3))(husband_age (Oid 3))(wife_age (Oid 3))))
;(get-value ((husband_name (Oid 4))(wife_name (Oid 4))(husband_email (Oid 4))(wife_email (Oid 4))(husband_marital_status (Oid 4))(wife_marital_status (Oid 4))(husband_gender (Oid 4))(wife_gender (Oid 4))(husband_age (Oid 4))(wife_age (Oid 4))))
;(get-value ((husband_name (Oid 5))(wife_name (Oid 5))(husband_email (Oid 5))(wife_email (Oid 5))(husband_marital_status (Oid 5))(wife_marital_status (Oid 5))(husband_gender (Oid 5))(wife_gender (Oid 5))(husband_age (Oid 5))(wife_age (Oid 5))))
