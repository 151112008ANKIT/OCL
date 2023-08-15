(set-logic ALL)
(set-option :produce-models true)

(declare-fun Atom_name () String)
(declare-fun Atomic_Weight () Int)
(declare-fun Atomic_Symbol () String)
(declare-fun isNobelGas1 () Bool)
(declare-fun isReactive1 () Bool)
(declare-fun Atom (Int) Bool)

(assert (> (str.len Atom_name) 5))
(assert (str.in_re Atom_name (re.* (re.range "A" "Z"))))
(assert (= (str.substr Atom_name 0 2) Atomic_Symbol))
(assert (> Atomic_Weight 0))

; Using quantifiers to express properties involving atoms
(assert (forall ((x Int))
           (=> (Atom x)
               (and (>= x 0)
                    (< x 10)))))

(check-sat)
(get-value (Atom_name Atomic_Weight Atomic_Symbol isNobelGas1 isReactive1))
