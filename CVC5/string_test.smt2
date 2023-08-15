(set-logic ALL)
(set-option :produce-models true)

(declare-const first_name String)
(declare-const last_name String)
(declare-const email String)

(assert (> (str.len first_name) 5))
(assert (str.in_re first_name (re.* (re.range "a" "z"))))

(assert (> (str.len last_name) 5))
(assert (str.in_re last_name (re.* (re.range "a" "z"))))

(declare-const email_format String)
(declare-const email_suffix String)

(assert (= email_suffix "@mu.ie"))
(assert (= email_format (str.++ first_name "." last_name)))

(assert (= email (str.++ email_format email_suffix)))

; Using quantifiers to express the property
(assert (forall ((fn String) (ln String))
           (=> (and (= fn first_name) (= ln last_name))
               (not (= fn ln)))))

(check-sat)
(get-value(first_name last_name email))
