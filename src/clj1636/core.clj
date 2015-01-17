(ns clj1636.core)

;; Quick attempts to make small bits of code that reproduce the
;; problem.  No success in reproducing it with such small examples
;; yet.

(defn -main []
;  (dotimes [i 1000000]
;    (assert (= [] (vec #{}))))
;  (dotimes [i 1000000]
;    (assert (= [] (-> (keys {})
;                      set
;                      (disj 'Object 'java.lang.Object)
;                      vec))))
  (dotimes [i 10000000]
    (assert (= [:foo :a] (-> (map identity (keys {:a 1 :foo 2}))
                      set
                      (disj 'Object 'java.lang.Object)
                      vec)))
    (assert (= [] (-> (map identity (keys {}))
                      set
                      (disj 'Object 'java.lang.Object)
                      vec)))
    )
  )

(comment

;; This all works as expected, with no warning messages.

(def i1 (.iterator {:a 1 :b 2}))
(.next i1)
(.next i1)
(.next i1)

;; Verify that the code I wrote will print out a message if a
;; SeqIterator is constructed in one thread, but .next is called from
;; a different thread.

(def i1 (.iterator {:a 1 :b 2}))
(def f1 (future (.next i1)))
;; ====================> SeqIterator created by 1 thread, but accessed from another.
;; #'user/f1
@f1
;; [:b 2]

)
