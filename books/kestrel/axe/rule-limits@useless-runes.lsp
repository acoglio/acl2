(RULE-LIMITSP)
(LIMIT-REACHEDP
     (795 7 (:DEFINITION PSEUDO-TERMP))
     (372 11
          (:REWRITE AXE-RULE-HYP-LISTP-OF-STORED-RULE-HYPS))
     (315 7
          (:REWRITE PSEUDO-TERMP-OF-STORED-RULE-RHS))
     (310 6 (:DEFINITION AXE-RULE-HYP-LISTP))
     (192 6
          (:REWRITE PSEUDO-TERM-LISTP-OF-STORED-RULE-LHS-ARGS))
     (189 21 (:DEFINITION LENGTH))
     (184 34 (:DEFINITION LEN))
     (183 2
          (:REWRITE SYMBOLP-OF-STORED-RULE-SYMBOL))
     (179 6 (:REWRITE AXE-RULE-HYP-LISTP-OF-CDR))
     (154 77
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (138 136 (:REWRITE DEFAULT-CDR))
     (113 111 (:REWRITE DEFAULT-CAR))
     (104 104
          (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (93 7 (:DEFINITION SYMBOL-LISTP))
     (78 14 (:DEFINITION TRUE-LISTP))
     (73 6 (:DEFINITION PSEUDO-TERM-LISTP))
     (68 34 (:REWRITE DEFAULT-+-2))
     (50 50 (:TYPE-PRESCRIPTION SYMBOL-LISTP))
     (50 25
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (48 48 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (38 19
         (:REWRITE PSEUDO-TERM-LISTP-WHEN-SYMBOL-LISTP-CHEAP))
     (34 34 (:REWRITE DEFAULT-+-1))
     (27 9 (:REWRITE AXE-RULE-HYPP-WHEN-SIMPLE))
     (27 9
         (:REWRITE AXE-RULE-HYPP-WHEN-EQUAL-OF-CAR-AND-WORK-HARD-CHEAP))
     (27 9
         (:REWRITE AXE-RULE-HYPP-WHEN-AXE-BIND-FREE))
     (21 21 (:TYPE-PRESCRIPTION AXE-RULE-HYPP))
     (20 20
         (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (19 19
         (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (13 1 (:DEFINITION SYMBOL-ALISTP))
     (11 1 (:DEFINITION ASSOC-EQUAL))
     (9 9
        (:REWRITE AXE-RULE-HYPP-WHEN-NOT-SPECIAL))
     (7 7
        (:REWRITE PSEUDO-TERMP-OF-LAMBDA-BODY-CHEAP))
     (7 7 (:REWRITE DEFAULT-COERCE-2))
     (7 7 (:REWRITE DEFAULT-COERCE-1))
     (6 1 (:DEFINITION STRIP-CDRS))
     (5 5 (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (5 5 (:REWRITE USE-ALL-STORED-AXE-RULEP))
     (4 2
        (:REWRITE SYMBOL-ALISTP-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (4 2
        (:REWRITE ALISTP-WHEN-PSEUDO-TERM-ALISTP-CHEAP))
     (3 2 (:REWRITE DEFAULT-<-1))
     (2 2
        (:TYPE-PRESCRIPTION PSEUDO-TERM-ALISTP))
     (2 2 (:REWRITE DEFAULT-<-2))
     (2 1
        (:REWRITE ALL-INTEGERP-WHEN-NOT-CONSP-CHEAP))
     (1 1 (:TYPE-PRESCRIPTION STRIP-CDRS)))
(DECREMENT-RULE-LIMIT
     (795 7 (:DEFINITION PSEUDO-TERMP))
     (372 11
          (:REWRITE AXE-RULE-HYP-LISTP-OF-STORED-RULE-HYPS))
     (315 7
          (:REWRITE PSEUDO-TERMP-OF-STORED-RULE-RHS))
     (310 6 (:DEFINITION AXE-RULE-HYP-LISTP))
     (192 6
          (:REWRITE PSEUDO-TERM-LISTP-OF-STORED-RULE-LHS-ARGS))
     (189 21 (:DEFINITION LENGTH))
     (184 34 (:DEFINITION LEN))
     (183 2
          (:REWRITE SYMBOLP-OF-STORED-RULE-SYMBOL))
     (179 6 (:REWRITE AXE-RULE-HYP-LISTP-OF-CDR))
     (154 77
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (139 137 (:REWRITE DEFAULT-CDR))
     (114 112 (:REWRITE DEFAULT-CAR))
     (105 105
          (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (93 7 (:DEFINITION SYMBOL-LISTP))
     (78 14 (:DEFINITION TRUE-LISTP))
     (73 6 (:DEFINITION PSEUDO-TERM-LISTP))
     (68 34 (:REWRITE DEFAULT-+-2))
     (52 26
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (50 50 (:TYPE-PRESCRIPTION SYMBOL-LISTP))
     (48 48 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (38 19
         (:REWRITE PSEUDO-TERM-LISTP-WHEN-SYMBOL-LISTP-CHEAP))
     (34 34 (:REWRITE DEFAULT-+-1))
     (27 9 (:REWRITE AXE-RULE-HYPP-WHEN-SIMPLE))
     (27 9
         (:REWRITE AXE-RULE-HYPP-WHEN-EQUAL-OF-CAR-AND-WORK-HARD-CHEAP))
     (27 9
         (:REWRITE AXE-RULE-HYPP-WHEN-AXE-BIND-FREE))
     (21 21 (:TYPE-PRESCRIPTION AXE-RULE-HYPP))
     (20 20
         (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (19 19
         (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (13 1 (:DEFINITION SYMBOL-ALISTP))
     (11 1 (:DEFINITION ASSOC-EQUAL))
     (9 9
        (:REWRITE AXE-RULE-HYPP-WHEN-NOT-SPECIAL))
     (8 4
        (:REWRITE ALISTP-WHEN-PSEUDO-TERM-ALISTP-CHEAP))
     (7 7
        (:REWRITE PSEUDO-TERMP-OF-LAMBDA-BODY-CHEAP))
     (7 7 (:REWRITE DEFAULT-COERCE-2))
     (7 7 (:REWRITE DEFAULT-COERCE-1))
     (6 1 (:DEFINITION STRIP-CDRS))
     (5 5 (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (5 5 (:REWRITE USE-ALL-STORED-AXE-RULEP))
     (4 4
        (:TYPE-PRESCRIPTION PSEUDO-TERM-ALISTP))
     (4 2
        (:REWRITE SYMBOL-ALISTP-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (2 1 (:REWRITE DEFAULT-<-1))
     (2 1
        (:REWRITE ALL-INTEGERP-WHEN-NOT-CONSP-CHEAP))
     (1 1 (:TYPE-PRESCRIPTION STRIP-CDRS))
     (1 1 (:REWRITE DEFAULT-<-2)))
(RULE-LIMITSP-OF-DECREMENT-RULE-LIMIT
     (634 317
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (395 395
          (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (184 144 (:REWRITE DEFAULT-CAR))
     (90 70 (:REWRITE DEFAULT-CDR))
     (90 45
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (54 27
         (:REWRITE SYMBOL-ALISTP-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (46 23
         (:REWRITE ALL-INTEGERP-WHEN-NOT-CONSP-CHEAP))
     (23 23 (:TYPE-PRESCRIPTION STRIP-CDRS))
     (12 6
         (:REWRITE IFF-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (11 11
         (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (11 11 (:REWRITE USE-ALL-STORED-AXE-RULEP))
     (9 8 (:REWRITE DEFAULT-+-2))
     (8 8 (:REWRITE DEFAULT-+-1))
     (1 1
        (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP)))
