(LOG2 (230 230
           (:TYPE-PRESCRIPTION NOT-INTEGERP-4B))
      (230 230
           (:TYPE-PRESCRIPTION NOT-INTEGERP-3B))
      (230 230
           (:TYPE-PRESCRIPTION NOT-INTEGERP-2B))
      (230 230
           (:TYPE-PRESCRIPTION NOT-INTEGERP-1B))
      (95 24 (:REWRITE DEFAULT-LESS-THAN-1))
      (91 7 (:TYPE-PRESCRIPTION FLOOR-ZERO . 2))
      (81 31 (:REWRITE DEFAULT-PLUS-2))
      (80 31 (:REWRITE DEFAULT-PLUS-1))
      (71 71 (:TYPE-PRESCRIPTION NUMERATOR-ZERO))
      (63 7
          (:TYPE-PRESCRIPTION FLOOR-POSITIVE . 1))
      (63 7
          (:TYPE-PRESCRIPTION FLOOR-NONPOSITIVE . 1))
      (63 7
          (:TYPE-PRESCRIPTION FLOOR-NEGATIVE . 1))
      (60 60 (:TYPE-PRESCRIPTION NOT-INTEGERP-3A))
      (60 60 (:TYPE-PRESCRIPTION NOT-INTEGERP-2A))
      (60 60 (:TYPE-PRESCRIPTION NOT-INTEGERP-1A))
      (35 7 (:TYPE-PRESCRIPTION FLOOR-ZERO . 4))
      (35 7 (:TYPE-PRESCRIPTION FLOOR-ZERO . 3))
      (35 7 (:TYPE-PRESCRIPTION FLOOR-ZERO . 1))
      (35 7
          (:TYPE-PRESCRIPTION FLOOR-POSITIVE . 3))
      (35 7
          (:TYPE-PRESCRIPTION FLOOR-POSITIVE . 2))
      (35 7
          (:TYPE-PRESCRIPTION FLOOR-NONPOSITIVE . 3))
      (35 7
          (:TYPE-PRESCRIPTION FLOOR-NONPOSITIVE . 2))
      (35 7
          (:TYPE-PRESCRIPTION FLOOR-NONNEGATIVE . 3))
      (35 7
          (:TYPE-PRESCRIPTION FLOOR-NEGATIVE . 3))
      (35 7
          (:TYPE-PRESCRIPTION FLOOR-NEGATIVE . 2))
      (29 24 (:REWRITE DEFAULT-LESS-THAN-2))
      (24 24 (:REWRITE THE-FLOOR-BELOW))
      (24 24 (:REWRITE THE-FLOOR-ABOVE))
      (22 22 (:REWRITE DEFAULT-TIMES-2))
      (22 22 (:REWRITE DEFAULT-TIMES-1))
      (21 18
          (:REWRITE REDUCE-RATIONAL-MULTIPLICATIVE-CONSTANT-<))
      (21 18
          (:REWRITE REDUCE-MULTIPLICATIVE-CONSTANT-<))
      (21 16 (:REWRITE |(< (- x) (- y))|))
      (19 6 (:REWRITE DEFAULT-MINUS))
      (18 18
          (:REWRITE REDUCE-ADDITIVE-CONSTANT-<))
      (16 16
          (:REWRITE |(< c (/ x)) positive c --- present in goal|))
      (16 16
          (:REWRITE |(< c (/ x)) positive c --- obj t or nil|))
      (16 16
          (:REWRITE |(< c (/ x)) negative c --- present in goal|))
      (16 16
          (:REWRITE |(< c (/ x)) negative c --- obj t or nil|))
      (16 16 (:REWRITE |(< c (- x))|))
      (16 16
          (:REWRITE |(< (/ x) c) positive c --- present in goal|))
      (16 16
          (:REWRITE |(< (/ x) c) positive c --- obj t or nil|))
      (16 16
          (:REWRITE |(< (/ x) c) negative c --- present in goal|))
      (16 16
          (:REWRITE |(< (/ x) c) negative c --- obj t or nil|))
      (16 16 (:REWRITE |(< (/ x) (/ y))|))
      (15 15 (:REWRITE REMOVE-WEAK-INEQUALITIES))
      (15 15
          (:REWRITE REMOVE-STRICT-INEQUALITIES))
      (15 15 (:REWRITE INTEGERP-<-CONSTANT))
      (15 15 (:REWRITE CONSTANT-<-INTEGERP))
      (13 13
          (:REWRITE NORMALIZE-FACTORS-SCATTER-EXPONENTS))
      (11 1 (:REWRITE DEFAULT-FLOOR-RATIO))
      (10 10
          (:REWRITE NORMALIZE-TERMS-SUCH-AS-A/A+B-+-B/A+B))
      (10 5 (:TYPE-PRESCRIPTION BUBBLE-DOWN))
      (7 7 (:REWRITE |(< (/ x) 0)|))
      (7 7 (:REWRITE |(< (+ c/d x) y)|))
      (7 7 (:REWRITE |(< (+ (- c) x) y)|))
      (7 7 (:REWRITE |(< (* x y) 0)|))
      (6 6 (:TYPE-PRESCRIPTION ABS))
      (5 5
         (:REWRITE SIMPLIFY-TERMS-SUCH-AS-AX+BX-<-0-RATIONAL-REMAINDER))
      (5 5
         (:REWRITE SIMPLIFY-TERMS-SUCH-AS-AX+BX-<-0-RATIONAL-COMMON))
      (4 4 (:REWRITE SIMPLIFY-SUMS-EQUAL))
      (4 4
         (:REWRITE SIMPLIFY-PRODUCTS-SCATTER-EXPONENTS-EQUAL))
      (4 4
         (:REWRITE REDUCE-MULTIPLICATIVE-CONSTANT-EQUAL))
      (4 4 (:REWRITE REDUCE-INTEGERP-+))
      (4 4
         (:REWRITE REDUCE-ADDITIVE-CONSTANT-EQUAL))
      (4 4
         (:REWRITE PREFER-POSITIVE-ADDENDS-EQUAL))
      (4 4 (:REWRITE INTEGERP-MINUS-X))
      (4 4
         (:REWRITE EQUAL-OF-PREDICATES-REWRITE))
      (4 4 (:REWRITE |(equal c (/ x))|))
      (4 4 (:REWRITE |(equal c (- x))|))
      (4 4 (:REWRITE |(equal (/ x) c)|))
      (4 4 (:REWRITE |(equal (/ x) (/ y))|))
      (4 4 (:REWRITE |(equal (- x) c)|))
      (4 4 (:REWRITE |(equal (- x) (- y))|))
      (4 4 (:REWRITE |(< 0 (* x y))|))
      (4 4 (:META META-INTEGERP-CORRECT))
      (3 3 (:REWRITE |(< y (+ (- c) x))|))
      (3 3 (:REWRITE |(< x (+ c/d y))|))
      (3 3 (:REWRITE |(< 0 (/ x))|))
      (2 2 (:REWRITE ZP-OPEN))
      (2 2
         (:REWRITE SIMPLIFY-TERMS-SUCH-AS-0-<-AX+BX-RATIONAL-REMAINDER))
      (2 2
         (:REWRITE |(< (* x y) 0) rationalp (* x y)|))
      (2 2 (:REWRITE |(* (- x) y)|))
      (1 1 (:REWRITE INTEGERP==>NUMERATOR-=-X))
      (1 1 (:REWRITE INTEGERP==>DENOMINATOR-=-1))
      (1 1 (:REWRITE DEFAULT-RATIONAL-NUMERATOR))
      (1 1
         (:REWRITE DEFAULT-RATIONAL-DENOMINATOR))
      (1 1 (:REWRITE DEFAULT-FLOOR-2))
      (1 1 (:REWRITE DEFAULT-FLOOR-1))
      (1 1 (:REWRITE |(floor x 2)| . 2))
      (1 1
         (:REWRITE |(<= (/ x) y) with (< x 0)|))
      (1 1
         (:REWRITE |(<= (/ x) y) with (< 0 x)|))
      (1 1 (:REWRITE |(< x (/ y)) with (< y 0)|))
      (1 1
         (:REWRITE |(< (/ x) y) with (< x 0)|)))
