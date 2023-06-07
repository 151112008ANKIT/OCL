(set-logic QF_BV)


;; Declare constants and functions
(declare-const person1 String)
(declare-const person2 String)
(declare-const person3 String)

(declare-const partner (Array String String))
(declare-const parent (Array String (Array String Bool)))
(declare-const child (Array String (Array String Bool)))

;; Add constraints and properties

;; Name length constraint: Name is of maximum 20 characters
(assert (<= (str.len person1) 20))

;; No self-partnership constraint: A person cannot be their own partner
(assert (not (= (select partner person1) person1)))

;; Each child has two parents constraint
(assert (forall ((p String))
           (=> (select (select child p) person1)
               (and (exists ((par String))
                           (select (select parent p) par))
                    (exists ((par String))
                           (select (select parent p) par))))))

;; Each child's parents are partners constraint
(assert (forall ((p String))
           (=> (select (select child p) person1)
               (exists ((par1 String) (par2 String))
                       (and (select (select parent p) par1)
                            (select (select parent p) par2)
                            (= (select partner par1) par2)
                            (= (select partner par2) par1))))))

;; Generate a model
(check-sat)
(get-model)
