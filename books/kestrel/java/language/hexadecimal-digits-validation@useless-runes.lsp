(JAVA::GRAMMAR-HEX-DIGITP)
(JAVA::GRAMMAR-HEX-DIGITP-SUFF)
(JAVA::BOOLEANP-OF-GRAMMAR-HEX-DIGITP)
(JAVA::GRAMMAR-HEX-DIGITP)
(JAVA::SINGLETON-WHEN-GRAMMAR-HEX-DIGITP
 (900 898 (:REWRITE DEFAULT-CAR))
 (898 898 (:REWRITE CAR-WHEN-ALL-EQUALP))
 (768 96
      (:REWRITE ABNF::TREE-TERMINATEDP-OF-CAR-WHEN-TREE-LIST-TERMINATEDP))
 (663 102
      (:REWRITE ABNF::TREEP-WHEN-MAYBE-TREEP))
 (640
    160
    (:REWRITE
         ABNF::TREE-LIST-TERMINATEDP-OF-CAR-WHEN-TREE-LIST-LIST-TERMINATEDP))
 (631
     631
     (:REWRITE
          ABNF::TREE-NONLEAF->BRANCHES$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST))
 (510 51
      (:REWRITE ABNF::MAYBE-TREEP-WHEN-TREEP))
 (400
  400
  (:REWRITE
    ABNF::CAR-OF-TREE-LIST-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-EQUIV))
 (358 356 (:REWRITE DEFAULT-CDR))
 (336
    336
    (:REWRITE ABNF::CAR-OF-TREE-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-EQUIV))
 (320 320
      (:REWRITE ABNF::TREE-LIST-TERMINATEDP-WHEN-SUBSETP-EQUAL))
 (320
  320
  (:REWRITE
   ABNF::TREE-LIST-TERMINATEDP-WHEN-MEMBER-EQUAL-OF-TREE-LIST-LIST-TERMINATEDP))
 (320
     320
     (:REWRITE CAR-OF-TRUE-LIST-LIST-FIX-X-NORMALIZE-CONST-UNDER-LIST-EQUIV))
 (294 294
      (:REWRITE ABNF::TREE-KIND$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST))
 (262
     262
     (:REWRITE
          ABNF::TREE-TERMINATEDP-WHEN-MEMBER-EQUAL-OF-TREE-LIST-TERMINATEDP))
 (258 258
      (:REWRITE ABNF::TREE-LIST-LIST-TERMINATEDP-WHEN-SUBSETP-EQUAL))
 (204 204
      (:REWRITE ABNF::TREEP-WHEN-MEMBER-EQUAL-OF-TREE-LISTP))
 (192
    192
    (:REWRITE ABNF::TREE-LEAFTERM->GET$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST))
 (160 160
      (:REWRITE ABNF::TREE-LIST-TERMINATEDP-WHEN-NOT-CONSP))
 (160 160
      (:REWRITE ABNF::TREE-LIST-TERMINATEDP-WHEN-ATOM))
 (153 153
      (:TYPE-PRESCRIPTION ABNF::MAYBE-TREEP))
 (144 16
      (:REWRITE
           ABNF::TREE-MATCH-ELEMENT-P-OF-CAR-WHEN-TREE-LIST-MATCH-ELEMENT-P))
 (135 129
      (:REWRITE ABNF::TREE-LIST-LIST-TERMINATEDP-WHEN-NOT-CONSP))
 (135 129
      (:REWRITE ABNF::TREE-LIST-LIST-TERMINATEDP-WHEN-ATOM))
 (102 102
      (:REWRITE ABNF::TREEP-WHEN-PARSE-TREEP))
 (102 102
      (:REWRITE ABNF::TREEP-WHEN-IN-TREE-SETP-BINDS-FREE-X))
 (102 102
      (:REWRITE JAVA::ABNF-TREEP-WHEN-ABNF-TREE-WITH-ROOT-P))
 (85 34 (:REWRITE LEN-WHEN-ATOM))
 (80
  80
  (:REWRITE
   ABNF::CDR-OF-TREE-LIST-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-LIST-EQUIV))
 (71 65
     (:REWRITE ABNF::TREE-LIST-LIST->STRING-WHEN-ATOM))
 (67 67
     (:REWRITE ABNF::TREE-TERMINATEDP-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (65 65
     (:REWRITE ABNF::TREE->STRING-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (64
    64
    (:REWRITE
         ABNF::TREE-LIST-TERMINATEDP-OF-TREE-LIST-FIX-TREES-NORMALIZE-CONST))
 (64
  64
  (:REWRITE
   ABNF::TREE-LIST-LIST-TERMINATEDP-OF-TREE-LIST-LIST-FIX-TREESS-NORMALIZE-CONST))
 (64 64
     (:REWRITE ABNF::TREE-LIST->STRING-WHEN-ATOM))
 (64
   64
   (:REWRITE ABNF::NAT-MATCH-INSENSITIVE-CHAR-P-OF-NFIX-NAT-NORMALIZE-CONST))
 (64
   64
   (:REWRITE
        ABNF::NAT-MATCH-INSENSITIVE-CHAR-P-OF-CHAR-FIX-CHAR-NORMALIZE-CONST))
 (64
    64
    (:REWRITE
         ABNF::CDR-OF-TREE-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-EQUIV))
 (64 64
     (:REWRITE CAR-OF-NAT-LIST-FIX-X-NORMALIZE-CONST-UNDER-NAT-EQUIV))
 (64 64
     (:REWRITE CAR-OF-INTEGER-LIST-FIX-X-NORMALIZE-CONST-UNDER-INT-EQUIV))
 (50
    50
    (:REWRITE
         ABNF::TREE-NONLEAF->RULENAME?$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST))
 (48 48
     (:REWRITE CAR-OF-BOOLEAN-LIST-FIX-X-NORMALIZE-CONST-UNDER-IFF))
 (34
  34
  (:REWRITE
   ABNF::TREE-MATCH-ELEMENT-P-WHEN-MEMBER-EQUAL-OF-TREE-LIST-MATCH-ELEMENT-P))
 (32 32
     (:TYPE-PRESCRIPTION ABNF::TREE-LIST-MATCH-ELEMENT-P))
 (32 32
     (:REWRITE ABNF::TREE-LIST-MATCH-ELEMENT-P-WHEN-SUBSETP-EQUAL))
 (32
  32
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-CONCATENATION-P-OF-TREE-LIST-LIST-FIX-TREESS-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-CONCATENATION-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-CONCATENATION-P-OF-CONCATENATION-FIX-CONCATENATION-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
   ABNF::TREE-LIST-LIST->STRING-OF-TREE-LIST-LIST-FIX-TREESS-NORMALIZE-CONST))
 (32
   32
   (:REWRITE ABNF::TREE-LIST->STRING-OF-TREE-LIST-FIX-TREES-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
   ABNF::NATS-MATCH-INSENSITIVE-CHARS-P-OF-NAT-LIST-FIX-NATS-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
   ABNF::NATS-MATCH-INSENSITIVE-CHARS-P-OF-MAKE-CHARACTER-LIST-CHARS-NORMALIZE-CONST))
 (17 17
     (:REWRITE ABNF::TREE-MATCH-ELEMENT-P-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (17 17
     (:REWRITE
          ABNF::TREE-MATCH-ELEMENT-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (17 17
     (:REWRITE
          ABNF::TREE-MATCH-ELEMENT-P-OF-ELEMENT-FIX-ELEMENT-NORMALIZE-CONST))
 (17
  17
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-ALTERNATION-P-OF-TREE-LIST-LIST-FIX-TREESS-NORMALIZE-CONST))
 (17
  17
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-ALTERNATION-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (17
  17
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-ALTERNATION-P-OF-ALTERNATION-FIX-ALTERNATION-NORMALIZE-CONST))
 (16 16
     (:REWRITE ABNF::TREE-MATCH-CHAR-VAL-P-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (16
  16
  (:REWRITE
       ABNF::TREE-MATCH-CHAR-VAL-P-OF-CHAR-VAL-FIX-CHAR-VAL-NORMALIZE-CONST))
 (16
  16
  (:REWRITE
   ABNF::TREE-LIST-MATCH-REPETITION-P-OF-TREE-LIST-FIX-TREES-NORMALIZE-CONST))
 (16
  16
  (:REWRITE
   ABNF::TREE-LIST-MATCH-REPETITION-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (16
  16
  (:REWRITE
   ABNF::TREE-LIST-MATCH-REPETITION-P-OF-REPETITION-FIX-REPETITION-NORMALIZE-CONST))
 (16 16
     (:REWRITE ABNF::TREE-LIST-MATCH-ELEMENT-P-WHEN-NOT-CONSP))
 (16
  16
  (:REWRITE
     ABNF::TREE-LIST-MATCH-ELEMENT-P-OF-TREE-LIST-FIX-TREES-NORMALIZE-CONST))
 (16
  16
  (:REWRITE
      ABNF::TREE-LIST-MATCH-ELEMENT-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (16
  16
  (:REWRITE
     ABNF::TREE-LIST-MATCH-ELEMENT-P-OF-ELEMENT-FIX-ELEMENT-NORMALIZE-CONST))
 (16 16
     (:REWRITE CDR-OF-NAT-LIST-FIX-X-NORMALIZE-CONST-UNDER-NAT-LIST-EQUIV))
 (4 4
    (:LINEAR LOWER-BOUND-OF-LEN-WHEN-SUBLISTP))
 (4 4
    (:LINEAR LISTPOS-UPPER-BOUND-STRONG-2))
 (4 4 (:LINEAR LEN-WHEN-PREFIXP))
 (3 3
    (:REWRITE ABNF::TREE-LEAFRULE->GET$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST))
 (2
  2
  (:REWRITE
   JAVA::ABNF-TREE-WITH-ROOT-P-WHEN-MEMBER-EQUAL-OF-ABNF-TREE-LIST-WITH-ROOT-P))
 (2 2 (:LINEAR INDEX-OF-<-LEN))
 (1 1
    (:REWRITE JAVA::GRAMMAR-HEX-DIGITP-SUFF))
 (1 1
    (:REWRITE
         JAVA::ABNF-TREE-WITH-ROOT-P-OF-STR-FIX-RULENAME-NORMALIZE-CONST)))
(JAVA::HEX-DIGIT-TREE
   (36 36 (:REWRITE DEFAULT-<-2))
   (36 36 (:REWRITE DEFAULT-<-1))
   (12 12
       (:REWRITE JAVA::HEX-DIGITP-WHEN-MEMBER-EQUAL-OF-HEX-DIGIT-LISTP))
   (6 6
      (:REWRITE ABNF::TREEP-WHEN-PARSE-TREEP))
   (6 6
      (:REWRITE ABNF::TREEP-WHEN-IN-TREE-SETP-BINDS-FREE-X))
   (6 6
      (:REWRITE ABNF::TREE-LISTP-WHEN-SUBSETP-EQUAL))
   (6 6
      (:REWRITE ABNF::TREE-LISTP-WHEN-MEMBER-EQUAL-OF-TREE-LIST-LISTP))
   (6 6
      (:REWRITE ABNF::TREE-LIST-LISTP-WHEN-SUBSETP-EQUAL))
   (6 6
      (:REWRITE JAVA::ABNF-TREEP-WHEN-ABNF-TREE-WITH-ROOT-P))
   (3 3
      (:REWRITE ABNF::TREE-LISTP-WHEN-NOT-CONSP))
   (3 3
      (:REWRITE ABNF::TREE-LIST-LISTP-WHEN-NOT-CONSP))
   (3 3
      (:REWRITE ABNF::TREE-LEAFTERM-OF-NAT-LIST-FIX-GET-NORMALIZE-CONST))
   (3 3
      (:REWRITE NAT-LISTP-WHEN-UNSIGNED-BYTE-LISTP))
   (3 3
      (:REWRITE CONS-OF-NFIX-X-NORMALIZE-CONST-UNDER-NAT-LIST-EQUIV))
   (3 3
      (:REWRITE CONS-OF-NAT-LIST-FIX-Y-NORMALIZE-CONST-UNDER-NAT-LIST-EQUIV))
   (3 3
      (:REWRITE JAVA::ABNF-TREE-LISTP-WHEN-ABNF-TREE-LIST-WITH-ROOT-P))
   (1 1
      (:TYPE-PRESCRIPTION JAVA::HEX-DIGIT-FIX)))
(JAVA::RETURN-TYPE-OF-HEX-DIGIT-TREE
 (144 144 (:REWRITE DEFAULT-CDR))
 (144 144 (:REWRITE DEFAULT-CAR))
 (135 135 (:REWRITE DEFAULT-<-2))
 (135 135 (:REWRITE DEFAULT-<-1))
 (98
  98
  (:REWRITE
   ABNF::TREE-MATCH-ELEMENT-P-WHEN-MEMBER-EQUAL-OF-TREE-LIST-MATCH-ELEMENT-P))
 (51
  51
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-ALTERNATION-P-OF-TREE-LIST-LIST-FIX-TREESS-NORMALIZE-CONST))
 (51
  51
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-ALTERNATION-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (51
  51
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-ALTERNATION-P-OF-ALTERNATION-FIX-ALTERNATION-NORMALIZE-CONST))
 (49 49
     (:REWRITE ABNF::TREE-MATCH-ELEMENT-P-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (49 49
     (:REWRITE
          ABNF::TREE-MATCH-ELEMENT-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (49 49
     (:REWRITE
          ABNF::TREE-MATCH-ELEMENT-P-OF-ELEMENT-FIX-ELEMENT-NORMALIZE-CONST))
 (48 48
     (:REWRITE ABNF::TREE-MATCH-CHAR-VAL-P-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
       ABNF::TREE-MATCH-CHAR-VAL-P-OF-CHAR-VAL-FIX-CHAR-VAL-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
   ABNF::TREE-LIST-MATCH-REPETITION-P-OF-TREE-LIST-FIX-TREES-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
   ABNF::TREE-LIST-MATCH-REPETITION-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
   ABNF::TREE-LIST-MATCH-REPETITION-P-OF-REPETITION-FIX-REPETITION-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-CONCATENATION-P-OF-TREE-LIST-LIST-FIX-TREESS-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-CONCATENATION-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-CONCATENATION-P-OF-CONCATENATION-FIX-CONCATENATION-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
   ABNF::NATS-MATCH-INSENSITIVE-CHARS-P-OF-NAT-LIST-FIX-NATS-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
   ABNF::NATS-MATCH-INSENSITIVE-CHARS-P-OF-MAKE-CHARACTER-LIST-CHARS-NORMALIZE-CONST))
 (48
   48
   (:REWRITE ABNF::NAT-MATCH-INSENSITIVE-CHAR-P-OF-NFIX-NAT-NORMALIZE-CONST))
 (48
   48
   (:REWRITE
        ABNF::NAT-MATCH-INSENSITIVE-CHAR-P-OF-CHAR-FIX-CHAR-NORMALIZE-CONST))
 (48
  48
  (:REWRITE
   ABNF::CDR-OF-TREE-LIST-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-LIST-EQUIV))
 (48 48
     (:REWRITE CDR-OF-NAT-LIST-FIX-X-NORMALIZE-CONST-UNDER-NAT-LIST-EQUIV))
 (48
  48
  (:REWRITE
    ABNF::CAR-OF-TREE-LIST-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-EQUIV))
 (48
    48
    (:REWRITE ABNF::CAR-OF-TREE-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-EQUIV))
 (48 48
     (:REWRITE CAR-OF-NAT-LIST-FIX-X-NORMALIZE-CONST-UNDER-NAT-EQUIV))
 (48 48
     (:REWRITE CAR-OF-INTEGER-LIST-FIX-X-NORMALIZE-CONST-UNDER-INT-EQUIV))
 (34 2
     (:REWRITE JAVA::HEX-DIGIT-FIX-WHEN-HEX-DIGITP))
 (30 5
     (:REWRITE ABNF::TREEP-WHEN-MAYBE-TREEP))
 (15 5
     (:REWRITE ABNF::MAYBE-TREEP-WHEN-TREEP))
 (10 10
     (:TYPE-PRESCRIPTION ABNF::MAYBE-TREEP))
 (8 8
    (:REWRITE JAVA::HEX-DIGITP-WHEN-MEMBER-EQUAL-OF-HEX-DIGIT-LISTP))
 (6 6
    (:REWRITE ABNF::TREE-LEAFTERM-OF-NAT-LIST-FIX-GET-NORMALIZE-CONST))
 (6
  6
  (:REWRITE
   ABNF::CONS-OF-TREE-LIST-LIST-FIX-Y-NORMALIZE-CONST-UNDER-TREE-LIST-LIST-EQUIV))
 (6
   6
   (:REWRITE
        ABNF::CONS-OF-TREE-LIST-FIX-Y-NORMALIZE-CONST-UNDER-TREE-LIST-EQUIV))
 (6
  6
  (:REWRITE
   ABNF::CONS-OF-TREE-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-LIST-EQUIV))
 (6
   6
   (:REWRITE ABNF::CONS-OF-TREE-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-EQUIV))
 (6 6
    (:REWRITE CONS-OF-NFIX-X-NORMALIZE-CONST-UNDER-NAT-LIST-EQUIV))
 (6 6
    (:REWRITE CONS-OF-NAT-LIST-FIX-Y-NORMALIZE-CONST-UNDER-NAT-LIST-EQUIV))
 (5 5
    (:REWRITE ABNF::TREEP-WHEN-PARSE-TREEP))
 (5 5
    (:REWRITE ABNF::TREEP-WHEN-IN-TREE-SETP-BINDS-FREE-X))
 (5 5
    (:REWRITE
         ABNF::TREE-NONLEAF-OF-TREE-LIST-LIST-FIX-BRANCHES-NORMALIZE-CONST))
 (5 5
    (:REWRITE
         ABNF::TREE-NONLEAF-OF-MAYBE-RULENAME-FIX-RULENAME?-NORMALIZE-CONST))
 (5 5
    (:REWRITE JAVA::ABNF-TREEP-WHEN-ABNF-TREE-WITH-ROOT-P))
 (4 4
    (:REWRITE
         ABNF::TREE-TERMINATEDP-WHEN-MEMBER-EQUAL-OF-TREE-LIST-TERMINATEDP))
 (4 4
    (:REWRITE ABNF::TREE-LIST-LIST-TERMINATEDP-WHEN-SUBSETP-EQUAL))
 (2 2 (:TYPE-PRESCRIPTION JAVA::HEX-DIGITP))
 (2 2
    (:REWRITE ABNF::TREE-TERMINATEDP-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (2 2
    (:REWRITE ABNF::TREE-LIST-TERMINATEDP-WHEN-SUBSETP-EQUAL))
 (2
  2
  (:REWRITE
   ABNF::TREE-LIST-TERMINATEDP-WHEN-MEMBER-EQUAL-OF-TREE-LIST-LIST-TERMINATEDP))
 (2 2
    (:REWRITE ABNF::TREE-LIST-LIST-TERMINATEDP-WHEN-NOT-CONSP))
 (2 2
    (:REWRITE ABNF::TREE-LIST-LIST-TERMINATEDP-WHEN-ATOM))
 (1 1
    (:REWRITE ABNF::TREE-LIST-TERMINATEDP-WHEN-NOT-CONSP))
 (1 1
    (:REWRITE ABNF::TREE-LIST-TERMINATEDP-WHEN-ATOM)))
(JAVA::TREE->STRING-OF-HEX-DIGIT-TREE
 (25 25 (:REWRITE DEFAULT-<-2))
 (25 25 (:REWRITE DEFAULT-<-1))
 (18 2
     (:REWRITE JAVA::HEX-DIGIT-FIX-WHEN-HEX-DIGITP))
 (6 6
    (:REWRITE JAVA::HEX-DIGITP-WHEN-MEMBER-EQUAL-OF-HEX-DIGIT-LISTP))
 (6 1
    (:REWRITE ABNF::TREEP-WHEN-MAYBE-TREEP))
 (3 1
    (:REWRITE ABNF::MAYBE-TREEP-WHEN-TREEP))
 (2 2
    (:TYPE-PRESCRIPTION ABNF::MAYBE-TREEP))
 (2 2
    (:REWRITE ABNF::TREE-LEAFTERM-OF-NAT-LIST-FIX-GET-NORMALIZE-CONST))
 (2 2
    (:REWRITE ABNF::TREE->STRING-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (2
  2
  (:REWRITE
   ABNF::CONS-OF-TREE-LIST-LIST-FIX-Y-NORMALIZE-CONST-UNDER-TREE-LIST-LIST-EQUIV))
 (2
   2
   (:REWRITE
        ABNF::CONS-OF-TREE-LIST-FIX-Y-NORMALIZE-CONST-UNDER-TREE-LIST-EQUIV))
 (2
  2
  (:REWRITE
   ABNF::CONS-OF-TREE-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-LIST-EQUIV))
 (2
   2
   (:REWRITE ABNF::CONS-OF-TREE-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-EQUIV))
 (2 2
    (:REWRITE CONS-OF-NFIX-X-NORMALIZE-CONST-UNDER-NAT-LIST-EQUIV))
 (2 2
    (:REWRITE CONS-OF-NAT-LIST-FIX-Y-NORMALIZE-CONST-UNDER-NAT-LIST-EQUIV))
 (1 1 (:TYPE-PRESCRIPTION JAVA::HEX-DIGITP))
 (1 1
    (:REWRITE ABNF::TREEP-WHEN-PARSE-TREEP))
 (1 1
    (:REWRITE ABNF::TREEP-WHEN-IN-TREE-SETP-BINDS-FREE-X))
 (1 1
    (:REWRITE
         ABNF::TREE-NONLEAF-OF-TREE-LIST-LIST-FIX-BRANCHES-NORMALIZE-CONST))
 (1 1
    (:REWRITE
         ABNF::TREE-NONLEAF-OF-MAYBE-RULENAME-FIX-RULENAME?-NORMALIZE-CONST))
 (1 1
    (:REWRITE ABNF::TREE-LIST-LIST->STRING-WHEN-ATOM))
 (1 1
    (:REWRITE JAVA::ABNF-TREEP-WHEN-ABNF-TREE-WITH-ROOT-P)))
(JAVA::HEX-DIGIT-TREE-OF-HEX-DIGIT-FIX-DIGIT)
(JAVA::HEX-DIGIT-TREE-OF-HEX-DIGIT-FIX-DIGIT-NORMALIZE-CONST)
(JAVA::HEX-DIGIT-TREE-HEX-DIGIT-EQUIV-CONGRUENCE-ON-DIGIT)
(JAVA::GRAMMAR-HEX-DIGITP-WHEN-HEX-DIGITP)
(JAVA::LEMMA
 (5229 5012 (:REWRITE DEFAULT-CDR))
 (4874 4081 (:REWRITE DEFAULT-CAR))
 (4081 4081 (:REWRITE CAR-WHEN-ALL-EQUALP))
 (3528 252
       (:REWRITE SET::SETS-ARE-TRUE-LISTS-CHEAP))
 (2046
     2046
     (:REWRITE CAR-OF-TRUE-LIST-LIST-FIX-X-NORMALIZE-CONST-UNDER-LIST-EQUIV))
 (2002
  2002
  (:REWRITE
     CDR-OF-TRUE-LIST-LIST-FIX-X-NORMALIZE-CONST-UNDER-TRUE-LIST-LIST-EQUIV))
 (1764 252 (:REWRITE TRUE-LISTP-WHEN-ATOM))
 (1496 220
       (:REWRITE ABNF::TREEP-OF-CAR-WHEN-TREE-LISTP))
 (1365 91
       (:REWRITE JAVA::HEX-DIGITP-OF-CAR-WHEN-HEX-DIGIT-LISTP))
 (1104 1104
       (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-SYMBOL-SYMBOL-ALISTP
                 . 2))
 (1104 1104
       (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-SYMBOL-SYMBOL-ALISTP
                 . 1))
 (1104 1104 (:REWRITE CONSP-BY-LEN))
 (886 310 (:REWRITE LEN-WHEN-ATOM))
 (870 191
      (:REWRITE ABNF::MAYBE-RULENAMEP-WHEN-RULENAMEP))
 (704 64
      (:REWRITE INTEGERP-OF-CAR-WHEN-INTEGER-LISTP))
 (668 668
      (:REWRITE ABNF::TREE-LISTP-WHEN-SUBSETP-EQUAL))
 (668 668
      (:REWRITE ABNF::TREE-LISTP-WHEN-MEMBER-EQUAL-OF-TREE-LIST-LISTP))
 (637 91
      (:REWRITE JAVA::HEX-DIGIT-LISTP-WHEN-NOT-CONSP))
 (610 610
      (:LINEAR LOWER-BOUND-OF-LEN-WHEN-SUBLISTP))
 (610 610
      (:LINEAR LISTPOS-UPPER-BOUND-STRONG-2))
 (610 610 (:LINEAR LEN-WHEN-PREFIXP))
 (576 32 (:DEFINITION INTEGER-LISTP))
 (556 166 (:REWRITE NAT-LISTP-WHEN-NOT-CONSP))
 (540 540
      (:REWRITE ABNF::TREEP-WHEN-MEMBER-EQUAL-OF-TREE-LISTP))
 (504 504 (:TYPE-PRESCRIPTION SET::SETP-TYPE))
 (504 252
      (:REWRITE ABNF::SETP-WHEN-TREE-SETP))
 (504 252
      (:REWRITE ABNF::SETP-WHEN-RULENAME-SETP))
 (504 252 (:REWRITE SET::SETP-WHEN-NAT-SETP))
 (504 252
      (:REWRITE SET::SETP-WHEN-INTEGER-SETP))
 (504 252 (:REWRITE SET::NONEMPTY-MEANS-SET))
 (502 103
      (:REWRITE ABNF::RULENAMEP-WHEN-MAYBE-RULENAMEP))
 (440 132
      (:REWRITE ABNF::TREE-LISTP-OF-CAR-WHEN-TREE-LIST-LISTP))
 (429 429 (:REWRITE CONSP-OF-CDR-BY-LEN))
 (420 420
      (:REWRITE ABNF::TREE-LIST-LISTP-WHEN-SUBSETP-EQUAL))
 (334 334
      (:REWRITE JAVA::ABNF-TREE-LISTP-WHEN-ABNF-TREE-LIST-WITH-ROOT-P))
 (320 32
      (:REWRITE NAT-LIST-FIX-WHEN-NAT-LISTP))
 (305 305 (:LINEAR INDEX-OF-<-LEN))
 (292 292
      (:TYPE-PRESCRIPTION ABNF::RULENAMEP))
 (292 292
      (:REWRITE ABNF::TREEP-WHEN-PARSE-TREEP))
 (292 292
      (:REWRITE ABNF::TREEP-WHEN-IN-TREE-SETP-BINDS-FREE-X))
 (292 292
      (:REWRITE JAVA::ABNF-TREEP-WHEN-ABNF-TREE-WITH-ROOT-P))
 (288 32
      (:REWRITE
           ABNF::TREE-MATCH-ELEMENT-P-OF-CAR-WHEN-TREE-LIST-MATCH-ELEMENT-P))
 (273 273
      (:REWRITE ABNF::TREE->STRING-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (256 64
      (:REWRITE INTEGER-LISTP-WHEN-NOT-CONSP))
 (252 252
      (:TYPE-PRESCRIPTION ABNF::TREE-SETP))
 (252 252
      (:TYPE-PRESCRIPTION ABNF::RULENAME-SETP))
 (252 252 (:TYPE-PRESCRIPTION SET::NAT-SETP))
 (252 252
      (:TYPE-PRESCRIPTION SET::INTEGER-SETP))
 (252 252
      (:TYPE-PRESCRIPTION SET::EMPTY-TYPE))
 (252 252
      (:REWRITE TRUE-LISTP-WHEN-UNSIGNED-BYTE-LISTP))
 (252 252
      (:REWRITE TRUE-LISTP-WHEN-SIGNED-BYTE-LISTP))
 (252 252
      (:REWRITE JAVA::TRUE-LISTP-WHEN-ABNF-TREE-LIST-WITH-ROOT-P))
 (252 252 (:REWRITE SET::IN-SET))
 (182 182
      (:REWRITE JAVA::HEX-DIGITP-WHEN-MEMBER-EQUAL-OF-HEX-DIGIT-LISTP))
 (182 182
      (:REWRITE JAVA::HEX-DIGIT-LISTP-WHEN-SUBSETP-EQUAL))
 (180 180
      (:REWRITE ABNF::TREE-LIST-LIST-TERMINATEDP-WHEN-SUBSETP-EQUAL))
 (166 166
      (:REWRITE NAT-LISTP-WHEN-UNSIGNED-BYTE-LISTP))
 (121 121
      (:REWRITE ABNF::TREE-KIND$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST))
 (112 90
      (:REWRITE ABNF::TREE-LIST-LIST-TERMINATEDP-WHEN-NOT-CONSP))
 (112 90
      (:REWRITE ABNF::TREE-LIST-LIST-TERMINATEDP-WHEN-ATOM))
 (103 103
      (:REWRITE ABNF::RULENAMEP-WHEN-IN-RULENAME-SETP-BINDS-FREE-X))
 (96
  96
  (:REWRITE
   ABNF::NATS-MATCH-INSENSITIVE-CHARS-P-OF-NAT-LIST-FIX-NATS-NORMALIZE-CONST))
 (96
  96
  (:REWRITE
   ABNF::NATS-MATCH-INSENSITIVE-CHARS-P-OF-MAKE-CHARACTER-LIST-CHARS-NORMALIZE-CONST))
 (66
  66
  (:REWRITE
   ABNF::TREE-MATCH-ELEMENT-P-WHEN-MEMBER-EQUAL-OF-TREE-LIST-MATCH-ELEMENT-P))
 (66
  66
  (:REWRITE
   ABNF::TREE-LIST-LIST-TERMINATEDP-OF-TREE-LIST-LIST-FIX-TREESS-NORMALIZE-CONST))
 (64 64
     (:TYPE-PRESCRIPTION ABNF::TREE-LIST-MATCH-ELEMENT-P))
 (64 64
     (:REWRITE ABNF::TREE-LIST-MATCH-ELEMENT-P-WHEN-SUBSETP-EQUAL))
 (64
  64
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-CONCATENATION-P-OF-TREE-LIST-LIST-FIX-TREESS-NORMALIZE-CONST))
 (64
  64
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-CONCATENATION-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (64
  64
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-CONCATENATION-P-OF-CONCATENATION-FIX-CONCATENATION-NORMALIZE-CONST))
 (64 32
     (:REWRITE INTEGER-LISTP-OF-CDR-WHEN-INTEGER-LISTP))
 (50 50
     (:REWRITE
          ABNF::TREE-TERMINATEDP-WHEN-MEMBER-EQUAL-OF-TREE-LIST-TERMINATEDP))
 (44
    44
    (:REWRITE
         CDR-OF-BOOLEAN-LIST-FIX-X-NORMALIZE-CONST-UNDER-BOOLEAN-LIST-EQUIV))
 (44 44
     (:REWRITE CAR-OF-BOOLEAN-LIST-FIX-X-NORMALIZE-CONST-UNDER-IFF))
 (35
  35
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-ALTERNATION-P-OF-TREE-LIST-LIST-FIX-TREESS-NORMALIZE-CONST))
 (35
  35
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-ALTERNATION-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (35
  35
  (:REWRITE
   ABNF::TREE-LIST-LIST-MATCH-ALTERNATION-P-OF-ALTERNATION-FIX-ALTERNATION-NORMALIZE-CONST))
 (33 33
     (:REWRITE ABNF::TREE-MATCH-ELEMENT-P-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (33 33
     (:REWRITE
          ABNF::TREE-MATCH-ELEMENT-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (33 33
     (:REWRITE
          ABNF::TREE-MATCH-ELEMENT-P-OF-ELEMENT-FIX-ELEMENT-NORMALIZE-CONST))
 (32 32
     (:REWRITE ABNF::TREE-MATCH-CHAR-VAL-P-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
       ABNF::TREE-MATCH-CHAR-VAL-P-OF-CHAR-VAL-FIX-CHAR-VAL-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
   ABNF::TREE-LIST-MATCH-REPETITION-P-OF-TREE-LIST-FIX-TREES-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
   ABNF::TREE-LIST-MATCH-REPETITION-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
   ABNF::TREE-LIST-MATCH-REPETITION-P-OF-REPETITION-FIX-REPETITION-NORMALIZE-CONST))
 (32 32
     (:REWRITE ABNF::TREE-LIST-MATCH-ELEMENT-P-WHEN-NOT-CONSP))
 (32
  32
  (:REWRITE
     ABNF::TREE-LIST-MATCH-ELEMENT-P-OF-TREE-LIST-FIX-TREES-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
      ABNF::TREE-LIST-MATCH-ELEMENT-P-OF-RULELIST-FIX-RULES-NORMALIZE-CONST))
 (32
  32
  (:REWRITE
     ABNF::TREE-LIST-MATCH-ELEMENT-P-OF-ELEMENT-FIX-ELEMENT-NORMALIZE-CONST))
 (32
    32
    (:REWRITE ABNF::TREE-LEAFTERM->GET$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST))
 (32
   32
   (:REWRITE ABNF::NAT-MATCH-INSENSITIVE-CHAR-P-OF-NFIX-NAT-NORMALIZE-CONST))
 (32
   32
   (:REWRITE
        ABNF::NAT-MATCH-INSENSITIVE-CHAR-P-OF-CHAR-FIX-CHAR-NORMALIZE-CONST))
 (32 32 (:REWRITE DEFAULT-<-2))
 (32 32 (:REWRITE DEFAULT-<-1))
 (32
  32
  (:REWRITE
   ABNF::CDR-OF-TREE-LIST-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-LIST-EQUIV))
 (32 32
     (:REWRITE CDR-OF-NAT-LIST-FIX-X-NORMALIZE-CONST-UNDER-NAT-LIST-EQUIV))
 (32
  32
  (:REWRITE
    ABNF::CAR-OF-TREE-LIST-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-LIST-EQUIV))
 (32
    32
    (:REWRITE ABNF::CAR-OF-TREE-LIST-FIX-X-NORMALIZE-CONST-UNDER-TREE-EQUIV))
 (32 32
     (:REWRITE CAR-OF-NAT-LIST-FIX-X-NORMALIZE-CONST-UNDER-NAT-EQUIV))
 (32 32
     (:REWRITE CAR-OF-INTEGER-LIST-FIX-X-NORMALIZE-CONST-UNDER-INT-EQUIV))
 (27 27
     (:REWRITE
          ABNF::TREE-NONLEAF->BRANCHES$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST))
 (25 25
     (:REWRITE ABNF::TREE-TERMINATEDP-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (25 25
     (:REWRITE ABNF::MAYBE-RULENAME-FIX-WHEN-NONE))
 (24 4
     (:REWRITE ABNF::TREE-LIST-LIST-FIX-UNDER-IFF))
 (16 16
     (:TYPE-PRESCRIPTION ABNF::TREE-LIST-LIST-FIX$INLINE))
 (8 4
    (:REWRITE ABNF::TREE-LIST-LISTP-OF-CDR-WHEN-TREE-LIST-LISTP))
 (5 5 (:REWRITE CONSP-OF-CDDR-BY-LEN))
 (3 3
    (:REWRITE
         ABNF::TREE-NONLEAF->RULENAME?$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST))
 (2
   2
   (:REWRITE ABNF::TREE-LEAFRULE->GET$INLINE-OF-TREE-FIX-X-NORMALIZE-CONST)))
(JAVA::HEX-DIGITP-WHEN-GRAMMAR-HEX-DIGITP
 (30 3
     (:REWRITE JAVA::HEX-DIGITP-OF-CAR-WHEN-HEX-DIGIT-LISTP))
 (12 3
     (:REWRITE JAVA::HEX-DIGIT-LISTP-WHEN-NOT-CONSP))
 (12 3 (:REWRITE DEFAULT-CAR))
 (6 6
    (:TYPE-PRESCRIPTION JAVA::HEX-DIGIT-LISTP))
 (6 6
    (:REWRITE JAVA::HEX-DIGITP-WHEN-MEMBER-EQUAL-OF-HEX-DIGIT-LISTP))
 (6 6
    (:REWRITE JAVA::HEX-DIGIT-LISTP-WHEN-SUBSETP-EQUAL))
 (6 6
    (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-SYMBOL-SYMBOL-ALISTP
              . 2))
 (6 6
    (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-SYMBOL-SYMBOL-ALISTP
              . 1))
 (6
  6
  (:REWRITE
   JAVA::ABNF-TREE-WITH-ROOT-P-WHEN-MEMBER-EQUAL-OF-ABNF-TREE-LIST-WITH-ROOT-P))
 (3 3
    (:REWRITE ABNF::TREE->STRING-OF-TREE-FIX-TREE-NORMALIZE-CONST))
 (3 3
    (:REWRITE
         JAVA::ABNF-TREE-WITH-ROOT-P-OF-STR-FIX-RULENAME-NORMALIZE-CONST)))
(JAVA::HEX-DIGITP-IS-GRAMMAR-HEX-DIGITP
     (2 2
        (:REWRITE JAVA::HEX-DIGITP-WHEN-MEMBER-EQUAL-OF-HEX-DIGIT-LISTP)))
