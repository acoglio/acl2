(GL-SYM::|COMMON-LISP::INTEGER-LENGTH$|
 (233 5 (:DEFINITION ACL2-COUNT))
 (85 28 (:REWRITE DEFAULT-+-2))
 (50 28 (:REWRITE DEFAULT-+-1))
 (33 3 (:DEFINITION LENGTH))
 (30 6 (:REWRITE COMMUTATIVITY-OF-+))
 (24 6 (:DEFINITION INTEGER-ABS))
 (24 3 (:DEFINITION LEN))
 (12 12 (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-ATOM-LISTP))
 (8 8 (:REWRITE FOLD-CONSTS-IN-+))
 (8 8 (:REWRITE DEFAULT-CDR))
 (6 6 (:REWRITE-QUOTED-CONSTANT FIX-UNDER-NUMBER-EQUIV))
 (6 6 (:REWRITE DEFAULT-UNARY-MINUS))
 (6 6 (:REWRITE DEFAULT-<-2))
 (6 6 (:REWRITE DEFAULT-<-1))
 (6 2 (:REWRITE EQUAL-OF-BOOLEANS-REWRITE))
 (5 5 (:REWRITE DEFAULT-CAR))
 (4 4 (:TYPE-PRESCRIPTION BOOLEANP))
 (3 3 (:TYPE-PRESCRIPTION LEN))
 (3 3 (:REWRITE DEFAULT-REALPART))
 (3 3 (:REWRITE DEFAULT-NUMERATOR))
 (3 3 (:REWRITE DEFAULT-IMAGPART))
 (3 3 (:REWRITE DEFAULT-DENOMINATOR))
 (3 3 (:REWRITE DEFAULT-COERCE-2))
 (3 3 (:REWRITE DEFAULT-COERCE-1))
 (2 2 (:REWRITE ZP-OPEN))
 (2 2 (:REWRITE GL::TAG-WHEN-ATOM))
 )
