(declare-fun Atom_name (Int) String)
(declare-fun Atom_weight (Int) Int)
(declare-fun Atom_Symbol (Int) String)
(declare-fun isNobelGas (Int) Bool)
(declare-fun isReactive (Int) Bool)

(define-fun Atom ((o Int)) Bool
   true
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (and
            (> (str.len (Atom_name o)) 5)
            (str.in.re (Atom_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (and
            (> (Atom_weight o) 0)
            (<= (Atom_weight o) 295)
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (= (Atom_Symbol o) (str.substr (Atom_name o) 0 2))
    ))
)


(assert 
    (forall ((o Int)) (=> (Atom o)
        (=> (isNobelGas o)
            (not (isReactive o))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (Atom o)
        (or (not (isNobelGas o)) (isReactive o))
    ))
)



(assert (exists ((o Int)) (Atom o)))

(assert (distinct 
    (str.++ (Atom_name 1) "1")
    (str.++ (Atom_name 2) "2")
    (str.++ (Atom_name 3) "3") 
    (str.++ (Atom_Symbol 1) "1") 
    (str.++ (Atom_Symbol 2) "2") 
    (str.++ (Atom_Symbol 3) "3") 
     (str.++ (Atom_name 4) "1")
    (str.++ (Atom_name 5) "2")
    (str.++ (Atom_Symbol 4) "1") 
    (str.++ (Atom_Symbol 5) "2") 
     (str.++ (Atom_name 6) "1")
    (str.++ (Atom_name 7) "2")
    (str.++ (Atom_name 8) "3") 
    (str.++ (Atom_Symbol 6) "1") 
    (str.++ (Atom_Symbol 7) "2") 
    (str.++ (Atom_Symbol 8) "3") 
    (str.++ (Atom_name 9) "1")
    (str.++ (Atom_name 10) "2")
    (str.++ (Atom_Symbol 9) "1") 
    (str.++ (Atom_Symbol 10) "2") 
    (str.++ (Atom_name 11) "1")
    (str.++ (Atom_name 12) "2")
    (str.++ (Atom_Symbol 11) "1") 
    (str.++ (Atom_Symbol 12) "2") 
    (str.++ (Atom_name 13) "1")
    (str.++ (Atom_name 14) "2")
    (str.++ (Atom_Symbol 13) "1") 
    (str.++ (Atom_Symbol 14) "2") 
    (str.++ (Atom_name 15) "1")
    (str.++ (Atom_Symbol 15) "1") 

  
  
    
 

))

(assert (distinct 
    (Atom_weight 1)
    (Atom_weight 2)
    (Atom_weight 3)
     (Atom_weight 4)
    (Atom_weight 5)
     (Atom_weight 6)
    (Atom_weight 7)
    (Atom_weight 8)
     (Atom_weight 9)
    (Atom_weight 10)
     (Atom_weight 11)
    (Atom_weight 12)
    (Atom_weight 13)
     (Atom_weight 14)
    (Atom_weight 15)

))

(check-sat)
(get-value ((Atom_name 1) (Atom_weight 1)(Atom_Symbol 1)(isReactive 1)))
;(get-value ((Atom_name 2) (Atom_weight 2)(Atom_Symbol 2)(isReactive 2)))
;(get-value ((Atom_name 3)(Atom_weight 3)(Atom_Symbol 3)(isReactive 3)))
;(get-value ((Atom_name 4)(Atom_weight 4)(Atom_Symbol 4)(isReactive 4)))
;(get-value ((Atom_name 5)(Atom_weight 5)(Atom_Symbol 5)(isReactive 5)))
;(get-value ((Atom_name 6) (Atom_weight 6)(Atom_Symbol 6)(isReactive 6)))
;(get-value ((Atom_name 7) (Atom_weight 7)(Atom_Symbol 7)(isReactive 7)))
;(get-value ((Atom_name 8)(Atom_weight 8)(Atom_Symbol 8)(isReactive 8)))
;(get-value ((Atom_name 9)(Atom_weight 9)(Atom_Symbol 9)(isReactive 9)))
;(get-value ((Atom_name 10)(Atom_weight 10)(Atom_Symbol 10)(isReactive 10)))
;(get-value ((Atom_name 11)(Atom_weight 11)(Atom_Symbol 11)(isReactive 11)))
;(get-value ((Atom_name 12)(Atom_weight 12)(Atom_Symbol 12)(isReactive 12)))
;(get-value ((Atom_name 13)(Atom_weight 13)(Atom_Symbol 13)(isReactive 13)))
;(get-value ((Atom_name 14)(Atom_weight 14)(Atom_Symbol 14)(isReactive 14)))
;(get-value ((Atom_name 15)(Atom_weight 15)(Atom_Symbol 15)(isReactive 15)))

