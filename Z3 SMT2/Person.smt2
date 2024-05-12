(declare-fun first_name (Int) String)
(declare-fun last_name (Int) String)
(declare-fun email (Int) String)
(declare-fun Address (Int) String)
(declare-fun Area_code (Int) String)
(declare-fun Street_code (Int) String)
(declare-fun isCatholicPriest (Int) String)
(declare-fun gender (Int) String)
(declare-fun account_number (Int) Int)
(define-fun Person ((o Int)) Bool
  true
  )

(assert 
    (forall ((o Int)) (=> (Person o)
        (and 
            (> (str.len (first_name o)) 5)
            (str.in.re (first_name o) (re.++ (re.range "A" "Z") (re.* (re.range "a" "z"))))
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
        (and 
            (= (str.len (Address o)) 5)
            (str.in.re (Address o) (re.* (re.union (re.range "A" "Z") (re.range "0" "9"))))
            (= (str.at (Address o) 0) (Area_code o))
            (= (str.at (Address o) 4) (Street_code o))
        )
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (or (= (gender o) "male") (= (gender o) "female"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (= (email o) (str.++ (first_name o) "." (last_name o) "@gmail.com"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (=> (= (gender o) "male") (= (isCatholicPriest o) "Yes"))
    ))
)

(assert
    (forall ((o Int)) (=> (Person o)
        (=> (= (gender o) "female") (= (isCatholicPriest o) "No"))
    ))
)

(assert 
    (forall ((o Int)) (=> (Person o)
        (and
            (<= (account_number o) 9999999999)
            (>= (account_number o) 1000000000)
        )
    ))
)

(assert (exists ((o Int)) (Person o)))

(assert (distinct 
(str.++ (first_name 1) "1")
(str.++ (last_name 1) "1")
(str.++ (Address 1) "1")
(str.++ (first_name 2) "2")
(str.++ (last_name 2) "2")
(str.++ (Address 2) "2")
(str.++ (first_name 3) "3")
(str.++ (last_name 3) "3")
(str.++ (Address 3) "3")
(str.++ (first_name 4) "4")
(str.++ (last_name 4) "4")
(str.++ (Address 4) "4")
(str.++ (first_name 5) "5")
(str.++ (last_name 5) "5")
(str.++ (Address 5) "5")
;(str.++ (first_name 6) "6")
;(str.++ (last_name 6) "6")
;(str.++ (Address 6) "6")
;(str.++ (first_name 7) "7")
;(str.++ (last_name 7) "7")
;(str.++ (Address 7) "7")
;(str.++ (first_name 8) "8")
;(str.++ (last_name 8) "8")
;(str.++ (Address 8) "8")
;(str.++ (first_name 9) "9")
;(str.++ (last_name 9) "9")
;(str.++ (Address 9) "9")
;(str.++ (first_name 10) "10")
;(str.++ (last_name 10) "10")
;(str.++ (Address 10) "10")
;(str.++ (first_name 11) "11")
;(str.++ (last_name 11) "11")
;(str.++ (Address 11) "11")
;(str.++ (first_name 12) "12")
;(str.++ (last_name 12) "12")
;(str.++ (Address 12) "12")
;(str.++ (first_name 13) "13")
;(str.++ (last_name 13) "13")
;(str.++ (Address 13) "13")
;(str.++ (first_name 14) "14")
;(str.++ (last_name 14) "14")
;(str.++ (Address 14) "14")
;(str.++ (first_name 15) "15")
;(str.++ (last_name 15) "15")
;(str.++ (Address 15) "15")

))

(assert (distinct 
 (account_number 1)
 (account_number 2)
 (account_number 3)
 (account_number 4)
 (account_number 5)
 ;(account_number 6)
 ;(account_number 7)
 ;(account_number 8)
 ;(account_number 9)
 ;(account_number 10)
 ;(account_number 11)
 ;(account_number 12)
 ;(account_number 13)
 ;(account_number 14)
 ;(account_number 15)

))


(check-sat)
(get-value ((first_name 1)(last_name 1)(email 1)(Address 1)(Area_code 1)(Street_code 1)(account_number 1)(gender 1)(isCatholicPriest 1)))
;(get-value ((first_name 2)(last_name 2)(email 2)(Address 2)(Area_code 2)(Street_code 2)(account_number 2)(gender 2)(isCatholicPriest 2)))
;(get-value ((first_name 3)(last_name 3)(email 3)(Address 3)(Area_code 3)(Street_code 3)(account_number 3)(gender 3)(isCatholicPriest 3)))
;(get-value ((first_name 4)(last_name 4)(email 4)(Address 4)(Area_code 4)(Street_code 4)(account_number 4)(gender 4)(isCatholicPriest 4)))
;(get-value ((first_name 5)(last_name 5)(email 5)(Address 5)(Area_code 5)(Street_code 5)(account_number 5)(gender 5)(isCatholicPriest 5)))
;(get-value ((first_name 6)(last_name 6)(email 6)(Address 6)(Area_code 6)(Street_code 6)(account_number 6)(gender 6)(isCatholicPriest 6)))
;(get-value ((first_name 7)(last_name 7)(email 7)(Address 7)(Area_code 7)(Street_code 7)(account_number 7)(gender 7)(isCatholicPriest 7)))
;(get-value ((first_name 8)(last_name 8)(email 8)(Address 8)(Area_code 8)(Street_code 8)(account_number 8)(gender 8)(isCatholicPriest 8)))
;(get-value ((first_name 9)(last_name 9)(email 9)(Address 9)(Area_code 9)(Street_code 9)(account_number 9)(gender 9)(isCatholicPriest 9)))
;(get-value ((first_name 10)(last_name 10)(email 10)(Address 10)(Area_code 10)(Street_code 10)(account_number 10)(gender 10)(isCatholicPriest 10)))
;(get-value ((first_name 11)(last_name 11)(email 11)(Address 11)(Area_code 11)(Street_code 11)(account_number 11)(gender 11)(isCatholicPriest 11)))
;(get-value ((first_name 12)(last_name 12)(email 12)(Address 12)(Area_code 12)(Street_code 12)(account_number 12)(gender 12)(isCatholicPriest 12)))
;(get-value ((first_name 13)(last_name 13)(email 13)(Address 13)(Area_code 13)(Street_code 13)(account_number 13)(gender 13)(isCatholicPriest 13)))
;(get-value ((first_name 14)(last_name 14)(email 14)(Address 14)(Area_code 14)(Street_code 14)(account_number 14)(gender 14)(isCatholicPriest 14)))
;(get-value ((first_name 15)(last_name 15)(email 15)(Address 15)(Area_code 15)(Street_code 15)(account_number 15)(gender 15)(isCatholicPriest 15)))

