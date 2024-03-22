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
(define-fun Person ((o Int)) Bool
    true

    )

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (husband_name o)) 5)
            (str.in.re (husband_name o) (re.* (re.range "a" "z")))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (wife_name o)) 5)
            (str.in.re (wife_name o) (re.* (re.range "A" "Z")))
        )
    ))
)
(assert
    (forall ((o Int)) (=> (Person o)
        (not (= (husband_name o) (wife_name o)))
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (or 
            (= (husband_marital_status o) "Single")
            (= (husband_marital_status o) "Married")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (or 
            (= (wife_marital_status o) "Single")
            (= (wife_marital_status o) "Married")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (or 
            (= (husband_gender o) "Male")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (or 
            (= (wife_gender o) "Female")
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (>=(husband_age o) 18)
        

    ))
)



(assert 
    (forall ((o Int)) (=> (Person o)  
        (>= (wife_age o) 18)
      
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (= (husband_email o) (str.++ (husband_name o) "@gmail.com"))
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)  
        (= (wife_email o) (str.++ (wife_name o) "@gmail.com"))
    ))
)


(assert (exists ((o Int)) (Person o)))

(assert (distinct 
(husband_name 1)
(husband_name 2)
(husband_name 3)
(husband_name 4)
(husband_name 5)



))
   (assert (distinct 
(wife_name 1)
(wife_name 2) 
(wife_name 3) 
(wife_name 4)
(wife_name 5) 

)) 

(assert (distinct 
(husband_age 1)
(wife_age 1)
(husband_age 2)
(wife_age 2)
(husband_age 3)
(wife_age 3)
(husband_age 4)
(wife_age 4)
(husband_age 5)
(wife_age 5)


)) 

(check-sat)
(get-value ((husband_name 1)(wife_name 1) (husband_email 1)(wife_email 1)(husband_marital_status 1)(wife_marital_status 1)(husband_gender 1)(wife_gender 1) (husband_age 1) (wife_age 1)))
(get-value ((husband_name 2)(wife_name 2) (husband_email 2)(wife_email 2)(husband_marital_status 2)(wife_marital_status 2)(husband_gender 2)(wife_gender 2) (husband_age 2) (wife_age 2)))
(get-value ((husband_name 3)(wife_name 3) (husband_email 3)(wife_email 3)(husband_marital_status 3)(wife_marital_status 3)(husband_gender 3)(wife_gender 3) (husband_age 3) (wife_age 3)))
(get-value ((husband_name 4)(wife_name 4) (husband_email 4)(wife_email 4)(husband_marital_status 4)(wife_marital_status 4)(husband_gender 4)(wife_gender 4) (husband_age 4) (wife_age 4)))
(get-value ((husband_name 5)(wife_name 5) (husband_email 5)(wife_email 5)(husband_marital_status 5)(wife_marital_status 5)(husband_gender 5)(wife_gender 5) (husband_age 5) (wife_age 5)))
;(get-value ((husband_name 6)(wife_name 6) (husband_email 6)(wife_email 6)(husband_marital_status 6)(wife_marital_status 6)(husband_gender 6)(wife_gender 6) (husband_age 6) (wife_age 6)))
;(get-value ((husband_name 7)(wife_name 7) (husband_email 7)(wife_email 7)(husband_marital_status 7)(wife_marital_status 7)(husband_gender 7)(wife_gender 7) (husband_age 7) (wife_age 7)))
;(get-value ((husband_name 8)(wife_name 8) (husband_email 8)(wife_email 8)(husband_marital_status 8)(wife_marital_status 8)(husband_gender 8)(wife_gender 8) (husband_age 8) (wife_age 8)))
;(get-value ((husband_name 9)(wife_name 9) (husband_email 9)(wife_email 9)(husband_marital_status 9)(wife_marital_status 9)(husband_gender 9)(wife_gender 9) (husband_age 9) (wife_age 9)))
;(get-value ((husband_name 10)(wife_name 10) (husband_email 10)(wife_email 10)(husband_marital_status 10)(wife_marital_status 10)(husband_gender 10)(wife_gender 10) (husband_age 10) (wife_age 10)))
;(get-value ((husband_name 11)(wife_name 11) (husband_email 11)(wife_email 11)(husband_marital_status 11)(wife_marital_status 11)(husband_gender 11)(wife_gender 11) (husband_age 11) (wife_age 11)))
;(get-value ((husband_name 12)(wife_name 12) (husband_email 12)(wife_email 12)(husband_marital_status 12)(wife_marital_status 12)(husband_gender 12)(wife_gender 12) (husband_age 12) (wife_age 12)))
;(get-value ((husband_name 13)(wife_name 13) (husband_email 13)(wife_email 13)(husband_marital_status 13)(wife_marital_status 13)(husband_gender 13)(wife_gender 13) (husband_age 13) (wife_age 13)))
;(get-value ((husband_name 14)(wife_name 14) (husband_email 14)(wife_email 14)(husband_marital_status 14)(wife_marital_status 14)(husband_gender 14)(wife_gender 14) (husband_age 14) (wife_age 14)))
;(get-value ((husband_name 15)(wife_name 15) (husband_email 15)(wife_email 15)(husband_marital_status 15)(wife_marital_status 15)(husband_gender 15)(wife_gender 15) (husband_age 15) (wife_age 15)))