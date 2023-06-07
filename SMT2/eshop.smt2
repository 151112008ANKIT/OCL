(set-logic QF_LIA)

;; Declare constants and functions
(declare-const productId1 Int)
(declare-const nameOfProduct1 String)
(declare-const price1 Int)
(declare-const isAvailable1 Bool)

(declare-const productId2 Int)
(declare-const nameOfProduct2 String)
(declare-const price2 Int)
(declare-const isAvailable2 Bool)

;; Add constraints and properties

;; Ensure product ID and product name are different
(assert (distinct productId1 productId2))
(assert (distinct nameOfProduct1 nameOfProduct2))

;; Unavailable product cannot be bought
(assert (=> (not isAvailable1) (not (and (= productId1 1) (= price1 10))))) ; Example constraint for product 1
(assert (=> (not isAvailable2) (not (and (= productId2 2) (= price2 20))))) ; Example constraint for product 2

;; User cannot buy the same product 10 times
(assert (<= (ite (= productId1 1) (ite (= isAvailable1 true) 1 0) 0) 10)) ; Example constraint for product 1
(assert (<= (ite (= productId2 2) (ite (= isAvailable2 true) 1 0) 0) 10)) ; Example constraint for product 2

;; Generate a model
(check-sat)
(get-model)
