(declare-const first_name String)
(declare-const last_name String)
(declare-const email String)
(declare-const age Int)
(declare-const gender String)
(declare-const phone String)
(declare-const address String)
(declare-const education_level String)
(declare-fun Person (Int) Bool)

(assert 
    (forall ((o Int))
        (=> (Person o)
            (and (> (str.len first_name) 5)
                 (str.in.re first_name (re.* (re.range "a" "z")))))))

(assert 
    (forall ((o Int))
        (=> (Person o)
            (and (> (str.len last_name) 5)
                 (str.in.re last_name (re.* (re.union (re.range "A" "Z") (re.range "a" "z"))))))))

(assert
   (forall ((o Int))
       (=> (Person o)
           (not (= first_name last_name)))))

(assert
  (forall ((o Int))
      (=> (Person o)
          (= email (str.++ first_name "." last_name "@mu.ie")))))

(assert
  (forall ((o Int))
      (=> (Person o)
          (str.suffixof "mu.ie" email))))

(assert
  (forall ((o Int))
      (=> (Person o)
          (and (>= age 18) (<= age 99)))))

(assert
  (forall ((o Int))
      (=> (Person o)
          (or (= gender "Male") (= gender "Female")))))

(assert
  (forall ((o Int))
      (=> (Person o)
          (str.in.re phone (re.* (re.range "0" "9"))))))

(assert
  (forall ((o Int))
      (=> (Person o)
          (= (str.len phone) 10))))

(assert
  (forall ((o Int))
      (=> (Person o)
          (and (> (str.len address) 0)
               (str.in.re address (re.* (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9"))))))))

(assert
  (forall ((o Int))
      (=> (Person o)
          (or (= education_level "High School") (= education_level "Bachelor's") (= education_level "Master's")))))

(assert (exists ((o Int)) (Person o)))
(check-sat)
(get-value (first_name last_name email age gender phone address education_level))
