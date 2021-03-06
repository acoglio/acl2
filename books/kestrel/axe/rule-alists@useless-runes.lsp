(RULE-ALISTP)
(TRUE-LISTP-OF-LOOKUP-EQUAL-WHEN-RULE-ALISTP
     (190 95
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (105 105
          (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (43 35 (:REWRITE DEFAULT-CAR))
     (30 30 (:REWRITE DEFAULT-CDR))
     (30 6
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (24 12
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (20 10
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (18 9 (:DEFINITION TRUE-LISTP))
     (12 12
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (6 6 (:REWRITE SYMBOLP-WHEN-MEMBERP)))
(ALL-STORED-AXE-RULEP-OF-LOOKUP-EQUAL-WHEN-RULE-ALISTP
     (206 103
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (117 117
          (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (84 22
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (77 11
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (64 48 (:REWRITE DEFAULT-CAR))
     (36 36 (:REWRITE DEFAULT-CDR))
     (28 14
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (22 22
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (12 6 (:DEFINITION TRUE-LISTP))
     (6 6 (:REWRITE SYMBOLP-WHEN-MEMBERP)))
(RULE-ALISTP-OF-CONS-OF-CONS
     (13 13 (:REWRITE DEFAULT-CDR))
     (12 6
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (11 7
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (10 5 (:DEFINITION TRUE-LISTP))
     (10 2
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (8 8
        (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (8 8 (:REWRITE DEFAULT-CAR))
     (7 7
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (5 5 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (4 2
        (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP)))
(RULE-ALISTP-MEANS-ALISTP
     (182 91
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (99 99
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (45 9
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (42 42 (:REWRITE DEFAULT-CAR))
     (36 18
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (30 30 (:REWRITE DEFAULT-CDR))
     (18 18
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (16 8
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (10 5
         (:REWRITE ALISTP-WHEN-PSEUDO-TERM-ALISTP-CHEAP))
     (10 5 (:DEFINITION TRUE-LISTP))
     (7 7 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (5 5
        (:TYPE-PRESCRIPTION PSEUDO-TERM-ALISTP)))
(RULE-ALISTP-MEANS-SYMBOL-ALISTP
     (176 88
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (101 101
          (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (34 34 (:REWRITE DEFAULT-CAR))
     (20 4
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (17 17 (:REWRITE DEFAULT-CDR))
     (16 8
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (16 8
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (10 5
         (:REWRITE SYMBOL-ALISTP-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (8 8
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (8 4 (:DEFINITION TRUE-LISTP))
     (7 7 (:REWRITE SYMBOLP-WHEN-MEMBERP)))
(ALL-RULE-ALISTP)
(ALL-RULE-ALISTP-OF-CONS)
(USE-ALL-RULE-ALISTP-FOR-CAR)
(USE-ALL-RULE-ALISTP-FOR-CAR-OF-LAST)
(ALL-RULE-ALISTP-OF-APPEND)
(ALL-RULE-ALISTP-OF-UNION-EQUAL)
(ALL-RULE-ALISTP-WHEN-NOT-CONSP)
(ALL-RULE-ALISTP-WHEN-NOT-CONSP-CHEAP)
(ALL-RULE-ALISTP-OF-REVAPPEND)
(ALL-RULE-ALISTP-OF-CDR)
(ALL-RULE-ALISTP-OF-NTHCDR)
(ALL-RULE-ALISTP-OF-FIRSTN)
(ALL-RULE-ALISTP-OF-REMOVE1-EQUAL)
(ALL-RULE-ALISTP-OF-REMOVE-EQUAL)
(ALL-RULE-ALISTP-OF-LAST)
(ALL-RULE-ALISTP-OF-TAKE)
(ALL-RULE-ALISTP-WHEN-PERM)
(ALL-RULE-ALISTP-OF-TRUE-LIST-FIX)
(PERM-IMPLIES-EQUAL-ALL-RULE-ALISTP-1)
(USE-ALL-RULE-ALISTP)
(USE-ALL-RULE-ALISTP-2)
(ALL-RULE-ALISTP-OF-ADD-TO-SET-EQUAL)
(ALL-RULE-ALISTP)
(COUNT-RULES-IN-RULE-ALIST-AUX
     (24 22 (:REWRITE DEFAULT-CDR))
     (24 12
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (20 4
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (18 18
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (18 8
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (14 14 (:REWRITE DEFAULT-CAR))
     (12 6
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (10 10 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (10 10 (:REWRITE USE-ALL-RULE-ALISTP))
     (10 2 (:DEFINITION LEN))
     (8 8
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (8 4 (:DEFINITION TRUE-LISTP))
     (7 4 (:REWRITE DEFAULT-+-2))
     (5 4 (:REWRITE DEFAULT-+-1))
     (4 4 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (4 4 (:REWRITE DEFAULT-<-2))
     (4 4 (:REWRITE DEFAULT-<-1)))
(COUNT-RULES-IN-RULE-ALIST)
(EXTEND-UNPRIORITIZED-RULE-ALIST
     (1993 15 (:REWRITE AXE-RULE-LISTP-OF-CDR))
     (500 500 (:REWRITE DEFAULT-CAR))
     (496 496 (:REWRITE DEFAULT-CDR))
     (388 194
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (282 282
          (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (280 23 (:DEFINITION SYMBOL-LISTP))
     (222 111 (:REWRITE DEFAULT-+-2))
     (176 88
          (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (120 120 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (115 23 (:REWRITE PSEUDO-TERMP-OF-CADDR))
     (111 111 (:REWRITE DEFAULT-+-1))
     (106 53
          (:REWRITE PSEUDO-TERM-LISTP-WHEN-SYMBOL-LISTP-CHEAP))
     (86 86 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (85 85
         (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (84 8 (:DEFINITION PSEUDO-TERM-LISTP))
     (72 24 (:REWRITE AXE-RULE-HYPP-WHEN-SIMPLE))
     (72 24
         (:REWRITE AXE-RULE-HYPP-WHEN-EQUAL-OF-CAR-AND-WORK-HARD-CHEAP))
     (72 24
         (:REWRITE AXE-RULE-HYPP-WHEN-AXE-BIND-FREE))
     (53 53
         (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (34 26
         (:REWRITE AXE-RULE-LISTP-WHEN-NOT-CONSP))
     (27 27 (:REWRITE USE-ALL-AXE-RULE-LISTP-2))
     (27 27 (:REWRITE USE-ALL-AXE-RULE-LISTP))
     (26 3
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (24 24
         (:REWRITE AXE-RULE-HYPP-WHEN-NOT-SPECIAL))
     (23 23
         (:REWRITE PSEUDO-TERMP-OF-LAMBDA-BODY-CHEAP))
     (23 23 (:REWRITE DEFAULT-COERCE-2))
     (23 23 (:REWRITE DEFAULT-COERCE-1))
     (21 8 (:REWRITE USE-AXE-RULE-LISTP-FOR-CAR))
     (21 8
         (:REWRITE AXE-RULEP-OF-CAR-WHEN-AXE-RULE-LISTP))
     (18 18 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (18 18 (:REWRITE USE-ALL-RULE-ALISTP))
     (18 6 (:DEFINITION RULE-IS-PRESENTP))
     (16 8 (:REWRITE USE-AXE-RULE-LISTP))
     (16 4 (:DEFINITION LAMBDA-FREE-TERMSP))
     (9 9
        (:REWRITE LOOKUP-EQUAL-WHEN-NOT-CONSP-CHEAP))
     (9 9
        (:REWRITE LOOKUP-EQUAL-WHEN-NOT-ASSOC-EQUAL-CHEAP))
     (8 8 (:TYPE-PRESCRIPTION MEMBERP))
     (8 8 (:REWRITE USE-AXE-RULE-LISTP-2))
     (3 3
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (2 2 (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (2 2 (:REWRITE USE-ALL-STORED-AXE-RULEP)))
(SYMBOL-ALISTP-OF-EXTEND-UNPRIORITIZED-RULE-ALIST
     (352 66
          (:REWRITE RULE-ALISTP-MEANS-SYMBOL-ALISTP))
     (349 322 (:REWRITE DEFAULT-CAR))
     (258 3 (:DEFINITION PSEUDO-TERMP))
     (197 183 (:REWRITE DEFAULT-CDR))
     (133 133 (:TYPE-PRESCRIPTION RULE-ALISTP))
     (132 66
          (:REWRITE SYMBOL-ALISTP-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (88 12 (:REWRITE LOOKUP-EQUAL-OF-CONS-SAFE))
     (82 41
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (81 15 (:DEFINITION LEN))
     (81 9 (:DEFINITION LENGTH))
     (67 67 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (67 67 (:REWRITE USE-ALL-RULE-ALISTP))
     (51 51 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (51 51
         (:REWRITE LOOKUP-EQUAL-WHEN-NOT-CONSP-CHEAP))
     (51 51
         (:REWRITE LOOKUP-EQUAL-WHEN-NOT-ASSOC-EQUAL-CHEAP))
     (34 9 (:DEFINITION TRUE-LISTP))
     (30 15 (:REWRITE DEFAULT-+-2))
     (30 3 (:DEFINITION SYMBOL-LISTP))
     (23 1
         (:REWRITE RULE-ALISTP-OF-CONS-OF-CONS))
     (15 15 (:REWRITE USE-ALL-AXE-RULE-LISTP-2))
     (15 15 (:REWRITE USE-ALL-AXE-RULE-LISTP))
     (15 15 (:REWRITE DEFAULT-+-1))
     (15 3 (:REWRITE PSEUDO-TERMP-OF-CADDR))
     (13 13
         (:REWRITE AXE-RULE-LISTP-WHEN-NOT-CONSP))
     (9 9 (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (6 6 (:TYPE-PRESCRIPTION SYMBOL-LISTP))
     (6 3
        (:REWRITE PSEUDO-TERM-LISTP-WHEN-SYMBOL-LISTP-CHEAP))
     (4 4 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (3 3
        (:TYPE-PRESCRIPTION PSEUDO-TERM-LISTP))
     (3 3
        (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (3 3
        (:REWRITE PSEUDO-TERMP-OF-LAMBDA-BODY-CHEAP))
     (3 3 (:REWRITE DEFAULT-COERCE-2))
     (3 3 (:REWRITE DEFAULT-COERCE-1))
     (1 1
        (:TYPE-PRESCRIPTION ALL-STORED-AXE-RULEP))
     (1 1
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (1 1
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP)))
(SORT-RULES-FOR-EACH-FUNCTION-SYMBOL-BY-PRIORITY)
(ALISTP-OF-SORT-RULES-FOR-EACH-FUNCTION-SYMBOL-BY-PRIORITY
     (99 15 (:REWRITE RULE-ALISTP-MEANS-ALISTP))
     (31 31 (:TYPE-PRESCRIPTION RULE-ALISTP))
     (30 15
         (:REWRITE ALISTP-WHEN-PSEUDO-TERM-ALISTP-CHEAP))
     (25 1
         (:REWRITE RULE-ALISTP-OF-CONS-OF-CONS))
     (22 11
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (20 15 (:REWRITE DEFAULT-CDR))
     (19 14 (:REWRITE DEFAULT-CAR))
     (16 16 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (16 16 (:REWRITE USE-ALL-RULE-ALISTP))
     (15 15
         (:TYPE-PRESCRIPTION PSEUDO-TERM-ALISTP))
     (14 14
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (6 3
        (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (6 3
        (:DEFINITION MERGE-SORT-BY-RULE-PRIORITY))
     (5 5 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (5 1 (:DEFINITION TRUE-LISTP))
     (2 2
        (:TYPE-PRESCRIPTION ALL-STORED-AXE-RULEP))
     (2 1
        (:REWRITE TRUE-LISTP-OF-MERGE-SORT-BY-RULE-PRIORITY))
     (2 1
        (:REWRITE ALL-STORED-AXE-RULEP-OF-MERGE-SORT-BY-RULE-PRIORITY))
     (1 1 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (1 1
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (1 1
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP)))
(SORT-RULES-FOR-EACH-FUNCTION-SYMBOL-BY-PRIORITY
     (64 32
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (48 48
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (46 11
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (43 41 (:REWRITE DEFAULT-CDR))
     (37 18
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (32 32 (:REWRITE DEFAULT-CAR))
     (32 16
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (30 9 (:DEFINITION TRUE-LISTP))
     (20 20 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (20 20 (:REWRITE USE-ALL-RULE-ALISTP))
     (18 18
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (16 16 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (10 10 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (8 4
        (:REWRITE ALISTP-WHEN-PSEUDO-TERM-ALISTP-CHEAP))
     (4 4
        (:TYPE-PRESCRIPTION PSEUDO-TERM-ALISTP)))
(RULE-ALISTP-OF-SORT-RULES-FOR-EACH-FUNCTION-SYMBOL-BY-PRIORITY
     (56 16
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (52 44 (:REWRITE DEFAULT-CDR))
     (52 26
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (42 42
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (42 34 (:REWRITE DEFAULT-CAR))
     (40 8
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (32 16
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (16 16 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (16 16 (:REWRITE USE-ALL-RULE-ALISTP))
     (16 16
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (16 8 (:DEFINITION TRUE-LISTP))
     (10 5
         (:DEFINITION MERGE-SORT-BY-RULE-PRIORITY))
     (8 8 (:REWRITE SYMBOLP-WHEN-MEMBERP)))
(RULE-ALISTP-OF-UNIQUIFY-ALIST-EQ-AUX
     (376 52
          (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (349 255 (:REWRITE DEFAULT-CAR))
     (204 175 (:REWRITE DEFAULT-CDR))
     (188 94
          (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (130 26
          (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (54 27
         (:REWRITE IFF-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (52 52
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (48 48 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (48 48 (:REWRITE USE-ALL-RULE-ALISTP))
     (48 24 (:DEFINITION TRUE-LISTP))
     (26 26 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (9 9 (:TYPE-PRESCRIPTION ACONS)))
(RULE-ALISTP-OF-EXTEND-UNPRIORITIZED-RULE-ALIST
     (1287 1253 (:REWRITE DEFAULT-CAR))
     (1265 1246 (:REWRITE DEFAULT-CDR))
     (1052 186 (:DEFINITION LEN))
     (691 95
          (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (420 40 (:DEFINITION SYMBOL-LISTP))
     (374 187
          (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (372 186 (:REWRITE DEFAULT-+-2))
     (230 46
          (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (218 30 (:REWRITE LOOKUP-EQUAL-OF-CONS-SAFE))
     (213 213 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (200 40 (:REWRITE PSEUDO-TERMP-OF-CADDR))
     (186 186 (:REWRITE DEFAULT-+-1))
     (140 70
          (:REWRITE PSEUDO-TERM-LISTP-WHEN-SYMBOL-LISTP-CHEAP))
     (136 136
          (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (128 128
          (:REWRITE LOOKUP-EQUAL-WHEN-NOT-CONSP-CHEAP))
     (128 128
          (:REWRITE LOOKUP-EQUAL-WHEN-NOT-ASSOC-EQUAL-CHEAP))
     (95 95
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (95 15
         (:REWRITE USE-AXE-RULE-LISTP-FOR-CAR))
     (95 15
         (:REWRITE AXE-RULEP-OF-CAR-WHEN-AXE-RULE-LISTP))
     (93 93 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (93 93 (:REWRITE USE-ALL-RULE-ALISTP))
     (82 70
         (:REWRITE AXE-RULE-LISTP-WHEN-NOT-CONSP))
     (81 27 (:REWRITE AXE-RULE-HYPP-WHEN-SIMPLE))
     (81 27
         (:REWRITE AXE-RULE-HYPP-WHEN-EQUAL-OF-CAR-AND-WORK-HARD-CHEAP))
     (81 27
         (:REWRITE AXE-RULE-HYPP-WHEN-AXE-BIND-FREE))
     (72 72 (:REWRITE USE-ALL-AXE-RULE-LISTP-2))
     (72 72 (:REWRITE USE-ALL-AXE-RULE-LISTP))
     (72 9 (:DEFINITION PSEUDO-TERM-LISTP))
     (70 70
         (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (60 15 (:DEFINITION LAMBDA-FREE-TERMSP))
     (40 40
         (:REWRITE PSEUDO-TERMP-OF-LAMBDA-BODY-CHEAP))
     (40 40 (:REWRITE DEFAULT-COERCE-2))
     (40 40 (:REWRITE DEFAULT-COERCE-1))
     (27 27
         (:REWRITE AXE-RULE-HYPP-WHEN-NOT-SPECIAL))
     (15 15 (:REWRITE USE-AXE-RULE-LISTP-2))
     (15 15 (:REWRITE USE-AXE-RULE-LISTP))
     (2 2 (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (2 2 (:REWRITE USE-ALL-STORED-AXE-RULEP)))
(EXTEND-RULE-ALIST (3 3
                      (:TYPE-PRESCRIPTION EXTEND-UNPRIORITIZED-RULE-ALIST)))
(RULE-ALISTP-OF-EXTEND-RULE-ALIST)
(EMPTY-RULE-ALIST)
(MAKE-RULE-ALIST-SIMPLE)
(RULE-ALISTP-OF-MAKE-RULE-ALIST-SIMPLE)
(RULE-COUNT-IN-RULE-ALIST)
(NATP-OF-RULE-COUNT-IN-RULE-ALIST)
(RULE-COUNT-IN-RULE-ALIST
     (24 22 (:REWRITE DEFAULT-CDR))
     (24 12
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (20 4
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (18 18
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (18 8
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (14 14 (:REWRITE DEFAULT-CAR))
     (12 6
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (10 10 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (10 10 (:REWRITE USE-ALL-RULE-ALISTP))
     (8 8
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (8 4 (:DEFINITION TRUE-LISTP))
     (5 1 (:DEFINITION LEN))
     (4 4 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (2 1 (:REWRITE DEFAULT-+-2))
     (1 1 (:REWRITE DEFAULT-+-1)))
(RULE-ALIST-CONTAINSP
     (41 7
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (37 14
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (32 28 (:REWRITE DEFAULT-CDR))
     (27 27 (:REWRITE DEFAULT-CAR))
     (26 13
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (23 23
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (20 10
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (18 6 (:DEFINITION RULE-IS-PRESENTP))
     (14 14
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (11 11 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (10 10 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (10 10 (:REWRITE USE-ALL-RULE-ALISTP))
     (8 4 (:DEFINITION TRUE-LISTP)))
(MAKE-RULE-ALISTS-SIMPLE
     (12 1 (:DEFINITION ALISTP))
     (10 2 (:REWRITE RULE-ALISTP-MEANS-ALISTP))
     (5 5 (:REWRITE DEFAULT-CDR))
     (4 4 (:TYPE-PRESCRIPTION RULE-ALISTP))
     (4 2
        (:REWRITE ALISTP-WHEN-PSEUDO-TERM-ALISTP-CHEAP))
     (2 2
        (:TYPE-PRESCRIPTION PSEUDO-TERM-ALISTP))
     (2 2 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (2 2 (:REWRITE USE-ALL-RULE-ALISTP))
     (2 1
        (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (1 1
        (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (1 1 (:REWRITE DEFAULT-CAR))
     (1 1
        (:REWRITE ALL-AXE-RULE-LISTP-WHEN-NOT-CONSP-CHEAP))
     (1 1
        (:REWRITE ALL-AXE-RULE-LISTP-WHEN-NOT-CONSP)))
(MAKE-RULE-ALIST)
(RULE-ALISTP-OF-MV-NTH-1-OF-MAKE-RULE-ALIST
     (12 1 (:DEFINITION ALISTP))
     (10 2 (:REWRITE RULE-ALISTP-MEANS-ALISTP))
     (4 2
        (:REWRITE ALISTP-WHEN-PSEUDO-TERM-ALISTP-CHEAP))
     (4 1 (:DEFINITION SYMBOL-LISTP))
     (3 3 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (3 3 (:REWRITE USE-ALL-RULE-ALISTP))
     (2 2
        (:TYPE-PRESCRIPTION PSEUDO-TERM-ALISTP))
     (2 2 (:REWRITE DEFAULT-CDR))
     (2 2 (:REWRITE DEFAULT-CAR))
     (2 1
        (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (1 1
        (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (1 1 (:REWRITE SYMBOLP-WHEN-MEMBERP)))
(MAKE-RULE-ALIST!)
(MAKE-RULE-ALISTS
     (28 14
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (24 24 (:REWRITE DEFAULT-CDR))
     (23 23
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (20 20 (:REWRITE DEFAULT-CAR))
     (18 9
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (16 6 (:DEFINITION TRUE-LISTP))
     (9 9 (:REWRITE SYMBOLP-WHEN-MEMBERP)))
(TRUE-LISTP-OF-MV-NTH-1-OF-MAKE-RULE-ALISTS (8 8 (:REWRITE DEFAULT-CAR))
                                            (8 4 (:DEFINITION TRUE-LISTP))
                                            (6 6 (:REWRITE DEFAULT-CDR)))
(ALL-RULE-ALISTP-OF-MV-NTH-1-OF-MAKE-RULE-ALISTS
     (80 8 (:DEFINITION SYMBOL-LISTP))
     (32 16
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (28 28 (:REWRITE DEFAULT-CAR))
     (28 6
         (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP))
     (24 24
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (22 22
         (:TYPE-PRESCRIPTION TRUE-LISTP-OF-MV-NTH-1-OF-MAKE-RULE-ALISTS))
     (16 8
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (14 14 (:REWRITE DEFAULT-CDR))
     (12 6
         (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP-CHEAP))
     (8 8 (:REWRITE SYMBOLP-WHEN-MEMBERP)))
(EXTEND-RULE-ALIST2)
(EXTEND-RULE-ALISTS2 (4 4 (:REWRITE DEFAULT-CDR))
                     (1 1 (:REWRITE USE-ALL-AXE-RULE-LISTP-2))
                     (1 1 (:REWRITE USE-ALL-AXE-RULE-LISTP))
                     (1 1
                        (:REWRITE AXE-RULE-LISTP-WHEN-NOT-CONSP-CHEAP))
                     (1 1
                        (:REWRITE AXE-RULE-LISTP-WHEN-NOT-CONSP))
                     (1 1
                        (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP-CHEAP))
                     (1 1
                        (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP)))
(ADD-TO-RULE-ALIST)
(ADD-TO-RULE-ALIST!)
(ADD-TO-RULE-ALISTS (5 5 (:REWRITE DEFAULT-CDR))
                    (3 3 (:REWRITE DEFAULT-CAR))
                    (2 2 (:REWRITE SYMBOLP-WHEN-MEMBERP))
                    (2 1 (:DEFINITION TRUE-LISTP))
                    (1 1
                       (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP-CHEAP))
                    (1 1
                       (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP)))
(REMOVE-FROM-STORED-RULES
     (89 1 (:DEFINITION PSEUDO-TERMP))
     (43 7 (:DEFINITION LEN))
     (42 42 (:REWRITE DEFAULT-CDR))
     (31 31 (:REWRITE DEFAULT-CAR))
     (30 10 (:DEFINITION MEMBER-EQUAL))
     (30 1 (:DEFINITION AXE-RULE-HYP-LISTP))
     (27 3 (:DEFINITION LENGTH))
     (24 2
         (:REWRITE AXE-RULE-HYP-LISTP-OF-STORED-RULE-HYPS))
     (16 1 (:REWRITE AXE-RULE-HYP-LISTP-OF-CDR))
     (14 7
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (14 7 (:REWRITE DEFAULT-+-2))
     (13 13
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (12 11
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (12 6
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (12 1
         (:REWRITE PSEUDO-TERMP-OF-STORED-RULE-RHS))
     (12 1
         (:REWRITE PSEUDO-TERM-LISTP-OF-STORED-RULE-LHS-ARGS))
     (11 11
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (11 9 (:REWRITE USE-ALL-STORED-AXE-RULEP))
     (10 4 (:DEFINITION TRUE-LISTP))
     (9 9 (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (8 1 (:DEFINITION PSEUDO-TERM-LISTP))
     (7 7 (:TYPE-PRESCRIPTION PSEUDO-TERMP))
     (7 7 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (7 7 (:REWRITE DEFAULT-+-1))
     (6 3
        (:REWRITE PSEUDO-TERM-LISTP-WHEN-SYMBOL-LISTP-CHEAP))
     (6 3 (:REWRITE DEFAULT-<-1))
     (5 5
        (:TYPE-PRESCRIPTION AXE-RULE-HYP-LISTP))
     (5 1 (:REWRITE PSEUDO-TERMP-OF-CADDR))
     (4 4 (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (3 3
        (:TYPE-PRESCRIPTION PSEUDO-TERM-LISTP))
     (3 3
        (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (3 3 (:REWRITE DEFAULT-<-2))
     (3 1 (:REWRITE AXE-RULE-HYPP-WHEN-SIMPLE))
     (3 1
        (:REWRITE AXE-RULE-HYPP-WHEN-EQUAL-OF-CAR-AND-WORK-HARD-CHEAP))
     (3 1
        (:REWRITE AXE-RULE-HYPP-WHEN-AXE-BIND-FREE))
     (2 2 (:TYPE-PRESCRIPTION MEMBERP))
     (1 1 (:TYPE-PRESCRIPTION AXE-RULE-HYPP))
     (1 1
        (:REWRITE PSEUDO-TERMP-OF-LAMBDA-BODY-CHEAP))
     (1 1 (:REWRITE DEFAULT-COERCE-2))
     (1 1 (:REWRITE DEFAULT-COERCE-1))
     (1 1
        (:REWRITE AXE-RULE-HYPP-WHEN-NOT-SPECIAL)))
(REMOVE-FROM-RULE-ALIST)
(RULE-ALISTP-OF-ACONS
     (12 6
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (10 6
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (10 2
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (9 9 (:REWRITE DEFAULT-CDR))
     (8 8
        (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (6 6 (:REWRITE DEFAULT-CAR))
     (6 6
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (6 3 (:DEFINITION TRUE-LISTP))
     (5 5 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (5 5 (:REWRITE USE-ALL-RULE-ALISTP))
     (4 2
        (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (3 3 (:REWRITE SYMBOLP-WHEN-MEMBERP)))
(ALL-STORED-AXE-RULEP-OF-REMOVE-FROM-STORED-RULES
     (46 11
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (26 26
         (:TYPE-PRESCRIPTION REMOVE-FROM-STORED-RULES))
     (20 20 (:REWRITE DEFAULT-CDR))
     (20 20 (:REWRITE DEFAULT-CAR))
     (5 1 (:REWRITE USE-ALL-STORED-AXE-RULEP))
     (4 4 (:TYPE-PRESCRIPTION MEMBERP))
     (1 1
        (:REWRITE USE-ALL-STORED-AXE-RULEP-2)))
(RULE-ALISTP-OF-REMOVE-FROM-RULE-ALIST
     (68 16
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (62 54 (:REWRITE DEFAULT-CDR))
     (52 44 (:REWRITE DEFAULT-CAR))
     (52 26
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (42 42
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (40 8
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (40 5
         (:DEFINITION REMOVE-FROM-STORED-RULES))
     (32 16
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (16 16 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (16 16 (:REWRITE USE-ALL-RULE-ALISTP))
     (16 16
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (16 8 (:DEFINITION TRUE-LISTP))
     (15 5 (:DEFINITION MEMBER-EQUAL))
     (8 8 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (5 5 (:TYPE-PRESCRIPTION MEMBER-EQUAL)))
(REMOVE-FROM-RULE-ALIST
     (750 8 (:DEFINITION PSEUDO-TERMP))
     (477 57
          (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (330 54
          (:REWRITE USE-ALL-STORED-AXE-RULEP-FOR-CAR))
     (253 8 (:DEFINITION AXE-RULE-HYP-LISTP))
     (242 46 (:DEFINITION LEN))
     (217 211 (:REWRITE DEFAULT-CDR))
     (216 24 (:DEFINITION LENGTH))
     (210 16
          (:REWRITE AXE-RULE-HYP-LISTP-OF-STORED-RULE-HYPS))
     (179 177 (:REWRITE DEFAULT-CAR))
     (154 77
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (138 71
          (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (137 8 (:REWRITE AXE-RULE-HYP-LISTP-OF-CDR))
     (130 130
          (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (120 120
          (:TYPE-PRESCRIPTION STORED-AXE-RULEP))
     (106 53
          (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (105 8
          (:REWRITE SYMBOLP-OF-STORED-RULE-SYMBOL))
     (105 8
          (:REWRITE PSEUDO-TERMP-OF-STORED-RULE-RHS))
     (105 8
          (:REWRITE PSEUDO-TERM-LISTP-OF-STORED-RULE-LHS-ARGS))
     (82 54 (:REWRITE USE-ALL-STORED-AXE-RULEP))
     (80 40 (:REWRITE DEFAULT-+-2))
     (71 71
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (69 8 (:DEFINITION PSEUDO-TERM-LISTP))
     (64 21 (:DEFINITION TRUE-LISTP))
     (54 54
         (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (48 24
         (:REWRITE PSEUDO-TERM-LISTP-WHEN-SYMBOL-LISTP-CHEAP))
     (40 40 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (40 40 (:REWRITE DEFAULT-+-1))
     (40 8 (:REWRITE PSEUDO-TERMP-OF-CADDR))
     (32 32
         (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (28 28 (:TYPE-PRESCRIPTION MEMBERP))
     (24 24
         (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (24 8 (:REWRITE AXE-RULE-HYPP-WHEN-SIMPLE))
     (24 8
         (:REWRITE AXE-RULE-HYPP-WHEN-EQUAL-OF-CAR-AND-WORK-HARD-CHEAP))
     (24 8
         (:REWRITE AXE-RULE-HYPP-WHEN-AXE-BIND-FREE))
     (18 1 (:DEFINITION REMOVE-FROM-RULE-ALIST))
     (16 8 (:REWRITE DEFAULT-<-1))
     (12 12 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (12 12 (:REWRITE USE-ALL-RULE-ALISTP))
     (9 9 (:TYPE-PRESCRIPTION AXE-RULE-HYPP))
     (8 8
        (:REWRITE PSEUDO-TERMP-OF-LAMBDA-BODY-CHEAP))
     (8 8 (:REWRITE DEFAULT-COERCE-2))
     (8 8 (:REWRITE DEFAULT-COERCE-1))
     (8 8 (:REWRITE DEFAULT-<-2))
     (8 8
        (:REWRITE AXE-RULE-HYPP-WHEN-NOT-SPECIAL))
     (8 1
        (:DEFINITION REMOVE-FROM-STORED-RULES))
     (3 1 (:DEFINITION MEMBER-EQUAL))
     (1 1 (:TYPE-PRESCRIPTION MEMBER-EQUAL))
     (1 1 (:DEFINITION ACONS)))
(REMOVE-FROM-RULE-ALISTS (5 5 (:REWRITE DEFAULT-CDR))
                         (4 1 (:DEFINITION SYMBOL-LISTP))
                         (1 1 (:REWRITE SYMBOLP-WHEN-MEMBERP))
                         (1 1 (:REWRITE DEFAULT-CAR))
                         (1 1
                            (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP-CHEAP))
                         (1 1
                            (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP)))
(PRINT-MISSING-RULES
     (18 18 (:REWRITE DEFAULT-CDR))
     (18 9
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (15 15 (:REWRITE DEFAULT-CAR))
     (15 3
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (12 12
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (12 6
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (8 8 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (6 6 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (6 6 (:REWRITE USE-ALL-RULE-ALISTP))
     (6 6
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (6 3
        (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (6 3 (:DEFINITION TRUE-LISTP)))
(RULES-FROM-STORED-AXE-RULES
     (89 1 (:DEFINITION PSEUDO-TERMP))
     (42 7
         (:REWRITE USE-ALL-STORED-AXE-RULEP-FOR-CAR))
     (36 6 (:DEFINITION LEN))
     (30 1 (:DEFINITION AXE-RULE-HYP-LISTP))
     (27 3 (:DEFINITION LENGTH))
     (26 26 (:REWRITE DEFAULT-CDR))
     (24 2
         (:REWRITE AXE-RULE-HYP-LISTP-OF-STORED-RULE-HYPS))
     (17 17 (:REWRITE DEFAULT-CAR))
     (16 1 (:REWRITE AXE-RULE-HYP-LISTP-OF-CDR))
     (15 15
         (:TYPE-PRESCRIPTION STORED-AXE-RULEP))
     (14 7
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (12 12
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (12 11
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (12 6 (:REWRITE DEFAULT-+-2))
     (12 1
         (:REWRITE SYMBOLP-OF-STORED-RULE-SYMBOL))
     (12 1
         (:REWRITE PSEUDO-TERMP-OF-STORED-RULE-RHS))
     (12 1
         (:REWRITE PSEUDO-TERM-LISTP-OF-STORED-RULE-LHS-ARGS))
     (11 11
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (10 5
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (10 1 (:DEFINITION SYMBOL-LISTP))
     (8 1 (:DEFINITION PSEUDO-TERM-LISTP))
     (7 7 (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (7 7 (:REWRITE USE-ALL-STORED-AXE-RULEP))
     (6 6 (:REWRITE DEFAULT-+-1))
     (6 3
        (:REWRITE PSEUDO-TERM-LISTP-WHEN-SYMBOL-LISTP-CHEAP))
     (6 1
        (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (5 1 (:REWRITE PSEUDO-TERMP-OF-CADDR))
     (4 4 (:TYPE-PRESCRIPTION SYMBOL-LISTP))
     (4 4 (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (4 4 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (4 2 (:REWRITE DEFAULT-<-1))
     (3 3
        (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (3 1 (:REWRITE AXE-RULE-HYPP-WHEN-SIMPLE))
     (3 1
        (:REWRITE AXE-RULE-HYPP-WHEN-EQUAL-OF-CAR-AND-WORK-HARD-CHEAP))
     (3 1
        (:REWRITE AXE-RULE-HYPP-WHEN-AXE-BIND-FREE))
     (2 2 (:REWRITE DEFAULT-<-2))
     (1 1 (:TYPE-PRESCRIPTION AXE-RULE-HYPP))
     (1 1
        (:REWRITE PSEUDO-TERMP-OF-LAMBDA-BODY-CHEAP))
     (1 1 (:REWRITE DEFAULT-COERCE-2))
     (1 1 (:REWRITE DEFAULT-COERCE-1))
     (1 1
        (:REWRITE AXE-RULE-HYPP-WHEN-NOT-SPECIAL)))
(SYMBOL-LISTP-OF-RULES-FROM-STORED-AXE-RULES
     (1245 11 (:DEFINITION PSEUDO-TERMP))
     (648 41
          (:REWRITE USE-ALL-STORED-AXE-RULEP-FOR-CAR))
     (501 19
          (:REWRITE AXE-RULE-HYP-LISTP-OF-STORED-RULE-HYPS))
     (455 10 (:DEFINITION AXE-RULE-HYP-LISTP))
     (319 55 (:DEFINITION LEN))
     (297 33 (:DEFINITION LENGTH))
     (273 10 (:REWRITE AXE-RULE-HYP-LISTP-OF-CDR))
     (269 11
          (:REWRITE PSEUDO-TERMP-OF-STORED-RULE-RHS))
     (268 11
          (:REWRITE PSEUDO-TERM-LISTP-OF-STORED-RULE-LHS-ARGS))
     (267 11
          (:REWRITE SYMBOLP-OF-STORED-RULE-SYMBOL))
     (219 218 (:REWRITE DEFAULT-CDR))
     (202 101
          (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (183 182 (:REWRITE DEFAULT-CAR))
     (145 145
          (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (123 11 (:DEFINITION PSEUDO-TERM-LISTP))
     (117 117
          (:TYPE-PRESCRIPTION STORED-AXE-RULEP))
     (110 55 (:REWRITE DEFAULT-+-2))
     (108 22 (:DEFINITION TRUE-LISTP))
     (88 44
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (66 33
         (:REWRITE PSEUDO-TERM-LISTP-WHEN-SYMBOL-LISTP-CHEAP))
     (56 56 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (55 55 (:REWRITE DEFAULT-+-1))
     (55 11 (:REWRITE PSEUDO-TERMP-OF-CADDR))
     (47 47 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (44 44
         (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (41 41
         (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (41 41 (:REWRITE USE-ALL-STORED-AXE-RULEP))
     (36 12 (:REWRITE AXE-RULE-HYPP-WHEN-SIMPLE))
     (36 12
         (:REWRITE AXE-RULE-HYPP-WHEN-EQUAL-OF-CAR-AND-WORK-HARD-CHEAP))
     (36 12
         (:REWRITE AXE-RULE-HYPP-WHEN-AXE-BIND-FREE))
     (33 33
         (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (29 27
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (22 22 (:TYPE-PRESCRIPTION AXE-RULE-HYPP))
     (17 11 (:REWRITE DEFAULT-<-1))
     (12 12
         (:REWRITE AXE-RULE-HYPP-WHEN-NOT-SPECIAL))
     (12 2
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (11 11
         (:REWRITE PSEUDO-TERMP-OF-LAMBDA-BODY-CHEAP))
     (11 11 (:REWRITE DEFAULT-COERCE-2))
     (11 11 (:REWRITE DEFAULT-COERCE-1))
     (11 11 (:REWRITE DEFAULT-<-2)))
(RULES-FROM-RULE-ALIST)
(SYMBOL-LISTP-OF-RULES-FROM-RULE-ALIST
     (38 34 (:REWRITE DEFAULT-CDR))
     (37 3 (:DEFINITION UNION-EQUAL))
     (30 30 (:REWRITE DEFAULT-CAR))
     (28 14
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (20 20
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (20 4
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (18 3 (:DEFINITION SYMBOL-LISTP))
     (16 8
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (13 3 (:DEFINITION MEMBER-EQUAL))
     (12 6
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (9 3
        (:DEFINITION RULES-FROM-STORED-AXE-RULES))
     (8 8
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (8 4 (:DEFINITION TRUE-LISTP))
     (7 7 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (7 7 (:REWRITE USE-ALL-RULE-ALISTP))
     (7 7 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (6 6
        (:TYPE-PRESCRIPTION RULES-FROM-STORED-AXE-RULES))
     (3 3 (:TYPE-PRESCRIPTION MEMBER-EQUAL)))
(RULES-FROM-RULE-ALIST
     (96 48
         (:TYPE-PRESCRIPTION SYMBOLP-OF-CAR-OF-CAR-WHEN-SYMBOL-TERM-ALISTP))
     (61 61
         (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (58 11
         (:REWRITE ALL-STORED-AXE-RULEP-OF-CDR))
     (55 53 (:REWRITE DEFAULT-CDR))
     (50 22
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (41 41 (:REWRITE DEFAULT-CAR))
     (34 13 (:DEFINITION TRUE-LISTP))
     (26 13
         (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (22 22
         (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (16 16 (:REWRITE USE-ALL-RULE-ALISTP-2))
     (16 16 (:REWRITE USE-ALL-RULE-ALISTP))
     (10 10 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (3 1
        (:DEFINITION RULES-FROM-STORED-AXE-RULES)))
(RULES-FROM-RULE-ALISTS (251 240 (:REWRITE DEFAULT-CDR))
                        (178 178 (:REWRITE DEFAULT-CAR))
                        (60 20 (:REWRITE USE-ALL-RULE-ALISTP))
                        (40 40 (:TYPE-PRESCRIPTION MEMBERP))
                        (26 26
                            (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP-CHEAP))
                        (26 26
                            (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP))
                        (20 20 (:REWRITE USE-ALL-RULE-ALISTP-2)))
(SYMBOL-LISTP-OF-RULES-FROM-RULE-ALISTS
     (37 3 (:DEFINITION UNION-EQUAL))
     (18 3 (:DEFINITION SYMBOL-LISTP))
     (15 15 (:REWRITE DEFAULT-CDR))
     (15 15 (:REWRITE DEFAULT-CAR))
     (13 3 (:DEFINITION MEMBER-EQUAL))
     (6 6
        (:TYPE-PRESCRIPTION RULES-FROM-RULE-ALIST))
     (3 3 (:TYPE-PRESCRIPTION MEMBER-EQUAL))
     (3 3 (:REWRITE SYMBOLP-WHEN-MEMBERP))
     (3 3
        (:REWRITE ALL-RULE-ALISTP-WHEN-NOT-CONSP))
     (3 1 (:REWRITE USE-ALL-RULE-ALISTP))
     (2 2 (:TYPE-PRESCRIPTION MEMBERP))
     (1 1 (:REWRITE USE-ALL-RULE-ALISTP-2)))
(<=-OF-LEN-OF-CAR-WHEN-ALL-STORED-AXE-RULEP
     (7 1 (:DEFINITION LEN))
     (6 1
        (:REWRITE USE-ALL-STORED-AXE-RULEP-FOR-CAR))
     (2 2
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP-CHEAP))
     (2 2
        (:REWRITE ALL-STORED-AXE-RULEP-WHEN-NOT-CONSP))
     (2 1 (:REWRITE DEFAULT-<-1))
     (2 1 (:REWRITE DEFAULT-+-2))
     (2 1
        (:REWRITE CONSP-OF-CAR-WHEN-SYMBOL-TERM-ALISTP-CHEAP))
     (1 1
        (:TYPE-PRESCRIPTION SYMBOL-TERM-ALISTP))
     (1 1 (:REWRITE USE-ALL-STORED-AXE-RULEP-2))
     (1 1 (:REWRITE USE-ALL-STORED-AXE-RULEP))
     (1 1 (:REWRITE DEFAULT-CDR))
     (1 1 (:REWRITE DEFAULT-CAR))
     (1 1 (:REWRITE DEFAULT-<-2))
     (1 1 (:REWRITE DEFAULT-+-1)))
