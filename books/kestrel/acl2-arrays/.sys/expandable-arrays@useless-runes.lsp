(BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-INTEGER-ALISTP
 (132 24 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (74 74 (:REWRITE DEFAULT-CAR))
 (55 19 (:DEFINITION NATP))
 (51 51 (:REWRITE DEFAULT-<-2))
 (51 51 (:REWRITE DEFAULT-<-1))
 (20 20 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (19 19 (:TYPE-PRESCRIPTION NATP))
 (16 4 (:REWRITE BOUNDED-NATP-ALISTP-OF-CDR))
 (14 14 (:REWRITE <-OF-0-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (10 10 (:REWRITE INTEGERP-OF-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (10 10 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (8 8 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (8 8 (:REWRITE DEFAULT-CDR))
 (7 7 (:REWRITE EQUAL-OF-NON-NATP-AND-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 )
(INTEGERP-OF-CAR-OF-ASSOC-EQUAL
 (239 36 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (102 102 (:REWRITE DEFAULT-CAR))
 (80 20 (:REWRITE BOUNDED-NATP-ALISTP-OF-CDR))
 (74 74 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (55 55 (:REWRITE DEFAULT-<-2))
 (55 55 (:REWRITE DEFAULT-<-1))
 (54 18 (:DEFINITION NATP))
 (37 37 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (36 36 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-INTEGER-ALISTP))
 (28 28 (:REWRITE DEFAULT-CDR))
 (23 23 (:REWRITE ASSOC-EQUAL-WHEN-NOT-CONSP-CHEAP))
 (18 18 (:TYPE-PRESCRIPTION NATP))
 (18 18 (:REWRITE <-OF-0-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (17 17 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (17 17 (:REWRITE INTEGERP-OF-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (14 14 (:REWRITE EQUAL-OF-NON-NATP-AND-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 )
(NON-NEG-OF-CAR-OF-ASSOC-EQUAL
 (257 39 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (105 105 (:REWRITE DEFAULT-CAR))
 (84 21 (:REWRITE BOUNDED-NATP-ALISTP-OF-CDR))
 (79 69 (:REWRITE DEFAULT-<-1))
 (78 78 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (69 69 (:REWRITE DEFAULT-<-2))
 (60 20 (:DEFINITION NATP))
 (39 39 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (39 39 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-INTEGER-ALISTP))
 (30 30 (:REWRITE DEFAULT-CDR))
 (24 24 (:REWRITE ASSOC-EQUAL-WHEN-NOT-CONSP-CHEAP))
 (20 20 (:TYPE-PRESCRIPTION NATP))
 (19 19 (:REWRITE <-OF-0-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (18 18 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (18 18 (:REWRITE INTEGERP-OF-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (15 15 (:REWRITE EQUAL-OF-NON-NATP-AND-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (10 10 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 )
(<-OF-CAR-OF-ASSOC-EQUAL
 (69 12 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (56 47 (:REWRITE DEFAULT-CAR))
 (27 24 (:REWRITE DEFAULT-<-2))
 (27 24 (:REWRITE DEFAULT-<-1))
 (27 9 (:DEFINITION NATP))
 (16 16 (:REWRITE ASSOC-EQUAL-WHEN-NOT-CONSP-CHEAP))
 (15 15 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (14 14 (:REWRITE EQUAL-OF-NON-NATP-AND-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (13 13 (:REWRITE DEFAULT-CDR))
 (12 12 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (12 12 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-INTEGER-ALISTP))
 (12 3 (:REWRITE BOUNDED-NATP-ALISTP-OF-CDR))
 (9 9 (:TYPE-PRESCRIPTION NATP))
 (6 6 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (6 6 (:REWRITE INTEGERP-OF-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (6 6 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (6 6 (:REWRITE <-OF-0-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 )
(ARRAY1P-OF-CONS-WHEN-HEADER-AND-EXPANDING
 (222 101 (:REWRITE DEFAULT-CDR))
 (171 10 (:REWRITE CONSP-OF-DIMENSIONS-WHEN-ARRAY1P))
 (154 77 (:TYPE-PRESCRIPTION TRUE-LISTP-OF-DIMENSIONS))
 (151 34 (:REWRITE DEFAULT-<-2))
 (148 148 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (148 5 (:DEFINITION TRUE-LISTP))
 (112 1 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (111 6 (:REWRITE CONSP-OF-HEADER))
 (108 5 (:REWRITE TRUE-LISTP-OF-DIMENSIONS))
 (102 1 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (80 7 (:REWRITE INTEGERP-OF-ALEN1))
 (70 49 (:REWRITE DEFAULT-CAR))
 (44 11 (:DEFINITION ASSOC-KEYWORD))
 (34 34 (:REWRITE DEFAULT-<-1))
 (28 7 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (21 21 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (16 8 (:REWRITE DEFAULT-+-2))
 (14 14 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (11 11 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (11 7 (:REWRITE ALISTP-OF-CDR))
 (9 9 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (8 8 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (8 8 (:REWRITE DEFAULT-+-1))
 (7 7 (:REWRITE INTEGERP-OF-ALEN1-GEN))
 (7 7 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (6 6 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (1 1 (:REWRITE INTEGERP-OF-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 )
(EXPAND-ARRAY
 (1982 991 (:TYPE-PRESCRIPTION TRUE-LISTP-OF-DIMENSIONS))
 (1659 124 (:REWRITE CONSP-OF-DIMENSIONS-WHEN-ARRAY1P))
 (1518 48 (:DEFINITION TRUE-LISTP))
 (1389 78 (:REWRITE TRUE-LISTP-OF-DIMENSIONS))
 (1311 565 (:REWRITE DEFAULT-CDR))
 (1079 1079 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (819 54 (:REWRITE INTEGERP-OF-ALEN1))
 (791 47 (:REWRITE CONSP-OF-HEADER))
 (263 263 (:REWRITE DEFAULT-<-2))
 (263 263 (:REWRITE DEFAULT-<-1))
 (194 194 (:REWRITE DEFAULT-CAR))
 (190 114 (:REWRITE DEFAULT-+-2))
 (114 114 (:REWRITE DEFAULT-+-1))
 (109 109 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (84 21 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (77 77 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (70 70 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (58 58 (:REWRITE DEFAULT-*-2))
 (58 58 (:REWRITE DEFAULT-*-1))
 (54 54 (:REWRITE INTEGERP-OF-ALEN1-GEN))
 (47 47 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (42 42 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (35 35 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (21 21 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 )
(ALEN1-OF-EXPAND-ARRAY
 (720 720 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (258 16 (:REWRITE DEFAULT-*-2))
 (221 17 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (186 36 (:REWRITE DEFAULT-<-2))
 (54 36 (:REWRITE DEFAULT-<-1))
 (51 17 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (42 24 (:REWRITE DEFAULT-CDR))
 (38 20 (:REWRITE DEFAULT-CAR))
 (24 6 (:DEFINITION ASSOC-KEYWORD))
 (16 16 (:REWRITE DEFAULT-*-1))
 (13 13 (:REWRITE DEFAULT-+-2))
 (13 13 (:REWRITE DEFAULT-+-1))
 (3 3 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 )
(<-OF-ALEN1-OF-EXPAND-ARRAY
 (264 264 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (230 54 (:REWRITE DEFAULT-<-2))
 (114 21 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (70 40 (:REWRITE DEFAULT-CDR))
 (62 32 (:REWRITE DEFAULT-CAR))
 (54 54 (:REWRITE DEFAULT-<-1))
 (40 10 (:DEFINITION ASSOC-KEYWORD))
 (35 19 (:REWRITE DEFAULT-*-2))
 (19 19 (:REWRITE DEFAULT-*-1))
 (16 16 (:REWRITE DEFAULT-+-2))
 (16 16 (:REWRITE DEFAULT-+-1))
 (15 5 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (5 5 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 )
(<-OF-ALEN1-OF-EXPAND-ARRAY-LINEAR
 (213 213 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (140 32 (:REWRITE DEFAULT-<-2))
 (70 13 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (42 24 (:REWRITE DEFAULT-CDR))
 (38 20 (:REWRITE DEFAULT-CAR))
 (32 32 (:REWRITE DEFAULT-<-1))
 (24 6 (:DEFINITION ASSOC-KEYWORD))
 (23 13 (:REWRITE DEFAULT-*-2))
 (13 13 (:REWRITE DEFAULT-*-1))
 (10 10 (:REWRITE DEFAULT-+-2))
 (10 10 (:REWRITE DEFAULT-+-1))
 (9 3 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (3 3 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 )
(ARRAY1P-OF-EXPAND-ARRAY
 (4555 2489 (:TYPE-PRESCRIPTION TRUE-LISTP-OF-DIMENSIONS))
 (3845 3845 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (3005 251 (:REWRITE CONSP-OF-DIMENSIONS-WHEN-ARRAY1P))
 (2945 100 (:DEFINITION TRUE-LISTP))
 (2700 165 (:REWRITE TRUE-LISTP-OF-DIMENSIONS))
 (2309 1033 (:REWRITE DEFAULT-CDR))
 (1536 103 (:REWRITE INTEGERP-OF-ALEN1))
 (1373 76 (:REWRITE CONSP-OF-HEADER))
 (606 130 (:DEFINITION KEYWORDP))
 (602 485 (:REWRITE DEFAULT-<-2))
 (485 485 (:REWRITE DEFAULT-<-1))
 (476 476 (:TYPE-PRESCRIPTION STRINGP-SYMBOL-PACKAGE-NAME))
 (387 236 (:REWRITE DEFAULT-+-2))
 (381 369 (:REWRITE DEFAULT-CAR))
 (242 242 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (236 236 (:REWRITE DEFAULT-+-1))
 (134 134 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (130 130 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (117 117 (:REWRITE DEFAULT-*-2))
 (117 117 (:REWRITE DEFAULT-*-1))
 (112 1 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (103 103 (:REWRITE INTEGERP-OF-ALEN1-GEN))
 (102 1 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (92 23 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (76 76 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (46 46 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (46 46 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (23 23 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 )
(DEFAULT-OF-EXPAND-ARRAY
 (150 43 (:REWRITE DEFAULT-CDR))
 (110 1 (:REWRITE CONSP-OF-HEADER))
 (108 1 (:REWRITE ARRAY1P-REWRITE))
 (27 27 (:REWRITE DEFAULT-CAR))
 (26 14 (:REWRITE DEFAULT-*-2))
 (25 13 (:REWRITE DEFAULT-+-2))
 (23 23 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (20 20 (:REWRITE DEFAULT-<-2))
 (20 20 (:REWRITE DEFAULT-<-1))
 (17 1 (:DEFINITION TRUE-LISTP))
 (16 8 (:TYPE-PRESCRIPTION TRUE-LISTP-OF-DIMENSIONS))
 (14 14 (:REWRITE DEFAULT-*-1))
 (14 1 (:DEFINITION KEYWORD-VALUE-LISTP))
 (13 13 (:REWRITE DEFAULT-+-1))
 (13 1 (:DEFINITION ALISTP))
 (10 5 (:TYPE-PRESCRIPTION ALEN1-TYPE))
 (8 8 (:TYPE-PRESCRIPTION ALISTP))
 (7 7 (:TYPE-PRESCRIPTION LEN))
 (7 1 (:DEFINITION LEN))
 (5 5 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (5 5 (:TYPE-PRESCRIPTION KEYWORD-VALUE-LISTP))
 (5 1 (:REWRITE ALISTP-OF-CDR))
 (5 1 (:DEFINITION KEYWORDP))
 (4 4 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (4 4 (:TYPE-PRESCRIPTION STRINGP-SYMBOL-PACKAGE-NAME))
 (4 2 (:REWRITE CONSP-OF-DIMENSIONS-WHEN-ARRAY1P))
 (4 1 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (3 3 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (3 3 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (2 2 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (2 1 (:REWRITE TRUE-LISTP-OF-DIMENSIONS))
 (2 1 (:REWRITE INTEGERP-OF-ALEN1))
 (1 1 (:TYPE-PRESCRIPTION BOUNDED-INTEGER-ALISTP))
 (1 1 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (1 1 (:REWRITE INTEGERP-OF-ALEN1-GEN))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (1 1 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (1 1 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (1 1 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-INTEGER-ALISTP))
 (1 1 (:REWRITE ALEN1-INTRO))
 )
(AREF1-OF-EXPAND-ARRAY-LARGE
 (1385 20 (:REWRITE AREF1-WHEN-NOT-ASSOC-EQUAL))
 (1243 7 (:REWRITE ASSOC-EQUAL-OF-COMPRESS1))
 (491 462 (:REWRITE DEFAULT-CDR))
 (259 259 (:REWRITE DEFAULT-CAR))
 (257 89 (:REWRITE DEFAULT-<-2))
 (114 114 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (100 25 (:REWRITE ASSOC-EQUAL-OF-CONS-SAFE))
 (99 89 (:REWRITE DEFAULT-<-1))
 (75 42 (:REWRITE DEFAULT-*-2))
 (75 3 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (70 14 (:TYPE-PRESCRIPTION MIN))
 (62 62 (:TYPE-PRESCRIPTION COMPRESS1))
 (54 35 (:REWRITE ASSOC-EQUAL-WHEN-NOT-CONSP-CHEAP))
 (45 45 (:TYPE-PRESCRIPTION ARRAY-ORDER))
 (44 10 (:REWRITE AREF1-WHEN-TOO-LARGE-CHEAP))
 (42 42 (:REWRITE DEFAULT-*-1))
 (28 2 (:REWRITE ALEN1-OF-COMPRESS1))
 (25 25 (:REWRITE DEFAULT-+-2))
 (25 25 (:REWRITE DEFAULT-+-1))
 (20 20 (:LINEAR ARRAY2P-LINEAR))
 (15 5 (:REWRITE CONSP-OF-ASSOC-EQUAL))
 (9 3 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (5 5 (:REWRITE ARRAY1P-CONS))
 (5 1 (:REWRITE ARRAY1P-OF-COMPRESS1))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (1 1 (:REWRITE CONSP-OF-HEADER))
 )
(AREF1-OF-EXPAND-ARRAY-SMALL
 (1410 30 (:REWRITE AREF1-WHEN-NOT-ASSOC-EQUAL))
 (1243 7 (:REWRITE ASSOC-EQUAL-OF-COMPRESS1))
 (487 458 (:REWRITE DEFAULT-CDR))
 (253 253 (:REWRITE DEFAULT-CAR))
 (114 85 (:REWRITE DEFAULT-<-2))
 (100 25 (:REWRITE ASSOC-EQUAL-OF-CONS-SAFE))
 (95 85 (:REWRITE DEFAULT-<-1))
 (82 82 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (75 42 (:REWRITE DEFAULT-*-2))
 (64 20 (:REWRITE AREF1-WHEN-TOO-LARGE-CHEAP))
 (59 40 (:REWRITE ASSOC-EQUAL-WHEN-NOT-CONSP-CHEAP))
 (45 45 (:TYPE-PRESCRIPTION ARRAY-ORDER))
 (42 42 (:REWRITE DEFAULT-*-1))
 (30 30 (:TYPE-PRESCRIPTION COMPRESS1))
 (25 25 (:REWRITE DEFAULT-+-2))
 (25 25 (:REWRITE DEFAULT-+-1))
 (20 20 (:LINEAR ARRAY2P-LINEAR))
 (20 4 (:TYPE-PRESCRIPTION MIN))
 (15 5 (:REWRITE CONSP-OF-ASSOC-EQUAL))
 (4 4 (:REWRITE ARRAY1P-CONS))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (1 1 (:REWRITE CONSP-OF-HEADER))
 )
(AREF1-OF-EXPAND-ARRAY
 (20 17 (:REWRITE DEFAULT-<-2))
 (17 17 (:REWRITE DEFAULT-<-1))
 (13 13 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (11 4 (:REWRITE AREF1-WHEN-TOO-LARGE-CHEAP))
 (6 6 (:LINEAR ARRAY2P-LINEAR))
 (6 3 (:REWRITE DEFAULT-CDR))
 (3 3 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:TYPE-PRESCRIPTION EXPAND-ARRAY))
 )
(ASET1-EXPANDABLE
 (1855 782 (:REWRITE DEFAULT-CDR))
 (1702 57 (:DEFINITION TRUE-LISTP))
 (1563 94 (:REWRITE TRUE-LISTP-OF-DIMENSIONS))
 (1500 1500 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (1072 56 (:REWRITE CONSP-OF-HEADER))
 (877 60 (:REWRITE INTEGERP-OF-ALEN1))
 (794 379 (:REWRITE DEFAULT-<-2))
 (379 379 (:REWRITE DEFAULT-<-1))
 (352 5 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (328 310 (:REWRITE DEFAULT-CAR))
 (284 5 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (241 148 (:REWRITE DEFAULT-+-2))
 (161 161 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (148 148 (:REWRITE DEFAULT-+-1))
 (104 104 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (96 96 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (85 85 (:REWRITE DEFAULT-*-2))
 (85 85 (:REWRITE DEFAULT-*-1))
 (74 74 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (60 60 (:REWRITE INTEGERP-OF-ALEN1-GEN))
 (60 15 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (54 54 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (30 30 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (15 15 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 )
(INDEX-IN-BOUNDS-AFTER-ASET1-EXPANDABLE
 (420 420 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (243 26 (:REWRITE DEFAULT-<-2))
 (163 10 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (92 4 (:REWRITE DEFAULT-*-2))
 (35 26 (:REWRITE DEFAULT-<-1))
 (30 10 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (20 9 (:REWRITE DEFAULT-CDR))
 (8 2 (:DEFINITION ASSOC-KEYWORD))
 (6 2 (:REWRITE CONSP-OF-HEADER))
 (4 4 (:REWRITE DEFAULT-+-2))
 (4 4 (:REWRITE DEFAULT-+-1))
 (4 4 (:REWRITE DEFAULT-*-1))
 (3 3 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (2 2 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (2 2 (:REWRITE DEFAULT-CAR))
 (2 2 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 )
(ARRAY1P-OF-ASET1-EXPANDABLE
 (12 12 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (12 9 (:REWRITE DEFAULT-<-2))
 (10 5 (:REWRITE DEFAULT-CDR))
 (9 9 (:REWRITE DEFAULT-<-1))
 (6 6 (:LINEAR ARRAY2P-LINEAR))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (2 2 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE DEFAULT-CAR))
 )
(MAYBE-EXPAND-ARRAY
 (355 96 (:REWRITE DEFAULT-CDR))
 (237 9 (:REWRITE CONSP-OF-HEADER))
 (152 76 (:TYPE-PRESCRIPTION TRUE-LISTP-OF-DIMENSIONS))
 (128 3 (:DEFINITION TRUE-LISTP))
 (107 107 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (106 4 (:REWRITE TRUE-LISTP-OF-DIMENSIONS))
 (78 6 (:REWRITE INTEGERP-OF-ALEN1))
 (50 50 (:REWRITE DEFAULT-<-2))
 (50 50 (:REWRITE DEFAULT-<-1))
 (33 33 (:REWRITE DEFAULT-CAR))
 (25 25 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (24 6 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (20 10 (:REWRITE DEFAULT-+-2))
 (16 16 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (14 14 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (14 14 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (12 12 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (10 10 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (10 10 (:REWRITE DEFAULT-+-1))
 (8 8 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (6 6 (:REWRITE INTEGERP-OF-ALEN1-GEN))
 (6 6 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 )
(MAYBE-EXPAND-ARRAY-REWRITE
 (50 32 (:TYPE-PRESCRIPTION ALEN1-TYPE))
 (46 2 (:REWRITE DEFAULT-<-2))
 (32 32 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (28 4 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (17 17 (:TYPE-PRESCRIPTION MAYBE-EXPAND-ARRAY))
 (16 5 (:REWRITE DEFAULT-CDR))
 (6 2 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (6 2 (:REWRITE CONSP-OF-HEADER))
 (4 2 (:REWRITE DEFAULT-<-1))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (3 3 (:TYPE-PRESCRIPTION TRUE-LISTP-OF-DIMENSIONS))
 (3 3 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (2 2 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE DEFAULT-CAR))
 )
(ARRAY1P-OF-MAYBE-EXPAND-ARRAY
 (2024 862 (:REWRITE DEFAULT-CDR))
 (1078 528 (:REWRITE DEFAULT-CAR))
 (668 167 (:DEFINITION ASSOC-KEYWORD))
 (561 147 (:REWRITE CONSP-OF-ASSOC-EQUAL))
 (312 312 (:REWRITE ASSOC-EQUAL-WHEN-NOT-CONSP-CHEAP))
 (119 119 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (91 91 (:REWRITE DEFAULT-<-2))
 (91 91 (:REWRITE DEFAULT-<-1))
 (50 37 (:REWRITE DEFAULT-+-2))
 (48 12 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (38 38 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (37 37 (:REWRITE DEFAULT-+-1))
 (36 12 (:DEFINITION TRUE-LISTP))
 (34 34 (:REWRITE DEFAULT-*-2))
 (34 34 (:REWRITE DEFAULT-*-1))
 (24 24 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (24 24 (:LINEAR ARRAY2P-LINEAR))
 (13 13 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (12 12 (:REWRITE INTEGERP-OF-CAAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (12 12 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (8 8 (:REWRITE ARRAY1P-CONS))
 )
(INTEGERP-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY
 (1045 11 (:REWRITE ARRAY1P-REWRITE))
 (969 17 (:REWRITE INTEGERP-OF-ALEN1))
 (344 344 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (216 86 (:REWRITE DEFAULT-CDR))
 (159 11 (:DEFINITION ALISTP))
 (154 11 (:DEFINITION KEYWORD-VALUE-LISTP))
 (141 70 (:TYPE-PRESCRIPTION TRUE-LISTP-OF-DIMENSIONS))
 (136 8 (:DEFINITION TRUE-LISTP))
 (118 11 (:REWRITE CONSP-OF-HEADER))
 (88 88 (:TYPE-PRESCRIPTION ALISTP))
 (62 62 (:TYPE-PRESCRIPTION LEN))
 (59 59 (:REWRITE DEFAULT-<-2))
 (59 59 (:REWRITE DEFAULT-<-1))
 (58 58 (:TYPE-PRESCRIPTION KEYWORD-VALUE-LISTP))
 (56 8 (:DEFINITION LEN))
 (55 11 (:REWRITE ALISTP-OF-CDR))
 (55 11 (:DEFINITION KEYWORDP))
 (53 8 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (44 44 (:TYPE-PRESCRIPTION STRINGP-SYMBOL-PACKAGE-NAME))
 (36 34 (:REWRITE DEFAULT-CAR))
 (33 33 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (32 32 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (32 16 (:REWRITE CONSP-OF-DIMENSIONS-WHEN-ARRAY1P))
 (28 20 (:REWRITE DEFAULT-+-2))
 (22 22 (:TYPE-PRESCRIPTION MAYBE-EXPAND-ARRAY))
 (20 20 (:REWRITE DEFAULT-+-1))
 (17 17 (:REWRITE INTEGERP-OF-ALEN1-GEN))
 (16 16 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (16 8 (:REWRITE TRUE-LISTP-OF-DIMENSIONS))
 (14 14 (:TYPE-PRESCRIPTION BOUNDED-INTEGER-ALISTP))
 (14 14 (:REWRITE DEFAULT-*-2))
 (14 14 (:REWRITE DEFAULT-*-1))
 (12 12 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (11 11 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (11 11 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (11 11 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (8 8 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (8 8 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-INTEGER-ALISTP))
 (8 2 (:DEFINITION ASSOC-KEYWORD))
 (6 6 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (6 3 (:REWRITE NATP-OF-ALEN1))
 (4 4 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 (3 3 (:TYPE-PRESCRIPTION NATP))
 )
(DEFAULT-OF-MAYBE-EXPAND-ARRAY
 (66 33 (:TYPE-PRESCRIPTION ALEN1-TYPE))
 (46 2 (:REWRITE DEFAULT-<-2))
 (33 33 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (28 4 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (16 5 (:REWRITE DEFAULT-CDR))
 (6 2 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (6 2 (:REWRITE CONSP-OF-HEADER))
 (4 2 (:REWRITE DEFAULT-<-1))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (3 3 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (2 2 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE DEFAULT-CAR))
 )
(INDEX-IN-BOUNDS-AFTER-MAYBE-EXPAND-ARRAY
 (422 422 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (222 24 (:REWRITE DEFAULT-<-2))
 (160 10 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (156 44 (:TYPE-PRESCRIPTION INTEGERP-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY))
 (115 5 (:REWRITE DEFAULT-*-2))
 (36 24 (:REWRITE DEFAULT-<-1))
 (30 10 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (16 5 (:REWRITE DEFAULT-CDR))
 (10 10 (:TYPE-PRESCRIPTION NATP))
 (6 2 (:REWRITE CONSP-OF-HEADER))
 (5 5 (:REWRITE DEFAULT-+-2))
 (5 5 (:REWRITE DEFAULT-+-1))
 (5 5 (:REWRITE DEFAULT-*-1))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (3 3 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (2 2 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE DEFAULT-CAR))
 )
(ALEN1-OF-MAYBE-EXPAND-ARRAY-BOUND
 (3951 34 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (3607 33 (:REWRITE ARRAY1P-REWRITE))
 (3563 32 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (2507 153 (:REWRITE DEFAULT-<-2))
 (1637 1637 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (1476 14 (:REWRITE DEFAULT-*-2))
 (622 153 (:REWRITE DEFAULT-<-1))
 (511 246 (:TYPE-PRESCRIPTION TRUE-LISTP-OF-DIMENSIONS))
 (510 30 (:DEFINITION TRUE-LISTP))
 (481 33 (:DEFINITION ALISTP))
 (462 33 (:DEFINITION KEYWORD-VALUE-LISTP))
 (442 237 (:REWRITE DEFAULT-CDR))
 (264 264 (:TYPE-PRESCRIPTION ALISTP))
 (216 216 (:TYPE-PRESCRIPTION LEN))
 (210 30 (:DEFINITION LEN))
 (204 30 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (174 33 (:REWRITE CONSP-OF-HEADER))
 (168 168 (:TYPE-PRESCRIPTION KEYWORD-VALUE-LISTP))
 (165 33 (:REWRITE ALISTP-OF-CDR))
 (165 33 (:DEFINITION KEYWORDP))
 (152 42 (:TYPE-PRESCRIPTION INTEGERP-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY))
 (132 132 (:TYPE-PRESCRIPTION STRINGP-SYMBOL-PACKAGE-NAME))
 (120 120 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (120 60 (:REWRITE CONSP-OF-DIMENSIONS-WHEN-ARRAY1P))
 (99 99 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (79 77 (:REWRITE DEFAULT-CAR))
 (72 42 (:REWRITE DEFAULT-+-2))
 (60 60 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (60 30 (:REWRITE TRUE-LISTP-OF-DIMENSIONS))
 (60 30 (:REWRITE INTEGERP-OF-ALEN1))
 (42 42 (:REWRITE DEFAULT-+-1))
 (36 36 (:TYPE-PRESCRIPTION BOUNDED-INTEGER-ALISTP))
 (34 34 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (33 33 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (33 33 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (33 33 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (30 30 (:REWRITE INTEGERP-OF-ALEN1-GEN))
 (30 30 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 (30 30 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-INTEGER-ALISTP))
 (24 12 (:REWRITE NATP-OF-ALEN1))
 (20 20 (:TYPE-PRESCRIPTION NATP))
 (14 14 (:REWRITE DEFAULT-*-1))
 (4 4 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (3 3 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (3 1 (:LINEAR INDEX-IN-BOUNDS-AFTER-MAYBE-EXPAND-ARRAY))
 )
(AREF1-OF-MAYBE-EXPAND-ARRAY-SMALL
 (977 977 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (541 534 (:REWRITE DEFAULT-CDR))
 (264 264 (:REWRITE DEFAULT-CAR))
 (228 173 (:REWRITE DEFAULT-<-2))
 (213 173 (:REWRITE DEFAULT-<-1))
 (138 77 (:REWRITE DEFAULT-*-2))
 (87 22 (:REWRITE AREF1-WHEN-TOO-LARGE-CHEAP))
 (77 77 (:REWRITE DEFAULT-*-1))
 (47 47 (:REWRITE DEFAULT-+-2))
 (47 47 (:REWRITE DEFAULT-+-1))
 (43 43 (:REWRITE ASSOC-EQUAL-WHEN-NOT-CONSP-CHEAP))
 (42 42 (:LINEAR ARRAY2P-LINEAR))
 (9 9 (:TYPE-PRESCRIPTION COMPRESS1))
 (8 2 (:DEFINITION ASSOC-KEYWORD))
 (5 1 (:TYPE-PRESCRIPTION MIN))
 (4 4 (:REWRITE ARRAY1P-CONS))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE CONSP-OF-HEADER))
 )
(AREF1-OF-MAYBE-EXPAND-ARRAY-LARGE
 (107 107 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (22 16 (:REWRITE DEFAULT-<-2))
 (16 16 (:REWRITE DEFAULT-<-1))
 (10 5 (:REWRITE DEFAULT-CDR))
 (6 6 (:LINEAR ARRAY2P-LINEAR))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (2 2 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:TYPE-PRESCRIPTION EXPAND-ARRAY))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE DEFAULT-CAR))
 )
(AREF1-OF-MAYBE-EXPAND-ARRAY
 (68 17 (:REWRITE DEFAULT-<-2))
 (25 1 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (19 19 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (17 17 (:REWRITE DEFAULT-<-1))
 (16 5 (:REWRITE AREF1-WHEN-TOO-LARGE-CHEAP))
 (11 11 (:TYPE-PRESCRIPTION EXPAND-ARRAY))
 (10 5 (:REWRITE DEFAULT-CDR))
 (6 6 (:LINEAR ARRAY2P-LINEAR))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (3 1 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (2 2 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE DEFAULT-CAR))
 )
(ALEN1-OF-ASET1-EXPANDABLE
 (358 358 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (157 19 (:REWRITE DEFAULT-<-2))
 (84 12 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (76 21 (:TYPE-PRESCRIPTION INTEGERP-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY))
 (63 25 (:REWRITE DEFAULT-CDR))
 (28 14 (:REWRITE DEFAULT-+-2))
 (25 19 (:REWRITE DEFAULT-<-1))
 (21 7 (:REWRITE CONSP-OF-HEADER))
 (18 6 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (14 14 (:REWRITE DEFAULT-+-1))
 (8 8 (:REWRITE DEFAULT-CAR))
 (8 4 (:REWRITE ALEN1-OF-EXPAND-ARRAY))
 (8 2 (:DEFINITION ASSOC-KEYWORD))
 (7 7 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (6 6 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (4 4 (:TYPE-PRESCRIPTION NATP))
 (2 2 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 )
(<=-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY-AND-MAX
 (979 979 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (660 37 (:REWRITE DEFAULT-<-2))
 (494 47 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (260 14 (:REWRITE DEFAULT-*-2))
 (84 28 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (62 37 (:REWRITE DEFAULT-<-1))
 (56 28 (:TYPE-PRESCRIPTION INTEGERP-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY))
 (30 30 (:TYPE-PRESCRIPTION NATP))
 (25 15 (:REWRITE DEFAULT-CDR))
 (23 12 (:REWRITE DEFAULT-+-2))
 (14 14 (:REWRITE DEFAULT-*-1))
 (12 12 (:REWRITE DEFAULT-CAR))
 (12 12 (:REWRITE DEFAULT-+-1))
 (8 2 (:DEFINITION ASSOC-KEYWORD))
 (6 6 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (6 2 (:DEFINITION NATP))
 (5 1 (:LINEAR INDEX-IN-BOUNDS-AFTER-MAYBE-EXPAND-ARRAY))
 (5 1 (:LINEAR ALEN1-OF-MAYBE-EXPAND-ARRAY-BOUND))
 (4 4 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 (3 1 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 )
(AREF1-EXPANDABLE
 (330 102 (:REWRITE DEFAULT-CDR))
 (195 8 (:REWRITE CONSP-OF-HEADER))
 (179 100 (:TYPE-PRESCRIPTION TRUE-LISTP-OF-DIMENSIONS))
 (157 157 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (128 3 (:DEFINITION TRUE-LISTP))
 (106 4 (:REWRITE TRUE-LISTP-OF-DIMENSIONS))
 (78 6 (:REWRITE INTEGERP-OF-ALEN1))
 (49 49 (:REWRITE DEFAULT-<-2))
 (49 49 (:REWRITE DEFAULT-<-1))
 (36 36 (:REWRITE DEFAULT-CAR))
 (24 6 (:REWRITE BOUNDED-INTEGER-ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (23 23 (:REWRITE TRUE-LISTP-OF-CAR-WHEN-WHEN-BOUNDED-NATP-ALISTP))
 (18 9 (:REWRITE DEFAULT-+-2))
 (15 15 (:REWRITE ALISTP-WHEN-BOUNDED-NATP-ALISTP))
 (14 14 (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
 (13 13 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (12 12 (:TYPE-PRESCRIPTION BOUNDED-NATP-ALISTP))
 (10 10 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (9 9 (:REWRITE DEFAULT-+-1))
 (7 7 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 (6 6 (:REWRITE INTEGERP-OF-ALEN1-GEN))
 (6 6 (:REWRITE BOUNDED-NATP-ALISTP-MONOTONE))
 )
(AREF1-OF-ASET1-EXPANDABLE-SMALL
 (39 10 (:REWRITE AREF1-WHEN-TOO-LARGE-CHEAP))
 (37 37 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (32 27 (:REWRITE DEFAULT-<-2))
 (27 27 (:REWRITE DEFAULT-<-1))
 (12 6 (:REWRITE DEFAULT-CDR))
 (10 10 (:LINEAR ARRAY2P-LINEAR))
 (6 6 (:TYPE-PRESCRIPTION ASET1))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (3 3 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE DEFAULT-CAR))
 )
(MAYBE-EXPAND-ARRAY-DOES-NOTHING
 (92 46 (:TYPE-PRESCRIPTION ALEN1-TYPE))
 (46 46 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (46 2 (:REWRITE DEFAULT-<-2))
 (28 4 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (19 19 (:TYPE-PRESCRIPTION MAYBE-EXPAND-ARRAY))
 (11 4 (:REWRITE DEFAULT-CDR))
 (6 2 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (4 2 (:REWRITE DEFAULT-<-1))
 (4 1 (:DEFINITION ASSOC-KEYWORD))
 (3 3 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (3 1 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE DEFAULT-CAR))
 (1 1 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 )
(SIZE-OF-EXPANDED-ARRAY)
(BOUND-ON-SIZE-OF-EXPANDED-ARRAY
 (45 45 (:TYPE-PRESCRIPTION SIZE-OF-EXPANDED-ARRAY))
 (23 18 (:REWRITE DEFAULT-<-2))
 (19 18 (:REWRITE DEFAULT-<-1))
 (8 8 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (7 4 (:REWRITE DEFAULT-*-2))
 (4 4 (:REWRITE DEFAULT-+-2))
 (4 4 (:REWRITE DEFAULT-+-1))
 (4 4 (:REWRITE DEFAULT-*-1))
 )
(ALEN1-OF-MAYBE-EXPAND-ARRAY
 (713 713 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (285 17 (:REWRITE DEFAULT-*-2))
 (267 39 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (222 29 (:REWRITE DEFAULT-<-2))
 (57 29 (:REWRITE DEFAULT-<-1))
 (57 19 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (44 11 (:TYPE-PRESCRIPTION SIZE-OF-EXPANDED-ARRAY))
 (38 1 (:REWRITE MAYBE-EXPAND-ARRAY-DOES-NOTHING))
 (27 15 (:REWRITE DEFAULT-+-2))
 (25 15 (:REWRITE DEFAULT-CDR))
 (22 11 (:TYPE-PRESCRIPTION INTEGERP-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY))
 (17 17 (:REWRITE DEFAULT-*-1))
 (15 15 (:REWRITE DEFAULT-+-1))
 (12 12 (:REWRITE DEFAULT-CAR))
 (11 11 (:TYPE-PRESCRIPTION NATP))
 (8 2 (:DEFINITION ASSOC-KEYWORD))
 (6 6 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (4 4 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 (3 1 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 )
(<-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY
 (833 833 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (509 40 (:REWRITE DEFAULT-<-2))
 (416 53 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (260 14 (:REWRITE DEFAULT-*-2))
 (78 40 (:REWRITE DEFAULT-<-1))
 (72 36 (:TYPE-PRESCRIPTION INTEGERP-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY))
 (63 21 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (38 38 (:TYPE-PRESCRIPTION NATP))
 (38 1 (:REWRITE MAYBE-EXPAND-ARRAY-DOES-NOTHING))
 (25 15 (:REWRITE DEFAULT-CDR))
 (23 12 (:REWRITE DEFAULT-+-2))
 (14 14 (:REWRITE DEFAULT-*-1))
 (12 12 (:REWRITE DEFAULT-CAR))
 (12 12 (:REWRITE DEFAULT-+-1))
 (8 2 (:DEFINITION ASSOC-KEYWORD))
 (6 6 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (6 2 (:DEFINITION NATP))
 (5 1 (:LINEAR INDEX-IN-BOUNDS-AFTER-MAYBE-EXPAND-ARRAY))
 (5 1 (:LINEAR ALEN1-OF-MAYBE-EXPAND-ARRAY-BOUND))
 (4 4 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 (3 1 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 )
(<-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY-LINEAR
 (834 834 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (509 40 (:REWRITE DEFAULT-<-2))
 (416 53 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (260 14 (:REWRITE DEFAULT-*-2))
 (78 40 (:REWRITE DEFAULT-<-1))
 (74 37 (:TYPE-PRESCRIPTION INTEGERP-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY))
 (63 21 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (39 39 (:TYPE-PRESCRIPTION NATP))
 (38 1 (:REWRITE MAYBE-EXPAND-ARRAY-DOES-NOTHING))
 (25 15 (:REWRITE DEFAULT-CDR))
 (23 12 (:REWRITE DEFAULT-+-2))
 (14 14 (:REWRITE DEFAULT-*-1))
 (12 12 (:REWRITE DEFAULT-CAR))
 (12 12 (:REWRITE DEFAULT-+-1))
 (8 2 (:DEFINITION ASSOC-KEYWORD))
 (6 6 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (6 2 (:DEFINITION NATP))
 (5 1 (:LINEAR INDEX-IN-BOUNDS-AFTER-MAYBE-EXPAND-ARRAY))
 (5 1 (:LINEAR ALEN1-OF-MAYBE-EXPAND-ARRAY-BOUND))
 (4 4 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 (3 1 (:REWRITE CONSP-OF-HEADER))
 (1 1 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (1 1 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 )
(NOT-EQUAL-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY
 (725 725 (:TYPE-PRESCRIPTION POSP-OF-ALEN1))
 (251 32 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (243 16 (:REWRITE DEFAULT-*-2))
 (183 33 (:REWRITE DEFAULT-<-2))
 (158 33 (:REWRITE DEFAULT-<-1))
 (76 2 (:REWRITE MAYBE-EXPAND-ARRAY-DOES-NOTHING))
 (62 31 (:TYPE-PRESCRIPTION INTEGERP-OF-ALEN1-OF-MAYBE-EXPAND-ARRAY))
 (48 28 (:REWRITE DEFAULT-CDR))
 (45 15 (:REWRITE RATIONALP-OF-ALEN1-WHEN-ARRAY1P))
 (33 33 (:TYPE-PRESCRIPTION NATP))
 (21 21 (:REWRITE DEFAULT-CAR))
 (19 9 (:REWRITE DEFAULT-+-2))
 (16 16 (:REWRITE DEFAULT-*-1))
 (16 4 (:DEFINITION ASSOC-KEYWORD))
 (12 12 (:TYPE-PRESCRIPTION ASSOC-KEYWORD))
 (9 9 (:REWRITE DEFAULT-+-1))
 (7 7 (:REWRITE ASSOC-KEYWORD-OF-CONS-DIFF))
 (6 2 (:REWRITE CONSP-OF-HEADER))
 (6 2 (:DEFINITION NATP))
 (5 1 (:LINEAR INDEX-IN-BOUNDS-AFTER-MAYBE-EXPAND-ARRAY))
 (5 1 (:LINEAR ALEN1-OF-MAYBE-EXPAND-ARRAY-BOUND))
 (2 2 (:REWRITE DIMENSIONS-WHEN-NOT-CONSP-OF-HEADER-CHEAP))
 (2 2 (:REWRITE CONSP-OF-HEADER-WHEN-ARRAY1P))
 )
