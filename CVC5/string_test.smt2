(set-logic QF_SLIA)
(set-option :produce-models true)
(declare-const first_name String)
(declare-const last_name String)
(declare-const email String)

(assert (> (str.len first_name) 5))
(assert (str.in_re first_name (re.* (re.range "a" "z"))))

(assert (> (str.len last_name) 5))
(assert (str.in_re last_name (re.* (re.range "a" "z"))))

(assert (not (= first_name last_name)))

(declare-const email_format String)
(declare-const email_suffix String)

(assert (= email_suffix "@mu.ie"))
(assert (= email_format (str.++ first_name "." last_name)))

(assert (= email (str.++ email_format email_suffix)))

(check-sat)
(get-model)
