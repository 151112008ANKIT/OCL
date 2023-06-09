(declare-const Paper_name String)
(declare-const Researcher_name String)
(declare-const Student_paper Bool)
(declare-const isStudent Bool)
(declare-const word_Count Int)
(declare-fun isPaper (Int) Bool)
(declare-fun isResearcher (Int) Bool)

(assert 
    (forall ((o Int)) (=> (isPaper o)  
        (and 
            (> (str.len Paper_name) 15)  
            (str.in.re Paper_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

(assert 
    (forall ((o Int)) (=> (isResearcher o)  
        (and 
            (> (str.len Researcher_name) 15)  
            (str.in.re Researcher_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))
        )
    ))
)

; Constraint: word_Count should be greater than 100 and less than 15000
(assert (and (> word_Count 100) (< word_Count 15000)))

; Constraint: if Student_paper is True, then Author must be a student
(assert (=> Student_paper isStudent))

; Constraint: There must be at least one Student_paper
(assert (exists ((o Int)) (and (isPaper o) Student_paper)))

(assert (exists ((o Int)) (isPaper o)))
(assert (exists ((o Int)) (isResearcher o)))
(check-sat)
(get-value (Paper_name Researcher_name Student_paper isStudent word_Count))
