(set-logic QF_SLIA)
(set-option :produce-models true)

(declare-const Paper_name String)
(declare-const Researcher_name String)
(declare-const Student_paper Bool)
(declare-const isStudent Bool)
(declare-const word_Count Int)

(assert (> (str.len Paper_name) 5))
(assert (str.in_re Paper_name (re.* (re.range "a" "z"))))

(assert (> (str.len Researcher_name) 15))
(assert (str.in_re Researcher_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z")))))

; Constraint: if Student_paper is True, then Author must be a student
(assert (=> Student_paper isStudent))

; Constraint: There must be at least one Student_paper
(assert Student_paper)

; Additional constraint: word_Count must be greater than 100 and less than 15000
(assert (and (> word_Count 100) (< word_Count 15000)))

(check-sat)
(get-value (Paper_name Researcher_name Student_paper isStudent word_Count))
