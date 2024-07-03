(set-logic ALL)
(set-option :produce-models true)
(set-option :strings-exp true)
(set-option :mbqi true)

(declare-fun Oid (Int) Int)
(declare-fun father_name (Int) String)
(declare-fun mother_name (Int) String)
(declare-fun child_name (Int) String)
(declare-fun Partner (Int) String)
(declare-fun parent (Int) String)
(declare-fun relationship_status (Int) String)

(define-fun Person ((o Int)) Bool true)

(assert 
  (forall ((o Int)) (=> (Person o)  
    (and 
      (> (str.len (father_name (Oid o))) 15)  
      (str.in_re (father_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
    )
  ))
)

(assert 
  (forall ((o Int)) (=> (Person o)  
    (and 
      (> (str.len (mother_name (Oid o))) 15)  
      (str.in_re (mother_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
    )
  ))
)

(assert 
  (forall ((o Int)) (=> (Person o)  
    (and 
      (> (str.len (child_name (Oid o))) 15)  
      (str.in_re (child_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
    )
  ))
)

(assert 
  (forall ((o Int)) (=> (Person o)
    (= (parent (Oid o)) 
       (str.++ (str.substr (father_name (Oid o)) 0 5) "$" (str.substr (mother_name (Oid o)) (- (str.len (mother_name (Oid o))) 5) 5)))
  )
))

(define-fun rel_status ((o Int)) String
  "Partners"
)

(assert (exists ((o Int)) (Person o)))

(assert (distinct 
  (father_name (Oid 1)) 
  (father_name (Oid 2)) 

))

(assert (distinct 
  (mother_name (Oid 1)) 
  (mother_name (Oid 2)) 

))

(assert (distinct 
  (child_name (Oid 1)) 
  (child_name (Oid 2)) 
  
))

(check-sat)
(get-value ((father_name (Oid 1))(mother_name (Oid 1))(child_name (Oid 1))(rel_status (Oid 1))(parent (Oid 1))))
(get-value ((father_name (Oid 2))(mother_name (Oid 2))(child_name (Oid 2))(rel_status (Oid 2))(parent (Oid 2))))
;(get-value ((father_name (Oid 3))(mother_name (Oid 3))(child_name (Oid 3))(rel_status (Oid 3))(parent (Oid 3))))
;(get-value ((father_name (Oid 4))(mother_name (Oid 4))(child_name (Oid 4))(rel_status (Oid 4))(parent (Oid 4))))
;(get-value ((father_name (Oid 5))(mother_name (Oid 5))(child_name (Oid 5))(rel_status (Oid 5))(parent (Oid 5))))
