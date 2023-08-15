(set-logic ALL)
(set-option :produce-models true)

(declare-const customer_name String)
(declare-const Sales_Id Int)
(declare-const customerID Int)
(declare-const customerPhone String)

(assert (> (str.len customer_name) 5))
(assert (str.in_re customer_name (re.* (re.range "a" "z"))))

(assert (> Sales_Id 1))
(assert (> customerID 1))

(assert (distinct customerID Sales_Id))

(assert (= (str.len customerPhone) 10))
(assert (str.in_re customerPhone (re.* (re.range "0" "9"))))

; Using quantifiers to express a property
(assert (forall ((id Int))
           (=> (and (> id 1) (< id Sales_Id))
               (not (= customerID id)))))

(check-sat)
(get-value(customer_name Sales_Id customerID customerPhone))
