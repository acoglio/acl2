(HOW-MANY)
(SPLIT
 (160 73 (:REWRITE DEFAULT-+-2))
 (102 73 (:REWRITE DEFAULT-+-1))
 (56 14 (:REWRITE COMMUTATIVITY-OF-+))
 (56 14 (:DEFINITION INTEGER-ABS))
 (56 7 (:DEFINITION LENGTH))
 (35 7 (:DEFINITION LEN))
 (28 28 (:REWRITE DEFAULT-CDR))
 (24 18 (:REWRITE DEFAULT-<-2))
 (22 18 (:REWRITE DEFAULT-<-1))
 (14 14 (:REWRITE DEFAULT-UNARY-MINUS))
 (12 12 (:REWRITE DEFAULT-CAR))
 (7 7 (:TYPE-PRESCRIPTION LEN))
 (7 7 (:REWRITE NUMERATOR-WHEN-INTEGERP))
 (7 7 (:REWRITE INTEGERP==>DENOMINATOR=1))
 (7 7 (:REWRITE DEFAULT-REALPART))
 (7 7 (:REWRITE DEFAULT-NUMERATOR))
 (7 7 (:REWRITE DEFAULT-IMAGPART))
 (7 7 (:REWRITE DEFAULT-DENOMINATOR))
 (7 7 (:REWRITE DEFAULT-COERCE-2))
 (7 7 (:REWRITE DEFAULT-COERCE-1))
 )
