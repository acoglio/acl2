(CHARACTER-LISTP-MAKE-CHARACTER-LIST (17 15 (:REWRITE DEFAULT-CAR))
                                     (12 10 (:REWRITE DEFAULT-CDR)))
(SUBLIS-VAR1-FLG)
(SUBLIS-VAR1-FLG-PROPERTY
     (2800 1969 (:REWRITE DEFAULT-CDR))
     (2384 1795 (:REWRITE DEFAULT-CAR))
     (297 297
          (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
     (198 33
          (:REWRITE INTERN-IN-PACKAGE-OF-SYMBOL-IS-IDENTITY))
     (99 99 (:REWRITE DEFAULT-<-2))
     (99 99 (:REWRITE DEFAULT-<-1))
     (99 33 (:DEFINITION CHARACTER-LISTP))
     (66 66
         (:TYPE-PRESCRIPTION MEMBER-SYMBOL-NAME))
     (66 66
         (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
     (66 66 (:REWRITE DEFAULT-COERCE-2))
     (66 33 (:REWRITE DEFAULT-PKG-IMPORTS))
     (33 33
         (:TYPE-PRESCRIPTION STRINGP-SYMBOL-PACKAGE-NAME))
     (33 33 (:REWRITE DEFAULT-UNARY-MINUS))
     (33 33 (:REWRITE DEFAULT-UNARY-/))
     (33 33 (:REWRITE DEFAULT-SYMBOL-NAME))
     (33 33 (:REWRITE DEFAULT-REALPART))
     (33 33 (:REWRITE DEFAULT-NUMERATOR))
     (33 33
         (:REWRITE DEFAULT-INTERN-IN-PACKAGE-OF-SYMBOL))
     (33 33 (:REWRITE DEFAULT-IMAGPART))
     (33 33 (:REWRITE DEFAULT-DENOMINATOR))
     (33 33 (:REWRITE DEFAULT-COMPLEX-2))
     (33 33 (:REWRITE DEFAULT-COMPLEX-1))
     (33 33 (:REWRITE DEFAULT-COERCE-3))
     (33 33 (:REWRITE DEFAULT-COERCE-1))
     (33 33 (:REWRITE DEFAULT-CODE-CHAR))
     (33 33 (:REWRITE DEFAULT-CHAR-CODE))
     (33 33 (:REWRITE DEFAULT-+-2))
     (33 33 (:REWRITE DEFAULT-+-1))
     (33 33 (:REWRITE DEFAULT-*-2))
     (33 33 (:REWRITE DEFAULT-*-1)))
(PSEUDO-TERMP-CDR-ASSOC-EQUAL
     (140 137 (:REWRITE DEFAULT-CDR))
     (140 28 (:DEFINITION LEN))
     (127 124 (:REWRITE DEFAULT-CAR))
     (56 28 (:REWRITE DEFAULT-+-2))
     (28 28 (:REWRITE DEFAULT-+-1))
     (28 14 (:DEFINITION TRUE-LISTP))
     (23 23
         (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (22 22
         (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (21 7 (:DEFINITION SYMBOL-LISTP))
     (7 7 (:REWRITE DEFAULT-COERCE-2))
     (7 7 (:REWRITE DEFAULT-COERCE-1)))
(SUBLIS-VAR1-FLG-PRESERVES-LEN (53 34 (:REWRITE DEFAULT-CDR))
                               (30 16 (:REWRITE DEFAULT-CAR))
                               (26 13 (:REWRITE DEFAULT-+-2))
                               (13 13 (:REWRITE DEFAULT-+-1)))
(PSEUDO-TERMP-SUBLIS-VAR1-FLG
     (11656 8679 (:REWRITE DEFAULT-CDR))
     (9180 7044 (:REWRITE DEFAULT-CAR))
     (1310 1310
           (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (850 850
          (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (768 192 (:DEFINITION STRIP-CDRS))
     (454 234 (:REWRITE DEFAULT-+-2))
     (234 234 (:REWRITE DEFAULT-+-1))
     (138 138
          (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
     (84 14
         (:REWRITE INTERN-IN-PACKAGE-OF-SYMBOL-IS-IDENTITY))
     (74 74 (:REWRITE DEFAULT-COERCE-2))
     (60 60 (:REWRITE DEFAULT-COERCE-1))
     (48 44 (:REWRITE DEFAULT-<-1))
     (45 15 (:DEFINITION CHARACTER-LISTP))
     (44 44 (:REWRITE DEFAULT-<-2))
     (28 28
         (:TYPE-PRESCRIPTION MEMBER-SYMBOL-NAME))
     (28 28
         (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
     (28 14 (:REWRITE DEFAULT-PKG-IMPORTS))
     (14 14 (:REWRITE DEFAULT-UNARY-MINUS))
     (14 14 (:REWRITE DEFAULT-UNARY-/))
     (14 14 (:REWRITE DEFAULT-SYMBOL-NAME))
     (14 14 (:REWRITE DEFAULT-REALPART))
     (14 14 (:REWRITE DEFAULT-NUMERATOR))
     (14 14
         (:REWRITE DEFAULT-INTERN-IN-PACKAGE-OF-SYMBOL))
     (14 14 (:REWRITE DEFAULT-IMAGPART))
     (14 14 (:REWRITE DEFAULT-DENOMINATOR))
     (14 14 (:REWRITE DEFAULT-COMPLEX-2))
     (14 14 (:REWRITE DEFAULT-COMPLEX-1))
     (14 14 (:REWRITE DEFAULT-COERCE-3))
     (14 14 (:REWRITE DEFAULT-CODE-CHAR))
     (14 14 (:REWRITE DEFAULT-CHAR-CODE))
     (14 14 (:REWRITE DEFAULT-*-2))
     (14 14 (:REWRITE DEFAULT-*-1)))
(PSEUDO-TERMP-SUBLIS-VAR1
     (220 1 (:DEFINITION SUBLIS-VAR1))
     (99 1 (:DEFINITION CONS-TERM))
     (93 1 (:DEFINITION CONS-TERM1-MV2))
     (92 1 (:DEFINITION CONS-TERM1))
     (63 61 (:REWRITE DEFAULT-CDR))
     (62 62 (:DEFINITION KWOTE))
     (58 57 (:REWRITE DEFAULT-CAR))
     (40 8 (:DEFINITION LEN))
     (18 18
         (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
     (18 10 (:REWRITE DEFAULT-+-2))
     (12 3 (:DEFINITION MV-NTH))
     (12 2
         (:REWRITE INTERN-IN-PACKAGE-OF-SYMBOL-IS-IDENTITY))
     (10 10 (:REWRITE DEFAULT-+-1))
     (10 2 (:DEFINITION QUOTE-LISTP))
     (8 4 (:DEFINITION TRUE-LISTP))
     (6 6 (:TYPE-PRESCRIPTION SUBLIS-VAR1-LST))
     (6 6 (:REWRITE DEFAULT-COERCE-2))
     (6 6 (:REWRITE DEFAULT-<-2))
     (6 6 (:REWRITE DEFAULT-<-1))
     (6 2 (:DEFINITION SYMBOL-LISTP))
     (6 2 (:DEFINITION CHARACTER-LISTP))
     (5 5 (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (5 1 (:DEFINITION ASSOC-EQUAL))
     (4 4
        (:TYPE-PRESCRIPTION MEMBER-SYMBOL-NAME))
     (4 4
        (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (4 4
        (:REWRITE DEFAULT-SYMBOL-PACKAGE-NAME))
     (4 4 (:REWRITE DEFAULT-COERCE-1))
     (4 2 (:REWRITE DEFAULT-PKG-IMPORTS))
     (4 2 (:DEFINITION QUOTEP))
     (4 1 (:DEFINITION STRIP-CDRS))
     (3 3 (:TYPE-PRESCRIPTION CHARACTER-LISTP))
     (2 2 (:TYPE-PRESCRIPTION SUBLIS-VAR1))
     (2 2
        (:TYPE-PRESCRIPTION STRINGP-SYMBOL-PACKAGE-NAME))
     (2 2 (:TYPE-PRESCRIPTION QUOTE-LISTP))
     (2 2 (:REWRITE DEFAULT-UNARY-MINUS))
     (2 2 (:REWRITE DEFAULT-UNARY-/))
     (2 2 (:REWRITE DEFAULT-SYMBOL-NAME))
     (2 2 (:REWRITE DEFAULT-REALPART))
     (2 2 (:REWRITE DEFAULT-NUMERATOR))
     (2 2
        (:REWRITE DEFAULT-INTERN-IN-PACKAGE-OF-SYMBOL))
     (2 2 (:REWRITE DEFAULT-IMAGPART))
     (2 2 (:REWRITE DEFAULT-DENOMINATOR))
     (2 2 (:REWRITE DEFAULT-COMPLEX-2))
     (2 2 (:REWRITE DEFAULT-COMPLEX-1))
     (2 2 (:REWRITE DEFAULT-COERCE-3))
     (2 2 (:REWRITE DEFAULT-CODE-CHAR))
     (2 2 (:REWRITE DEFAULT-CHAR-CODE))
     (2 2 (:REWRITE DEFAULT-*-2))
     (2 2 (:REWRITE DEFAULT-*-1)))
(PSEUDO-TERMP-SUBLIS-VAR1-LST
     (23 1 (:DEFINITION SUBLIS-VAR1-LST))
     (20 5 (:DEFINITION MV-NTH))
     (13 10 (:REWRITE DEFAULT-CDR))
     (12 10 (:REWRITE DEFAULT-CAR))
     (8 8 (:TYPE-PRESCRIPTION SUBLIS-VAR1-LST))
     (6 6 (:TYPE-PRESCRIPTION SUBLIS-VAR1))
     (6 6
        (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (4 1 (:DEFINITION STRIP-CDRS))
     (3 3
        (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP)))
(PSEUDO-TERMP-IMPLIES-PSEUDO-TERM-LISTP-CDR
     (4 4 (:REWRITE DEFAULT-CDR))
     (1 1 (:REWRITE TERMP-IMPLIES-PSEUDO-TERMP))
     (1 1
        (:REWRITE TERM-LISTP-IMPLIES-PSEUDO-TERM-LISTP))
     (1 1 (:REWRITE DEFAULT-CAR)))
(PSEUDO-TERM-LISTP-IMPLIES-TRUE-LISTP)
