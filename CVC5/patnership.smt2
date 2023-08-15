(set-logic ALL)
(set-option :produce-models true)

(declare-const father_name String)
(declare-const mother_name String)
(declare-const child_name String)
(declare-const parent_name String)
(declare-const relationship_status String)

(assert (> (str.len father_name) 5))
(assert (str.in_re father_name (re.* (re.range "a" "z"))))

(assert (> (str.len mother_name) 5))
(assert (str.in_re mother_name (re.* (re.range "A" "Z"))))

(assert (> (str.len child_name) 5))
(assert (str.in_re child_name (re.* (re.range "A" "Z"))))

(assert (= parent_name (str.++ father_name mother_name)))

(assert (= relationship_status "Partners"))

; Using quantifiers to express a property
(assert (forall ((c String))
           (=> (str.in_re c (re.* (re.range "A" "Z")))
               (= relationship_status "Partners"))))

(check-sat)
(get-value (father_name mother_name child_name parent_name relationship_status))
