(set-logic QF_LIA)

;; Declare constants and functions
(declare-const accountName1 String)
(declare-const address1 String)
(declare-const accountNumber1 Int)
(declare-const bankBranch1 String)

(declare-const accountName2 String)
(declare-const address2 String)
(declare-const accountNumber2 Int)
(declare-const bankBranch2 String)

;; Add constraints and properties
(assert (distinct accountNumber1 accountNumber2)) 
;; Account numbers should be distinct
(assert (or (distinct accountName1 accountName2) (distinct bankBranch1 bankBranch2))) 
;; One person can't have two accounts in the same branch

;; Add additional constraints or properties as needed

;; Generate a model
(check-sat)
(get-model)


