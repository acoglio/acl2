(THM-NATP-ADD-TYPE)
(STD-NATP-ERROR)
(STD-NATP-TYPE1 (1 1
                   (:REWRITE SIMPLIFY-TERMS-SUCH-AS-A+AB-<-0))
                (1 1 (:REWRITE SIMPLIFY-SUMS-<))
                (1 1
                   (:REWRITE SIMPLIFY-PRODUCTS-GATHER-EXPONENTS-<))
                (1 1
                   (:REWRITE REMOVE-WEAK-INEQUALITIES-TWO))
                (1 1
                   (:REWRITE REMOVE-WEAK-INEQUALITIES-ONE))
                (1 1 (:REWRITE REDUCE-INTEGERP-+))
                (1 1 (:REWRITE PREFER-POSITIVE-ADDENDS-<))
                (1 1
                   (:REWRITE NORMALIZE-TERMS-SUCH-AS-A/A+B-+-B/A+B))
                (1 1 (:REWRITE NORMALIZE-ADDENDS))
                (1 1 (:REWRITE INTEGERP-MINUS-X))
                (1 1 (:REWRITE DEFAULT-<-2))
                (1 1 (:REWRITE DEFAULT-<-1))
                (1 1 (:REWRITE DEFAULT-+-2))
                (1 1 (:REWRITE DEFAULT-+-1))
                (1 1 (:REWRITE |(< (- x) 0)|))
                (1 1 (:REWRITE |(< (- x) (- y))|))
                (1 1 (:META META-INTEGERP-CORRECT)))
(STD-NATP-TYPE2 (1 1
                   (:REWRITE SIMPLIFY-TERMS-SUCH-AS-A+AB-<-0))
                (1 1 (:REWRITE SIMPLIFY-SUMS-<))
                (1 1
                   (:REWRITE SIMPLIFY-PRODUCTS-GATHER-EXPONENTS-<))
                (1 1
                   (:REWRITE REMOVE-WEAK-INEQUALITIES-TWO))
                (1 1
                   (:REWRITE REMOVE-WEAK-INEQUALITIES-ONE))
                (1 1 (:REWRITE REDUCE-INTEGERP-+))
                (1 1 (:REWRITE PREFER-POSITIVE-ADDENDS-<))
                (1 1 (:REWRITE INTEGERP-MINUS-X))
                (1 1 (:REWRITE DEFAULT-<-2))
                (1 1 (:REWRITE DEFAULT-<-1))
                (1 1 (:REWRITE |(< (- x) 0)|))
                (1 1 (:REWRITE |(< (- x) (- y))|))
                (1 1 (:META META-INTEGERP-CORRECT)))
(STD-NATP-DEF (2 2 (:REWRITE DEFAULT-UNARY-MINUS))
              (1 1 (:REWRITE STD-NATP-TYPE2))
              (1 1
                 (:REWRITE SIMPLIFY-TERMS-SUCH-AS-A+AB-<-0))
              (1 1 (:REWRITE SIMPLIFY-SUMS-<))
              (1 1
                 (:REWRITE SIMPLIFY-PRODUCTS-GATHER-EXPONENTS-EQUAL))
              (1 1
                 (:REWRITE SIMPLIFY-PRODUCTS-GATHER-EXPONENTS-<))
              (1 1
                 (:REWRITE REMOVE-WEAK-INEQUALITIES-TWO))
              (1 1
                 (:REWRITE REMOVE-WEAK-INEQUALITIES-ONE))
              (1 1 (:REWRITE REDUCE-INTEGERP-+))
              (1 1
                 (:REWRITE PREFER-POSITIVE-ADDENDS-EQUAL))
              (1 1 (:REWRITE PREFER-POSITIVE-ADDENDS-<))
              (1 1
                 (:REWRITE NORMALIZE-TERMS-SUCH-AS-A/A+B-+-B/A+B))
              (1 1 (:REWRITE INTEGERP-MINUS-X))
              (1 1 (:REWRITE DEFAULT-<-2))
              (1 1 (:REWRITE DEFAULT-<-1))
              (1 1 (:REWRITE DEFAULT-+-2))
              (1 1 (:REWRITE DEFAULT-+-1))
              (1 1 (:REWRITE |(equal (- x) (- y))|))
              (1 1 (:REWRITE |(equal (+ c x) d)|))
              (1 1 (:REWRITE |(< (- x) 0)|))
              (1 1 (:REWRITE |(< (- x) (- y))|))
              (1 1 (:REWRITE |(+ c (+ d x))|))
              (1 1 (:META META-INTEGERP-CORRECT)))
