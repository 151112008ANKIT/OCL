(declare-fun Oid (Int) Int)
(declare-fun Paper_name (Int) String)
(declare-fun Researcher_name (Int) String)
(declare-fun Student_paper (Int) Bool)
(declare-fun word_Count (Int) Int) 
(declare-fun Student_name (Int) String)
(declare-fun isStudent (Int) Bool)
(declare-fun isPaper (Int) Bool)
(declare-fun isResearcher (Int) Bool)

(define-fun Person ((o Int)) Bool true)

(assert 
    (forall ((o Int)) (=> (isPaper (Oid o))  
        (and 
            (> (str.len (Paper_name (Oid o))) 15)  
            (str.in.re (Paper_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isResearcher (Oid o))  
        (and 
            (> (str.len (Researcher_name (Oid o))) 15)  
            (str.in.re (Researcher_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isStudent (Oid o))  
        (and 
            (= (str.len (Student_name (Oid o))) 15)  
            (str.in.re (Student_name (Oid o)) (re.* (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isPaper (Oid o))
        (and (> (word_Count (Oid o)) 10000) (< (word_Count (Oid o)) 25000))
    ))
)

(assert 
    (forall ((o Int)) (=> (Student_paper (Oid o)) (isStudent (Oid o))))
)

(assert (exists ((o Int)) (and (isPaper (Oid o)) (Student_paper (Oid o)))))
(assert (exists ((o Int)) (isPaper (Oid o))))
(assert (exists ((o Int)) (isResearcher (Oid o))))

(assert (distinct 
    (str.++ (Paper_name (Oid 1)) "1")
    (str.++ (Paper_name (Oid 2)) "2")
    (str.++ (Paper_name (Oid 3)) "3")    
    (str.++ (Researcher_name (Oid 1)) "1")
    (str.++ (Researcher_name (Oid 2)) "2") 
    (str.++ (Researcher_name (Oid 3)) "3")  
    (str.++ (Student_name (Oid 1)) "1") 
    (str.++ (Student_name (Oid 2)) "2")
    (str.++ (Student_name (Oid 3)) "3")  
))

(check-sat)
(get-value ((Paper_name (Oid 1))(Student_name (Oid 1))(Researcher_name (Oid 1))(Student_paper (Oid 1))(word_Count (Oid 1))))
(get-value ((Paper_name (Oid 2))(Student_name (Oid 2))(Researcher_name (Oid 2))(Student_paper (Oid 2))(word_Count (Oid 2))))
(get-value ((Paper_name (Oid 3))(Student_name (Oid 3))(Researcher_name (Oid 3))(Student_paper (Oid 3))(word_Count (Oid 3))))
