(declare-fun Paper_name (Int) String)
(declare-fun Researcher_name (Int) String)
(declare-fun Student_paper (Int) Bool)
(declare-fun word_Count (Int) Int) 

(declare-fun isStudent (Int) Bool)
(declare-fun isPaper (Int) Bool)
(declare-fun isResearcher (Int) Bool)

(define-fun Person ((o Int)) Bool
    (and (isResearcher o) (isStudent o))
)

(assert 
    (forall ((o Int)) (=> (isPaper o)  
        (and 
            (> (str.len (Paper_name o)) 15)  
            (str.in.re (Paper_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isResearcher o)  
        (and 
            (> (str.len (Researcher_name o)) 15)  
            (str.in.re (Researcher_name o) (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

; Constraint: word_Count should be greater than 10000 and less than 15000
(assert (and (> (word_Count 1) 1000) (< (word_Count 1) 15000)))

; Constraint: if Student_paper is True, then Author must be a student
(assert (=> (Student_paper 1) (isStudent 1)))

; Constraint: There must be at least one Student_paper
(assert (exists ((o Int)) (and (isPaper o) (Student_paper o))))

(assert (exists ((o Int)) (isPaper o)))
(assert (exists ((o Int)) (isResearcher o)))
(check-sat)
(get-value ((Paper_name 1) (Researcher_name 1) (Student_paper 1) (word_Count 1) (isResearcher 1)))