(GL-SYM::|COMMON-LISP::INTEGER-LENGTH$-PRESERVES-HYP|
 (848 14 (:DEFINITION INTEGER-LENGTH))
 (742 14 (:DEFINITION FLOOR))
 (448 28 (:DEFINITION NONNEGATIVE-INTEGER-QUOTIENT))
 (322 322 (:TYPE-PRESCRIPTION GL::BFR-HYP-FIX))
 (212 99 (:REWRITE EQUAL-OF-BOOLEANS-REWRITE))
 (196 133 (:REWRITE DEFAULT-+-2))
 (154 7 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
 (147 133 (:REWRITE DEFAULT-+-1))
 (140 42 (:REWRITE COMMUTATIVITY-OF-+))
 (119 7 (:REWRITE LIST-FIX-WHEN-LEN-ZERO))
 (106 106 (:TYPE-PRESCRIPTION BOOLEANP))
 (100 50 (:REWRITE GL::BFR-HYP-FIX-WHEN-HYP$AP))
 (91 7 (:DEFINITION TRUE-LISTP))
 (84 28 (:DEFINITION NFIX))
 (84 14 (:REWRITE SET::SETS-ARE-TRUE-LISTS-CHEAP))
 (78 78 (:REWRITE GL::TAG-WHEN-ATOM))
 (70 70 (:TYPE-PRESCRIPTION NONNEGATIVE-INTEGER-QUOTIENT))
 (70 70 (:REWRITE DEFAULT-<-2))
 (70 70 (:REWRITE DEFAULT-<-1))
 (70 56 (:REWRITE DEFAULT-UNARY-MINUS))
 (58 58 (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-ATOM-LISTP))
 (56 56 (:TYPE-PRESCRIPTION LEN))
 (50 50 (:TYPE-PRESCRIPTION GL::HYP$AP))
 (49 7 (:DEFINITION LEN))
 (42 14 (:REWRITE COMMUTATIVITY-OF-*))
 (36 14 (:REWRITE ZIP-OPEN))
 (35 35 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (28 28 (:TYPE-PRESCRIPTION SET::SETP-TYPE))
 (28 28 (:REWRITE DEFAULT-*-2))
 (28 28 (:REWRITE DEFAULT-*-1))
 (28 28 (:DEFINITION IFIX))
 (28 14 (:REWRITE SET::NONEMPTY-MEANS-SET))
 (21 7 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
 (14 14 (:TYPE-PRESCRIPTION INTEGER-LENGTH))
 (14 14 (:TYPE-PRESCRIPTION SET::EMPTY-TYPE))
 (14 14 (:REWRITE SET::IN-SET))
 (14 14 (:REWRITE DEFAULT-NUMERATOR))
 (14 14 (:REWRITE DEFAULT-DENOMINATOR))
 (14 14 (:REWRITE DEFAULT-CDR))
 (7 7 (:LINEAR INDEX-OF-<-LEN))
 (4 4 (:REWRITE ZP-OPEN))
 )
(GL-SYM::|COMMON-LISP::INTEGER-LENGTH$-OF-BFR-HYP-FIX|
 (1696 28 (:DEFINITION INTEGER-LENGTH))
 (1484 28 (:DEFINITION FLOOR))
 (896 56 (:DEFINITION NONNEGATIVE-INTEGER-QUOTIENT))
 (392 266 (:REWRITE DEFAULT-+-2))
 (369 181 (:REWRITE EQUAL-OF-BOOLEANS-REWRITE))
 (308 14 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
 (294 266 (:REWRITE DEFAULT-+-1))
 (280 84 (:REWRITE COMMUTATIVITY-OF-+))
 (238 119 (:REWRITE GL::BFR-HYP-FIX-WHEN-HYP$AP))
 (238 14 (:REWRITE LIST-FIX-WHEN-LEN-ZERO))
 (182 14 (:DEFINITION TRUE-LISTP))
 (170 170 (:TYPE-PRESCRIPTION BOOLEANP))
 (168 56 (:DEFINITION NFIX))
 (168 28 (:REWRITE SET::SETS-ARE-TRUE-LISTS-CHEAP))
 (143 143 (:REWRITE GL::TAG-WHEN-ATOM))
 (140 140 (:TYPE-PRESCRIPTION NONNEGATIVE-INTEGER-QUOTIENT))
 (140 140 (:REWRITE DEFAULT-<-2))
 (140 140 (:REWRITE DEFAULT-<-1))
 (140 112 (:REWRITE DEFAULT-UNARY-MINUS))
 (119 119 (:TYPE-PRESCRIPTION GL::HYP$AP))
 (112 112 (:TYPE-PRESCRIPTION LEN))
 (112 112 (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-ATOM-LISTP))
 (98 14 (:DEFINITION LEN))
 (84 28 (:REWRITE COMMUTATIVITY-OF-*))
 (72 28 (:REWRITE ZIP-OPEN))
 (70 70 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (56 56 (:TYPE-PRESCRIPTION SET::SETP-TYPE))
 (56 56 (:REWRITE DEFAULT-*-2))
 (56 56 (:REWRITE DEFAULT-*-1))
 (56 56 (:DEFINITION IFIX))
 (56 28 (:REWRITE SET::NONEMPTY-MEANS-SET))
 (44 36 (:REWRITE DEFAULT-CDR))
 (42 14 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
 (28 28 (:TYPE-PRESCRIPTION INTEGER-LENGTH))
 (28 28 (:TYPE-PRESCRIPTION SET::EMPTY-TYPE))
 (28 28 (:REWRITE SET::IN-SET))
 (28 28 (:REWRITE DEFAULT-NUMERATOR))
 (28 28 (:REWRITE DEFAULT-DENOMINATOR))
 (16 8 (:REWRITE DEFAULT-CAR))
 (14 14 (:LINEAR INDEX-OF-<-LEN))
 (6 6 (:REWRITE ZP-OPEN))
 )
(GL::|BFR-HYP-EQUIV-IMPLIES-EQUAL-COMMON-LISP::INTEGER-LENGTH$-2|)
(GL-SYM::|COMMON-LISP::INTEGER-LENGTH$|
 (624 624 (:TYPE-PRESCRIPTION GL::BFR-UNASSUME$A))
 (240 4 (:DEFINITION INTEGER-LENGTH))
 (212 4 (:DEFINITION FLOOR))
 (150 61 (:REWRITE EQUAL-OF-BOOLEANS-REWRITE))
 (128 8 (:DEFINITION NONNEGATIVE-INTEGER-QUOTIENT))
 (123 123 (:TYPE-PRESCRIPTION GL::BFR-HYP-FIX))
 (87 87 (:TYPE-PRESCRIPTION BOOLEANP))
 (56 38 (:REWRITE DEFAULT-+-2))
 (55 55 (:TYPE-PRESCRIPTION GL::BFR-UNASSUME))
 (44 2 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
 (42 38 (:REWRITE DEFAULT-+-1))
 (42 14 (:REWRITE STATE-P-IMPLIES-AND-FORWARD-TO-STATE-P1))
 (40 12 (:REWRITE COMMUTATIVITY-OF-+))
 (37 9 (:REWRITE GL::GLCP-CONFIG-P-WHEN-WRONG-TAG))
 (36 36 (:REWRITE GL::TAG-WHEN-ATOM))
 (36 36 (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-ATOM-LISTP))
 (34 2 (:REWRITE LIST-FIX-WHEN-LEN-ZERO))
 (28 28 (:REWRITE DEFAULT-<-2))
 (28 28 (:REWRITE DEFAULT-<-1))
 (26 2 (:DEFINITION TRUE-LISTP))
 (24 8 (:DEFINITION NFIX))
 (24 4 (:REWRITE SET::SETS-ARE-TRUE-LISTS-CHEAP))
 (20 20 (:TYPE-PRESCRIPTION NONNEGATIVE-INTEGER-QUOTIENT))
 (20 16 (:REWRITE DEFAULT-UNARY-MINUS))
 (16 16 (:TYPE-PRESCRIPTION MK-G-ITE))
 (16 16 (:TYPE-PRESCRIPTION LEN))
 (16 8 (:TYPE-PRESCRIPTION GL::MK-G-BDD-ITE))
 (14 7 (:REWRITE GL::TAG-WHEN-GLCP-CONFIG-P))
 (14 6 (:REWRITE DEFAULT-CDR))
 (14 2 (:DEFINITION LEN))
 (12 12 (:REWRITE GL::BFR-ASSUME-CORRECT))
 (12 4 (:REWRITE COMMUTATIVITY-OF-*))
 (10 10 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (10 2 (:REWRITE DEFAULT-CAR))
 (8 8 (:TYPE-PRESCRIPTION SET::SETP-TYPE))
 (8 8 (:REWRITE ZP-OPEN))
 (8 8 (:REWRITE DEFAULT-*-2))
 (8 8 (:REWRITE DEFAULT-*-1))
 (8 8 (:DEFINITION IFIX))
 (8 4 (:REWRITE ZIP-OPEN))
 (8 4 (:REWRITE SET::NONEMPTY-MEANS-SET))
 (6 2 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
 (4 4 (:TYPE-PRESCRIPTION SET::EMPTY-TYPE))
 (4 4 (:REWRITE SET::IN-SET))
 (4 4 (:REWRITE DEFAULT-NUMERATOR))
 (4 4 (:REWRITE DEFAULT-DENOMINATOR))
 (2 2 (:LINEAR INDEX-OF-<-LEN))
 )
(GL-THM::INTEGER-LENGTH-DEPENDENCIES
 (136 49 (:REWRITE EQUAL-OF-BOOLEANS-REWRITE))
 (120 2 (:DEFINITION INTEGER-LENGTH))
 (106 2 (:DEFINITION FLOOR))
 (103 103 (:REWRITE GL::TAG-WHEN-ATOM))
 (92 92 (:TYPE-PRESCRIPTION BOOLEANP))
 (64 4 (:DEFINITION NONNEGATIVE-INTEGER-QUOTIENT))
 (63 6 (:REWRITE GL::GOBJ-DEPENDS-ON-OF-G-BOOLEAN->BOOL))
 (63 6 (:REWRITE GL::GOBJ-DEPENDS-ON-CDR-OF-GOBJ))
 (63 6 (:REWRITE GL::GOBJ-DEPENDS-ON-CAR-OF-GOBJ))
 (36 18 (:REWRITE GL::BFR-HYP-FIX-WHEN-HYP$AP))
 (30 6 (:REWRITE GL::GOBJ-DEPENDS-ON-CAR-OF-GOBJ-LIST))
 (28 19 (:REWRITE DEFAULT-+-2))
 (22 1 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
 (21 19 (:REWRITE DEFAULT-+-1))
 (20 20 (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-ATOM-LISTP))
 (20 6 (:REWRITE COMMUTATIVITY-OF-+))
 (18 18 (:TYPE-PRESCRIPTION GL::HYP$AP))
 (18 18 (:TYPE-PRESCRIPTION GL::GOBJ-LIST-DEPENDS-ON))
 (17 1 (:REWRITE LIST-FIX-WHEN-LEN-ZERO))
 (13 1 (:DEFINITION TRUE-LISTP))
 (12 6 (:REWRITE GL::PBFR-DEPENDS-ON-WHEN-BOOLEANP))
 (12 4 (:DEFINITION NFIX))
 (12 2 (:REWRITE SET::SETS-ARE-TRUE-LISTS-CHEAP))
 (10 10 (:TYPE-PRESCRIPTION NONNEGATIVE-INTEGER-QUOTIENT))
 (10 10 (:REWRITE DEFAULT-<-2))
 (10 10 (:REWRITE DEFAULT-<-1))
 (10 8 (:REWRITE DEFAULT-UNARY-MINUS))
 (8 8 (:TYPE-PRESCRIPTION LEN))
 (8 8 (:REWRITE DEFAULT-CDR))
 (7 1 (:DEFINITION LEN))
 (6 6 (:REWRITE DEFAULT-CAR))
 (6 2 (:REWRITE COMMUTATIVITY-OF-*))
 (5 5 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (4 4 (:TYPE-PRESCRIPTION SET::SETP-TYPE))
 (4 4 (:REWRITE DEFAULT-*-2))
 (4 4 (:REWRITE DEFAULT-*-1))
 (4 4 (:DEFINITION IFIX))
 (4 2 (:REWRITE ZIP-OPEN))
 (4 2 (:REWRITE SET::NONEMPTY-MEANS-SET))
 (3 3 (:TYPE-PRESCRIPTION GL::GL-CONS))
 (3 1 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
 (2 2 (:TYPE-PRESCRIPTION SET::EMPTY-TYPE))
 (2 2 (:REWRITE ZP-OPEN))
 (2 2 (:REWRITE SET::IN-SET))
 (2 2 (:REWRITE DEFAULT-NUMERATOR))
 (2 2 (:REWRITE DEFAULT-DENOMINATOR))
 (1 1 (:TYPE-PRESCRIPTION MK-G-INTEGER))
 (1 1 (:LINEAR INDEX-OF-<-LEN))
 )
(GL::NON-INTEGERP-INTEGER-LENGTH)
(GL::EVAL-G-BASE-BOOLEANP
 (4 1 (:REWRITE EQUAL-OF-BOOLEANS-REWRITE))
 )
(GL::GENERAL-CONCRETE-OBJ-INTEGER
 (66 66 (:TYPE-PRESCRIPTION GL::GENERAL-CONCRETEP))
 (44 22 (:TYPE-PRESCRIPTION GL::GENERAL-CONCRETEP-NOT-GENERAL-INTEGERP))
 (44 22 (:TYPE-PRESCRIPTION GL::GENERAL-CONCRETEP-NOT-GENERAL-CONSP))
 (44 22 (:TYPE-PRESCRIPTION GL::GENERAL-CONCRETEP-NOT-GENERAL-BOOLEANP))
 )
(GL::EVAL-G-BASE-INTEGER
 (1 1 (:REWRITE GL::GENERAL-CONCRETEP-OF-ATOMIC-CONSTANTS))
 (1 1 (:REWRITE GL::EVAL-G-BASE-BOOLEANP))
 )
(GL-THM::|COMMON-LISP::INTEGER-LENGTH$-CORRECT|
 (549 349 (:REWRITE DEFAULT-CAR))
 (365 101 (:REWRITE GL::GENERAL-CONCRETE-OBJ-CORRECT-FOR-EVAL-G-BASE))
 (308 11 (:DEFINITION GL::BFR-LIST->S))
 (271 271 (:TYPE-PRESCRIPTION BOOLEANP))
 (228 78 (:REWRITE EQUAL-OF-BOOLEANS-REWRITE))
 (211 101 (:REWRITE GL::EVAL-G-BASE-BOOLEANP))
 (200 200 (:TYPE-PRESCRIPTION GL::GENERAL-CONCRETEP))
 (170 85 (:REWRITE GL::GENERAL-INTEGER-BITS-CORRECT-FOR-EVAL-G-BASE))
 (170 85 (:REWRITE GL::GENERAL-CONSP-CORRECT-FOR-EVAL-G-BASE))
 (170 85 (:REWRITE GL::GENERAL-BOOLEAN-VALUE-CORRECT-FOR-EVAL-G-BASE))
 (144 144 (:REWRITE CONSP-WHEN-MEMBER-EQUAL-OF-ATOM-LISTP))
 (139 139 (:TYPE-PRESCRIPTION GL::GENERAL-INTEGERP))
 (132 11 (:DEFINITION LOGCONS$INLINE))
 (96 36 (:REWRITE GL::INTEGERP-OF-GEVAL-FOR-EVAL-G-BASE))
 (94 94 (:REWRITE GL::GENERAL-CONCRETEP-OF-ATOMIC-CONSTANTS))
 (91 91 (:TYPE-PRESCRIPTION GL::GENERAL-CONSP))
 (91 91 (:TYPE-PRESCRIPTION GL::GENERAL-BOOLEANP))
 (91 91 (:REWRITE GL::TAG-WHEN-ATOM))
 (86 43 (:REWRITE GL::BFR-EVAL-BOOLEANP))
 (84 42 (:REWRITE GL::BFR-HYP-FIX-WHEN-HYP$AP))
 (78 78 (:META CANCEL_TIMES-EQUAL-CORRECT))
 (78 78 (:META CANCEL_PLUS-EQUAL-CORRECT))
 (72 36 (:REWRITE GL::NOT-GENERAL-INTEGERP-NOT-INTEGERP-FOR-EVAL-G-BASE))
 (66 11 (:DEFINITION GL::FIRST/REST/END))
 (58 23 (:REWRITE GL::BFR-LIST->S-WHEN-S-ENDP))
 (48 3 (:REWRITE GL::BFR-ASSUME-OF-GTESTS-POSSIBLY-TRUE))
 (48 3 (:REWRITE GL::BFR-ASSUME-OF-GTESTS-POSSIBLY-FALSE))
 (44 44 (:TYPE-PRESCRIPTION GL::BFR-LIST->S))
 (42 42 (:TYPE-PRESCRIPTION GL::HYP$AP))
 (34 34 (:TYPE-PRESCRIPTION GL::S-ENDP$INLINE))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-ZEROP-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-TRUNCATE-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-REM-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-PLUSP-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-NULL-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-NOT-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-MOD-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-MINUSP-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-MAYBE-INTEGER-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-LOGAPP-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-LISTP-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-INT-SET-SIGN-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-IMPLIES-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-HONS-ASSOC-EQUAL-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-FLOOR-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-EQL-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-EQ-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-ENDP-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-BOOL-FIX$INLINE-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-BOOL->SIGN-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-BOOL->BIT$INLINE-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-BINARY-MINUS-FOR-GL-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-ATOM-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-=-CALL))
 (27 6 (:REWRITE GL::EVAL-G-BASE-EV-OF-/=-CALL))
 (26 4 (:REWRITE GL::GTESTS-NONNIL-CORRECT-FOR-EVAL-G-BASE))
 (24 12 (:REWRITE GL::GENERAL-INTEGERP-WHEN-GENERAL-CONCRETEP))
 (24 12 (:REWRITE DEFAULT-+-2))
 (24 6 (:REWRITE GL::GENERAL-CONCRETE-OBJ-CORRECT))
 (24 4 (:REWRITE GL::GTESTS-NONNIL-CORRECT))
 (23 12 (:REWRITE DEFAULT-+-1))
 (22 22 (:TYPE-PRESCRIPTION BOOL->BIT$INLINE))
 (22 11 (:REWRITE GL::SCDR-WHEN-S-ENDP))
 (22 11 (:REWRITE DEFAULT-*-2))
 (22 11 (:REWRITE BFIX-BITP))
 (22 11 (:DEFINITION IFIX))
 (22 11 (:DEFINITION GL::BOOL->SIGN))
 (22 1 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
 (21 15 (:REWRITE DEFAULT-CDR))
 (19 1 (:REWRITE LIST-FIX-WHEN-LEN-ZERO))
 (13 1 (:DEFINITION TRUE-LISTP))
 (12 12 (:REWRITE GL::GENERAL-INTEGERP-OF-ATOMIC-CONSTANTS))
 (12 12 (:REWRITE GL::GENERAL-INTEGERP-OF-ATOM))
 (12 6 (:REWRITE GL::GENERIC-GEVAL-WHEN-CONCRETE-GOBJECTP))
 (12 6 (:REWRITE GL::GENERAL-INTEGER-BITS-CORRECT))
 (12 6 (:REWRITE GL::GENERAL-CONSP-CORRECT))
 (12 6 (:REWRITE GL::GENERAL-BOOLEAN-VALUE-CORRECT))
 (12 6 (:REWRITE GL::BOOL-COND-ITEP-EVAL))
 (12 2 (:REWRITE SET::SETS-ARE-TRUE-LISTS-CHEAP))
 (11 11 (:TYPE-PRESCRIPTION GL::TRUE-LISTP-OF-SCDR))
 (11 11 (:REWRITE DEFAULT-*-1))
 (10 10 (:REWRITE ZP-OPEN))
 (10 10 (:REWRITE GL::BOOLEANP-OF-GEVAL-FOR-EVAL-G-BASE))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-UNARY---CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-SYMBOLP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-SYMBOL-PACKAGE-NAME-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-SYMBOL-NAME-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-STRINGP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-REALPART-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-RATIONALP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-PKG-WITNESS-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-NUMERATOR-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-LOGNOT-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-LOGBITP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-LAMBDA))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-INTERN-IN-PACKAGE-OF-SYMBOL-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-INTEGERP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-IMAGPART-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-IF-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-EQUAL-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-DENOMINATOR-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-CONSP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-CONS-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-COMPLEX-RATIONALP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-COERCE-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-CODE-CHAR-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-CHARACTERP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-CHAR-CODE-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-CDR-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-CAR-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-BOOLEANP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-BINARY-LOGXOR-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-BINARY-LOGIOR-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-BINARY-LOGEQV-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-BINARY-LOGAND-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-BINARY-+-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-BINARY-*-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-ASH-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-ACL2-NUMBERP-CALL))
 (9 3 (:REWRITE GL::EVAL-G-BASE-EV-OF-<-CALL))
 (8 8 (:TYPE-PRESCRIPTION LEN))
 (7 1 (:DEFINITION LEN))
 (6 6 (:TYPE-PRESCRIPTION GL::G-APPLY))
 (6 6 (:TYPE-PRESCRIPTION GL::CONCRETE-GOBJECTP))
 (6 6 (:TYPE-PRESCRIPTION GL::BOOL-COND-ITEP))
 (6 6 (:REWRITE GL::GENERIC-GEVAL-NON-CONS))
 (6 3 (:REWRITE GL::BFR-ASSUME->HYP-CORRECT))
 (5 5 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (4 4 (:TYPE-PRESCRIPTION SET::SETP-TYPE))
 (4 4 (:TYPE-PRESCRIPTION MK-G-INTEGER))
 (4 2 (:REWRITE SET::NONEMPTY-MEANS-SET))
 (3 3 (:REWRITE GL::BFR-ASSUME-CORRECT))
 (3 1 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
 (2 2 (:TYPE-PRESCRIPTION SET::EMPTY-TYPE))
 (2 2 (:REWRITE SET::IN-SET))
 (1 1 (:TYPE-PRESCRIPTION TRUE-LIST-FIX))
 (1 1 (:LINEAR INDEX-OF-<-LEN))
 )
