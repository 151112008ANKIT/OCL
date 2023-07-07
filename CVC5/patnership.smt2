(set-logic QF_SLIA)
(set-option :produce-models true)

(declare-const father_name String)
(declare-const mother_name String)
(declare-const child_name String)
(declare-const parent_name String)
(declare-const relationship_status String)

; Constraint: Length and character pattern for father's name
(assert (> (str.len father_name) 5))
(assert (str.in_re father_name (re.* (re.range "a" "z"))))

; Constraint: Length and character pattern for mother's name
(assert (> (str.len mother_name) 5))
(assert (str.in_re mother_name (re.* (re.range "A" "Z"))))

; Constraint: Length and character pattern for child's name
(assert (> (str.len child_name) 5))
(assert (str.in_re child_name (re.* (re.range "A" "Z"))))

; Constraint: Child's parent should be the father and mother
(assert (= parent_name (str.++ father_name mother_name)))

; Constraint: Set relationship as "Partners" between the father and mother
(assert (= relationship_status "Partners"))

(check-sat)
(get-value (father_name mother_name child_name parent_name relationship_status))
