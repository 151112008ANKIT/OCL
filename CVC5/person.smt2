(set-logic ALL)
(set-option :produce-models true)

(declare-const first_name String)
(declare-const last_name String)
(declare-const email String)
(declare-const Gender String)
(declare-const Eircode String)
(declare-const Area_code String)
(declare-const Street_code String)
(declare-const IsCatholicPriest Bool)

(assert (> (str.len first_name) 5))
(assert (str.in_re first_name (re.* (re.range "a" "z"))))

(assert (> (str.len last_name) 5))
(assert (str.in_re last_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z")))))

(assert (not (= first_name last_name)))

(assert (= email (str.++ first_name "." last_name "@gmail.com")))

(assert (= (str.len Eircode) 5))
(assert (str.in_re Eircode (re.* (re.union (re.range "A" "Z") (re.range "0" "9")))))

(assert (= Area_code (str.at Eircode 0)))
(assert (= Street_code (str.at Eircode 4)))

(assert (or (= Gender "Male") (= Gender "Female")))

(assert (=> (= Gender "Male") IsCatholicPriest))

; Using quantifiers to express a property
(assert (forall ((p1 String) (p2 String))
           (=> (and (= (str.at p1 0) (str.at p2 0)) (= (str.len p1) 5) (= (str.len p2) 5))
               (= Gender Gender))))

(check-sat)
(get-value(first_name last_name email Gender Eircode Area_code Street_code IsCatholicPriest))