(MERGELIST
 (198 91 (:REWRITE DEFAULT-+-2))
 (133 91 (:REWRITE DEFAULT-+-1))
 (64 16 (:DEFINITION INTEGER-ABS))
 (64 8 (:DEFINITION LENGTH))
 (40 8 (:DEFINITION LEN))
 (30 30 (:REWRITE FOLD-CONSTS-IN-+))
 (28 20 (:REWRITE DEFAULT-<-2))
 (26 26 (:REWRITE DEFAULT-CDR))
 (26 20 (:REWRITE DEFAULT-<-1))
 (20 20 (:REWRITE DEFAULT-CAR))
 (16 16 (:REWRITE DEFAULT-UNARY-MINUS))
 (8 8 (:TYPE-PRESCRIPTION LEN))
 (8 8 (:REWRITE NUMERATOR-WHEN-INTEGERP))
 (8 8 (:REWRITE INTEGERP==>DENOMINATOR=1))
 (8 8 (:REWRITE DEFAULT-REALPART))
 (8 8 (:REWRITE DEFAULT-NUMERATOR))
 (8 8 (:REWRITE DEFAULT-IMAGPART))
 (8 8 (:REWRITE DEFAULT-DENOMINATOR))
 (8 8 (:REWRITE DEFAULT-COERCE-2))
 (8 8 (:REWRITE DEFAULT-COERCE-1))
 (4 4 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 )
(MEASURE-FOR-MERGESORT
 (2505 1197 (:REWRITE DEFAULT-+-2))
 (1660 1197 (:REWRITE DEFAULT-+-1))
 (992 248 (:DEFINITION INTEGER-ABS))
 (992 124 (:DEFINITION LENGTH))
 (620 124 (:DEFINITION LEN))
 (415 329 (:REWRITE DEFAULT-CAR))
 (372 302 (:REWRITE DEFAULT-<-1))
 (351 302 (:REWRITE DEFAULT-<-2))
 (248 248 (:REWRITE DEFAULT-UNARY-MINUS))
 (124 124 (:TYPE-PRESCRIPTION LEN))
 (124 124 (:REWRITE NUMERATOR-WHEN-INTEGERP))
 (124 124 (:REWRITE INTEGERP==>DENOMINATOR=1))
 (124 124 (:REWRITE DEFAULT-REALPART))
 (124 124 (:REWRITE DEFAULT-NUMERATOR))
 (124 124 (:REWRITE DEFAULT-IMAGPART))
 (124 124 (:REWRITE DEFAULT-DENOMINATOR))
 (124 124 (:REWRITE DEFAULT-COERCE-2))
 (124 124 (:REWRITE DEFAULT-COERCE-1))
 )
(MV-NTH-CADR)
(MERGESORT
 (134 4 (:DEFINITION ACL2-COUNT))
 (42 20 (:REWRITE DEFAULT-+-2))
 (36 2 (:DEFINITION SPLIT))
 (28 20 (:REWRITE DEFAULT-+-1))
 (26 14 (:REWRITE DEFAULT-CAR))
 (22 19 (:REWRITE DEFAULT-CDR))
 (16 4 (:REWRITE COMMUTATIVITY-OF-+))
 (16 4 (:DEFINITION INTEGER-ABS))
 (16 2 (:DEFINITION LENGTH))
 (10 2 (:DEFINITION LEN))
 (6 6 (:REWRITE FOLD-CONSTS-IN-+))
 (4 4 (:REWRITE DEFAULT-UNARY-MINUS))
 (4 4 (:REWRITE DEFAULT-<-2))
 (4 4 (:REWRITE DEFAULT-<-1))
 (2 2 (:TYPE-PRESCRIPTION LEN))
 (2 2 (:REWRITE NUMERATOR-WHEN-INTEGERP))
 (2 2 (:REWRITE INTEGERP==>DENOMINATOR=1))
 (2 2 (:REWRITE DEFAULT-REALPART))
 (2 2 (:REWRITE DEFAULT-NUMERATOR))
 (2 2 (:REWRITE DEFAULT-IMAGPART))
 (2 2 (:REWRITE DEFAULT-DENOMINATOR))
 (2 2 (:REWRITE DEFAULT-COERCE-2))
 (2 2 (:REWRITE DEFAULT-COERCE-1))
 )
(HOW-MANY-MERGELIST
 (210 106 (:REWRITE DEFAULT-+-2))
 (144 140 (:REWRITE DEFAULT-CDR))
 (142 140 (:REWRITE DEFAULT-CAR))
 (136 106 (:REWRITE DEFAULT-+-1))
 (48 48 (:TYPE-PRESCRIPTION MERGELIST))
 (32 32 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (32 16 (:REWRITE DEFAULT-<-2))
 (32 16 (:REWRITE DEFAULT-<-1))
 (19 19 (:REWRITE EQUAL-CONSTANT-+))
 )
(HOW-MANY-SPLIT-LIST
 (230 136 (:REWRITE DEFAULT-CAR))
 (227 200 (:REWRITE DEFAULT-CDR))
 (110 55 (:REWRITE DEFAULT-+-2))
 (65 55 (:REWRITE DEFAULT-+-1))
 (6 6 (:REWRITE EQUAL-CONSTANT-+))
 (1 1 (:REWRITE FOLD-CONSTS-IN-+))
 )
(HOW-MANY-MERGESORT
 (504 28 (:DEFINITION SPLIT))
 (436 250 (:REWRITE DEFAULT-CAR))
 (328 279 (:REWRITE DEFAULT-CDR))
 (195 13 (:DEFINITION MERGELIST))
 (78 39 (:REWRITE DEFAULT-+-2))
 (43 39 (:REWRITE DEFAULT-+-1))
 (26 26 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (26 13 (:REWRITE DEFAULT-<-2))
 (26 13 (:REWRITE DEFAULT-<-1))
 (1 1 (:REWRITE EQUAL-CONSTANT-+))
 )
(COUNTEREXAMPLE-49)
(ALPHA)
(BETA)
(HOW-MANY-ALPHA-BETA)
(PERM-IMPLIES-PERM-CONS-2
 (9 9 (:REWRITE DEFAULT-CAR))
 (6 6 (:REWRITE DEFAULT-CDR))
 (1 1 (:TYPE-PRESCRIPTION IN))
 )
(IN-APPEND
 (54 45 (:REWRITE DEFAULT-CAR))
 (48 24 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
 (37 31 (:REWRITE DEFAULT-CDR))
 (24 24 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (24 24 (:TYPE-PRESCRIPTION BINARY-APPEND))
 )
(DEL-APPEND
 (602 301 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
 (301 301 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (301 301 (:TYPE-PRESCRIPTION BINARY-APPEND))
 (87 72 (:REWRITE DEFAULT-CAR))
 (63 54 (:REWRITE DEFAULT-CDR))
 )
(PERM-IMPLIES-PERM-APPEND-1
 (74 68 (:REWRITE DEFAULT-CAR))
 (59 56 (:REWRITE DEFAULT-CDR))
 (32 16 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
 (16 16 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (16 16 (:TYPE-PRESCRIPTION BINARY-APPEND))
 )
(PERM-IMPLIES-PERM-APPEND-2
 (79 67 (:REWRITE DEFAULT-CAR))
 (63 3 (:REWRITE DEL-APPEND))
 (60 54 (:REWRITE DEFAULT-CDR))
 (42 21 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
 (24 3 (:REWRITE IN-APPEND))
 (21 21 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (21 21 (:TYPE-PRESCRIPTION BINARY-APPEND))
 (16 16 (:TYPE-PRESCRIPTION IN))
 )
(BOUNDED-QUANTIFIERP)
(REP
 (1 1 (:TYPE-PRESCRIPTION |x < y  =>  0 < -x+y|))
 )
(RMV)
(APPEND-REP-RMV
 (529 334 (:REWRITE DEFAULT-CAR))
 (379 300 (:REWRITE DEFAULT-CDR))
 (194 40 (:REWRITE ZP-OPEN))
 (181 5 (:REWRITE DEL-APPEND))
 (90 65 (:REWRITE DEFAULT-+-2))
 (88 5 (:REWRITE IN-APPEND))
 (65 65 (:REWRITE DEFAULT-+-1))
 (47 25 (:REWRITE DEFAULT-<-2))
 (33 33 (:TYPE-PRESCRIPTION IN))
 (25 25 (:REWRITE DEFAULT-<-1))
 )
(RESTRICT)
(SUBSETP-APPEND-1
 (186 93 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
 (155 128 (:REWRITE DEFAULT-CAR))
 (119 104 (:REWRITE DEFAULT-CDR))
 (93 93 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (93 93 (:TYPE-PRESCRIPTION BINARY-APPEND))
 )
(SUBSETP-APPEND-2
 (191 140 (:REWRITE DEFAULT-CAR))
 (170 85 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
 (149 98 (:REWRITE DEFAULT-CDR))
 (85 85 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (85 85 (:TYPE-PRESCRIPTION BINARY-APPEND))
 )
(HINT)
(HOW-MANY-RMV
 (80 77 (:REWRITE DEFAULT-CDR))
 (71 68 (:REWRITE DEFAULT-CAR))
 (50 25 (:REWRITE DEFAULT-+-2))
 (25 25 (:REWRITE DEFAULT-+-1))
 )
(BOUNDED-QUANTIFIERP-RMV
 (88 88 (:REWRITE DEFAULT-CDR))
 (86 86 (:REWRITE DEFAULT-CAR))
 (80 16 (:DEFINITION RMV))
 (52 26 (:REWRITE DEFAULT-+-2))
 (26 26 (:REWRITE DEFAULT-+-1))
 )
(FUNDAMENTAL
 (196 14 (:DEFINITION REP))
 (175 175 (:REWRITE DEFAULT-CAR))
 (164 164 (:REWRITE DEFAULT-CDR))
 (112 20 (:DEFINITION RMV))
 (112 14 (:REWRITE ZP-OPEN))
 (86 18 (:DEFINITION BINARY-APPEND))
 (74 44 (:REWRITE DEFAULT-+-2))
 (64 8 (:REWRITE HOW-MANY-RMV))
 (44 44 (:REWRITE DEFAULT-+-1))
 (35 7 (:DEFINITION IN))
 (35 5 (:DEFINITION DEL))
 (28 14 (:REWRITE DEFAULT-<-2))
 (14 14 (:REWRITE DEFAULT-<-1))
 (12 12 (:TYPE-PRESCRIPTION RMV))
 )
(SUBSETP-RMV-CDR
 (73 72 (:REWRITE DEFAULT-CAR))
 (58 57 (:REWRITE DEFAULT-CDR))
 )
(RESTRICT-SUBSETP
 (21 21 (:REWRITE DEFAULT-CAR))
 (15 15 (:REWRITE DEFAULT-CDR))
 (14 1 (:DEFINITION REP))
 (10 2 (:DEFINITION RMV))
 (8 8 (:TYPE-PRESCRIPTION HOW-MANY))
 (8 1 (:REWRITE ZP-OPEN))
 (7 1 (:DEFINITION HOW-MANY))
 (6 6 (:TYPE-PRESCRIPTION RMV))
 (3 2 (:REWRITE DEFAULT-+-2))
 (2 2 (:REWRITE FUNDAMENTAL))
 (2 2 (:REWRITE DEFAULT-+-1))
 (2 1 (:REWRITE DEFAULT-<-2))
 (1 1 (:TYPE-PRESCRIPTION MEMBER-EQUAL))
 (1 1 (:TYPE-PRESCRIPTION IN))
 (1 1 (:REWRITE DEFAULT-<-1))
 )
(BOUNDED-QUANTIFIERP-ALPHA-BETA
 (42 6 (:DEFINITION HOW-MANY))
 (14 14 (:REWRITE DEFAULT-CDR))
 (12 12 (:REWRITE DEFAULT-CAR))
 (12 6 (:REWRITE DEFAULT-+-2))
 (6 6 (:REWRITE DEFAULT-+-1))
 )
(PERM-ALPHA-BETA
 (7 7 (:REWRITE DEFAULT-CAR))
 (6 6 (:REWRITE DEFAULT-CDR))
 (6 2 (:DEFINITION BINARY-APPEND))
 (5 1 (:DEFINITION DEL))
 (3 1 (:DEFINITION IN))
 )
(PERM-MERGESORT)
