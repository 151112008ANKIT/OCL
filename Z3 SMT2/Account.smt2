(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)
(declare-fun Address (Int) String)
(declare-fun Account_number (Int) Int)
(define-fun Person ((o Int)) Bool
true
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (first_name o)) 5)
            (str.in.re (first_name o) (re.* (re.range "a" "z")))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (> (str.len (last_name o)) 5)
            (str.in.re (last_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
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
            (> (str.len (Address o)) 14)
            (str.in.re (Address o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
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




(check-sat)
(get-value ((first_name 1)(last_name 1)(email 1)(Address 1)(Account_number 1)))
;(get-value ((first_name 2)(last_name 2)(email 2)(Address 2)(Account_number 2)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Account_number 3)))
;(get-value ((first_name 2)(last_name 2)(email 2)(Address 2)(Account_number 4)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Account_number 5)))
;(get-value ((first_name 1)(last_name 1)(email 1)(Address 1)(Account_number 6)))
;(get-value ((first_name 2)(last_name 2)(email 2)(Address 2)(Account_number 7)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Account_number 8)))
;(get-value ((first_name 2)(last_name 2)(email 2)(Address 2)(Account_number 9)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Account_number 10)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Account_number 11)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Account_number 12)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Account_number 13)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Account_number 14)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Account_number 15)))

