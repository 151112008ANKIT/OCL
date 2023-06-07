(set-logic ALL)

;; Declare sorts
(declare-sort Paper 0)
(declare-sort Researcher 0)

;; Declare constants and functions
(declare-const paper1 Paper)
(declare-const paper2 Paper)

(declare-const researcher1 Researcher)
(declare-const researcher2 Researcher)

;; Define associations between Paper and Researcher
(define-fun Manuscript ((p Paper)) Researcher
  (ite (= p paper1) researcher1
       (ite (= p paper2) researcher2
            researcher1)))

(define-fun Submission ((p Paper)) Researcher
  (ite (= p paper1) researcher2
       (ite (= p paper2) researcher1
            researcher2)))

;; Add constraints and invariants

;; (1) oneManuscript: Each Paper should have exactly one Manuscript
(assert (= (Manuscript paper1) researcher1))
(assert (= (Manuscript paper2) researcher2))

;; (2) oneSubmission: Each Paper should have exactly one Submission
(assert (= (Submission paper1) researcher2))
(assert (= (Submission paper2) researcher1))

;; (3) A paper cannot be refereed by one of its authors
(assert (distinct (Manuscript paper1) (Submission paper1)))
(assert (distinct (Manuscript paper2) (Submission paper2)))

;; (4) Restrict the wordCount attribute of the paper to be 15000 words
(declare-const wordCount1 Int)
(declare-const wordCount2 Int)

(assert (= wordCount1 15000))
(assert (= wordCount2 15000))

;; (5) One of the authors of a student Paper must be a student
(declare-const student1 Researcher)
(declare-const student2 Researcher)

(assert (or (= (Manuscript paper1) student1) (= (Submission paper1) student1)))
(assert (or (= (Manuscript paper2) student2) (= (Submission paper2) student2)))

;; (6) Students are not allowed to review papers
(declare-const review1 Researcher)
(declare-const review2 Researcher)

(assert (or (not (= (Manuscript paper1) review1)) (not (= (Submission paper1) review1))))
(assert (or (not (= (Manuscript paper2) review2)) (not (= (Submission paper2) review2))))

;; Generate a model
(check-sat)
(get-model)
