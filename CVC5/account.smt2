(set-logic QF_SLIA)
(set-option :produce-models true)

(define-sort Name () String)
(define-sort Email () String)
(define-sort Address () String)

(declare-const first_name Name)
(declare-const last_name Name)
(declare-const email Email)
(declare-const account_number Name)
(declare-const address Address)


(assert (> (str.len first_name) 5))
(assert (str.in_re first_name (re.* (re.range "a" "z"))))

(assert (> (str.len last_name) 5))
(assert (str.in_re last_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z")))))

(assert (not (= first_name last_name)))

(assert (= email (str.++ first_name "." last_name "@mu.ie")))

(assert (and (= (str.len account_number) 10) (str.in_re account_number (re.* (re.range "0" "9")))))

(assert (and (= (str.len address) 20) (str.in_re address (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))))


(check-sat)

(get-value (first_name last_name email account_number address))
