(set-logic ALL)
(set-option :produce-models true)
;(set-option :strings-exp true)
;(set-option :mbqi true)
;(set-option :incremental true)


(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)
(declare-fun address (Int) String)
(declare-fun Account_number (Int) Int)

(define-fun Person ((o Int)) Bool
   true
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (first_name o)) 5)
            (str.in_re (first_name o) (re.* (re.range "a" "z")))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (last_name o)) 5)
            (str.in_re (last_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (not (= (first_name o) (last_name o)))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (= (email o) (str.++ (first_name o) "." (last_name o) "@mu.ie"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (str.suffixof "mu.ie" (email o))
    ))
)



(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (<= (Account_number o) 9999999999)
            (>= (Account_number o) 1000000000)
        )
    ))
)

(assert (exists ((o Int)) (Person o)))
(assert (distinct 
(first_name 1) 
(first_name 2) 
(first_name 3) 
(first_name 4) 
(first_name 5) 
(first_name 6) 
(first_name 7) 
(first_name 8) 
(first_name 9) 
(first_name 10)
(first_name 11)
(first_name 12)
(first_name 13)
(first_name 14)
(first_name 15)

    ))
(assert (distinct 
(last_name 1) 
(last_name 2) 
(last_name 3) 
(last_name 4) 
(last_name 5) 
(last_name 6) 
(last_name 7) 
(last_name 8) 
(last_name 9) 
(last_name 10)
(last_name 11)
(last_name 12)
(last_name 13)
(last_name 14)
(last_name 15)

))


(assert (distinct 
(Account_number 1) 
(Account_number 2) 
(Account_number 3) 
(Account_number 4) 
(Account_number 5) 
(Account_number 6) 
(Account_number 7) 
(Account_number 8) 
(Account_number 9) 
(Account_number 10) 
(Account_number 11) 
(Account_number 12) 
(Account_number 13) 
(Account_number 14) 
(Account_number 15) 
))

(check-sat)
(get-value ((first_name 1)(last_name 1)(email 1)(Account_number 1)))
(get-value ((first_name 2)(last_name 2)(email 2)(Account_number 2)))
(get-value ((first_name 3)(last_name 3)(email 3)(Account_number 3)))
(get-value ((first_name 4)(last_name 4)(email 4)(Account_number 4)))
(get-value ((first_name 5)(last_name 5)(email 5)(Account_number 5)))
(get-value ((first_name 6)(last_name 6)(email 6)(Account_number 6)))
(get-value ((first_name 7)(last_name 7)(email 7)(Account_number 7)))
(get-value ((first_name 8)(last_name 8)(email 8)(Account_number 8)))
(get-value ((first_name 9)(last_name 9)(email 9)(Account_number 9)))
(get-value ((first_name 10)(last_name 10)(email 10)(Account_number 10)))
(get-value ((first_name 10)(last_name 10)(email 10)(Account_number 11)))
(get-value ((first_name 10)(last_name 10)(email 10)(Account_number 12)))
(get-value ((first_name 10)(last_name 10)(email 10)(Account_number 13)))
(get-value ((first_name 10)(last_name 10)(email 10)(Account_number 14)))
(get-value ((first_name 10)(last_name 10)(email 10)(Account_number 15)))
