(set-logic ALL)
(set-option :produce-models true)
;(set-option :strings-exp true)
;(set-option :mbqi true)
(declare-fun Paper_name (Int) String)
(declare-fun Researcher_name (Int) String)
(declare-fun Student_paper (Int) Bool)
(declare-fun word_Count (Int) Int) 
(declare-fun Student_name (Int) String)
(declare-fun isStudent (Int) Bool)
(declare-fun isPaper (Int) Bool)
(declare-fun isResearcher (Int) Bool)

(define-fun Person ((o Int)) Bool
    true)





(assert 
    (forall ((o Int)) (=> (isPaper o)  
        (and 
            (> (str.len (Paper_name o)) 15)  
            (str.in_re (Paper_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)


(assert 
    (forall ((o Int)) (=> (isResearcher o)  
        (and 
            (> (str.len (Researcher_name o)) 15)  
            (str.in_re (Researcher_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isStudent o)  
        (and 
            (= (str.len (Student_name o)) 15)  
             (str.in_re (Student_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

; Constraint: word_Count should be greater than 10000 and less than 25000

(assert 
    (forall ((o Int)) (=> (isPaper o)
        (and (> (word_Count o) 10000) (< (word_Count o) 25000))
    ))
)

; Constraint: if Student_paper is True, then Author must be a student
(assert 
    (forall ((o Int)) (=> (Student_paper o) (isStudent o)))
)

; Constraint: There must be at least one Student_paper
(assert (exists ((o Int)) (and (isPaper o) (Student_paper o))))

(assert (exists ((o Int)) (isPaper o)))
(assert (exists ((o Int)) (isResearcher o)))

;(assert (distinct (Paper_name 1) (Paper_name 2)))

(check-sat)
(get-value ((Paper_name 1)(Student_name 1) (Researcher_name 1) (Student_paper 1) (word_Count 1) ))
