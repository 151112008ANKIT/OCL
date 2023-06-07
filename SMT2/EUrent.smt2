(set-logic QF_LIA)



;; Declare constants and functions
(declare-const NameOfTenant1 String)
(declare-const Age1 Int)
(declare-const PropertyIsAvailable1 Bool)
(declare-const PropertyID1 Int)

(declare-const NameOfTenant2 String)
(declare-const Age2 Int)
(declare-const PropertyIsAvailable2 Bool)
(declare-const PropertyID2 Int)

;; Add constraints and properties
(assert (> Age1 18)) ;; Age should be greater than 18
(assert (> Age2 18)) ;; Age should be greater than 18

(assert (distinct PropertyID1 PropertyID2)) ;; Property IDs should be different

(assert (=> (not PropertyIsAvailable1) (distinct NameOfTenant1 NameOfTenant2))) ;; If property is not available, tenant names should be distinct
(assert (=> (not PropertyIsAvailable2) (distinct NameOfTenant1 NameOfTenant2))) ;; If property is not available, tenant names should be distinct

;; Generate a model
(check-sat)
(get-model)
