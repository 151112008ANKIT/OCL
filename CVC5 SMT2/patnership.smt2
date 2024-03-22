(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)
(declare-fun father_name (Int) String)
(declare-fun mother_name (Int) String)
(declare-fun child_name (Int) String)
(declare-fun Partner (Int) String)
(declare-fun parent (Int) String)
(declare-fun relationship_status (Int) String)

(define-fun Person ((o Int)) Bool
  true
)

(assert 
  (forall ((o Int)) (=> (Person o)  
    (and 
      (> (str.len (father_name o)) 15)  
      (str.in_re (father_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
    )
  ))
)

(assert 
  (forall ((o Int)) (=> (Person o)  
    (and 
      (> (str.len (mother_name o)) 15)  
      (str.in_re (mother_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
    )
  ))
)

(assert 
  (forall ((o Int)) (=> (Person o)  
    (and 
      (> (str.len (child_name o)) 15)  
      (str.in_re (child_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
    )
  ))
)

(assert 
  (forall ((o Int)) (=> (Person o)
    (= (parent o) 
       (str.++ (str.substr (father_name o) 0 5) "$" (str.substr (mother_name o) (- (str.len (mother_name o)) 5) 5)))
  )
))

(define-fun rel_status ((o Int)) String
  "Partners"
)

(assert (exists ((o Int)) (Person o))) 

(assert (distinct 
(father_name 1) 
(father_name 2) 
(father_name 3) 
(father_name 4) 
(father_name 5)
))

(assert (distinct 
(mother_name 1) 
(mother_name 2) 
(mother_name 3) 
(mother_name 4) 
(mother_name 5) 

))
(assert (distinct 
(child_name 1) 
(child_name 2) 
(child_name 3) 
(child_name 4) 
(child_name 5) 

))

(check-sat)
(get-value ((father_name 1)(mother_name 1)(child_name 1)(rel_status 1)(parent 1)))
;(get-value ((father_name 2)(mother_name 2)(child_name 2)(rel_status 2)(parent 2)))
;(get-value ((father_name 3)(mother_name 3)(child_name 3)(rel_status 3)(parent 3)))
;(get-value ((father_name 4)(mother_name 4)(child_name 4)(rel_status 4)(parent 4)))
;(get-value ((father_name 5)(mother_name 5)(child_name 5)(rel_status 5)(parent 5)))
