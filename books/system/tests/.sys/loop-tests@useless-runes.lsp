(RSQ
 (5 5 (:TYPE-PRESCRIPTION NONNEGATIVE-PRODUCT))
 )
(APPLY$-WARRANT-RSQ)
(APPLY$-WARRANT-RSQ-DEFINITION)
(APPLY$-WARRANT-RSQ-NECC)
(APPLY$-RSQ
 (8 8 (:TYPE-PRESCRIPTION NONNEGATIVE-PRODUCT))
 (8 2 (:REWRITE DEFAULT-*-2))
 (6 4 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (6 2 (:REWRITE DEFAULT-*-1))
 (4 4 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ACL2-NUMBERP))
 (2 2 (:TYPE-PRESCRIPTION APPLY$-PRIMP))
 (2 2 (:REWRITE RATIONAL-LISTP-IMPLIES-RATIONALP))
 (2 2 (:REWRITE DEFAULT-CAR))
 (2 1 (:REWRITE APPLY$-PRIMP-BADGE))
 (2 1 (:REWRITE APPLY$-PRIMITIVE))
 )
(ISQ
 (5 5 (:TYPE-PRESCRIPTION NONNEGATIVE-PRODUCT))
 )
(APPLY$-WARRANT-ISQ)
(APPLY$-WARRANT-ISQ-DEFINITION)
(APPLY$-WARRANT-ISQ-NECC)
(APPLY$-ISQ
 (8 8 (:TYPE-PRESCRIPTION NONNEGATIVE-PRODUCT))
 (8 2 (:REWRITE DEFAULT-*-2))
 (6 4 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (6 2 (:REWRITE DEFAULT-*-1))
 (4 4 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ACL2-NUMBERP))
 (2 2 (:TYPE-PRESCRIPTION APPLY$-PRIMP))
 (2 2 (:REWRITE RATIONAL-LISTP-IMPLIES-RATIONALP))
 (2 2 (:REWRITE DEFAULT-CAR))
 (2 1 (:REWRITE APPLY$-PRIMP-BADGE))
 (2 1 (:REWRITE APPLY$-PRIMITIVE))
 )
(SYMP)
(APPLY$-WARRANT-SYMP)
(APPLY$-WARRANT-SYMP-DEFINITION)
(APPLY$-WARRANT-SYMP-NECC)
(APPLY$-SYMP
 (4 4 (:TYPE-PRESCRIPTION APPLY$-PRIMP))
 (4 2 (:REWRITE APPLY$-PRIMP-BADGE))
 (4 2 (:REWRITE APPLY$-PRIMITIVE))
 (2 2 (:REWRITE SYMBOL-LISTP-IMPLIES-SYMBOLP))
 (2 2 (:REWRITE DEFAULT-CAR))
 )
(SSQ)
(APPLY$-WARRANT-SSQ)
(APPLY$-WARRANT-SSQ-DEFINITION)
(APPLY$-WARRANT-SSQ-NECC)
(APPLY$-SSQ
 (4 2 (:REWRITE DEFAULT-SYMBOL-NAME))
 (4 2 (:REWRITE DEFAULT-+-2))
 (2 2 (:TYPE-PRESCRIPTION APPLY$-PRIMP))
 (2 2 (:REWRITE SYMBOL-LISTP-IMPLIES-SYMBOLP))
 (2 2 (:REWRITE LEN-MEMBER-EQUAL-LOOP$-AS))
 (2 2 (:REWRITE DEFAULT-COERCE-2))
 (2 2 (:REWRITE DEFAULT-COERCE-1))
 (2 2 (:REWRITE DEFAULT-CDR))
 (2 2 (:REWRITE DEFAULT-CAR))
 (2 2 (:REWRITE DEFAULT-+-1))
 (2 1 (:REWRITE APPLY$-PRIMP-BADGE))
 (2 1 (:REWRITE APPLY$-PRIMITIVE))
 )
(FOO
 (2296 2 (:DEFINITION MEMBER-EQUAL))
 (2082 28 (:DEFINITION ALWAYS$))
 (1432 4 (:REWRITE PLAIN-UQI-INTEGER-LISTP))
 (1294 28 (:REWRITE APPLY$-SYMBOL-ARITY-1))
 (1252 8 (:DEFINITION APPLY$-BADGEP))
 (923 13 (:DEFINITION INTEGER-LISTP))
 (890 4 (:REWRITE INTEGER-LISTP-IMPLIES-ALWAYS$-INTEGERP))
 (860 16 (:REWRITE APPLY$-BADGEP-PROPERTIES . 1))
 (642 24 (:DEFINITION SUBSETP-EQUAL))
 (629 17 (:DEFINITION LOOP$-AS))
 (600 66 (:REWRITE SUBSETP-REFLEXIVE-LEMMA))
 (526 523 (:REWRITE DEFAULT-CDR))
 (459 438 (:REWRITE DEFAULT-CAR))
 (427 8 (:REWRITE APPLY$-BADGEP-PROPERTIES . 2))
 (226 4 (:REWRITE PLAIN-UQI-TRUE-LIST-LISTP))
 (221 34 (:DEFINITION CDR-LOOP$-AS-TUPLE))
 (221 34 (:DEFINITION CAR-LOOP$-AS-TUPLE))
 (198 198 (:TYPE-PRESCRIPTION SUBSETP-EQUAL))
 (174 8 (:REWRITE STRUCTURE-OF-LOOP$-AS-ELEMENTS-BRIDGE))
 (172 4 (:REWRITE PLAIN-UQI-ACL2-NUMBER-LISTP))
 (170 34 (:DEFINITION EMPTY-LOOP$-AS-TUPLEP))
 (162 20 (:DEFINITION RATIONAL-LISTP))
 (160 4 (:REWRITE PLAIN-UQI-SYMBOL-LISTP))
 (160 4 (:REWRITE PLAIN-UQI-RATIONAL-LISTP))
 (144 4 (:REWRITE PLAIN-UQI-RATIONAL-LIST-LISTP))
 (143 12 (:DEFINITION NATP))
 (140 140 (:TYPE-PRESCRIPTION ALWAYS$))
 (132 4 (:REWRITE FANCY-UQI-RATIONAL-LISTP-2))
 (132 4 (:REWRITE FANCY-UQI-RATIONAL-LISTP-1))
 (120 24 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-1))
 (96 24 (:REWRITE O-P-O-INFP-CAR))
 (90 40 (:REWRITE DEFAULT-+-2))
 (87 87 (:REWRITE TAMEP-TRUE-CAR/CDR-NESTP))
 (84 12 (:DEFINITION SYMBOL-LISTP))
 (84 4 (:REWRITE TRUE-LIST-LISTP-IMPLIES-ALWAYS$-TRUE-LISTP))
 (84 4 (:REWRITE FANCY-UQI-TRUE-LIST-2))
 (84 4 (:REWRITE FANCY-UQI-TRUE-LIST-1))
 (84 4 (:REWRITE FANCY-UQI-IDENTITY-2))
 (84 4 (:REWRITE FANCY-UQI-IDENTITY-1))
 (72 72 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-3))
 (70 32 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (69 69 (:TYPE-PRESCRIPTION EV$-LIST))
 (66 66 (:REWRITE TRANSITIVITY-OF-SUBSETP-EQUAL))
 (60 60 (:TYPE-PRESCRIPTION SYMBOL-LISTP))
 (60 60 (:TYPE-PRESCRIPTION APPLY$-BADGEP))
 (58 40 (:REWRITE DEFAULT-+-1))
 (55 13 (:REWRITE DEFAULT-*-2))
 (54 54 (:REWRITE SUBSETP-IMPLIES-MEMBER))
 (54 54 (:REWRITE RATIONAL-LISTP-IMPLIES-RATIONALP))
 (48 48 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-2))
 (48 4 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ALWAYS$-ACL2-NUMBERP))
 (45 18 (:LINEAR APPLY$-BADGEP-PROPERTIES . 1))
 (40 4 (:REWRITE SYMBOL-LISTP-IMPLIES-ALWAYS$-SYMBOLP))
 (40 4 (:REWRITE RATIONAL-LISTP-IMPLIES-ALWAYS$-RATIONALP))
 (40 4 (:REWRITE FANCY-UQI-SYMBOL-2))
 (40 4 (:REWRITE FANCY-UQI-SYMBOL-1))
 (38 13 (:REWRITE DEFAULT-*-1))
 (36 8 (:DEFINITION WEAK-APPLY$-BADGE-P))
 (36 6 (:DEFINITION ALL-NILS))
 (36 4 (:DEFINITION ACL2-NUMBER-LISTP))
 (32 32 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ACL2-NUMBERP))
 (30 30 (:TYPE-PRESCRIPTION ALL-NILS))
 (30 12 (:REWRITE APPLY$-BADGEP-PROPERTIES . 3))
 (30 3 (:REWRITE FANCY-UQI-INTEGER-2))
 (29 29 (:REWRITE INTEGER-LISTP-IMPLIES-INTEGERP))
 (28 28 (:REWRITE APPLY$-CONSP-ARITY-1))
 (28 28 (:REWRITE ALWAYS$-P-LST-IMPLIES-P-ELEMENT))
 (24 24 (:REWRITE O-P-DEF-O-FINP-1))
 (23 23 (:REWRITE SYMBOL-LISTP-IMPLIES-SYMBOLP))
 (23 4 (:REWRITE FANCY-UQI-ACL2-NUMBER-2))
 (20 4 (:REWRITE FANCY-UQI-ACL2-NUMBER-1))
 (16 8 (:REWRITE DEFAULT-SYMBOL-NAME))
 (15 15 (:LINEAR BOUNDS-POSITION-EQUAL-AC))
 (15 15 (:LINEAR BOUNDS-POSITION-EQUAL))
 (15 6 (:LINEAR APPLY$-BADGEP-PROPERTIES . 2))
 (12 12 (:REWRITE DEFAULT-<-2))
 (12 12 (:REWRITE DEFAULT-<-1))
 (9 3 (:REWRITE FANCY-UQI-RATIONAL-1))
 (8 8 (:REWRITE DEFAULT-COERCE-2))
 (8 8 (:REWRITE DEFAULT-COERCE-1))
 (8 8 (:DEFINITION IDENTITY))
 (6 6 (:REWRITE APPLY$-WARRANT-SSQ-NECC))
 (6 6 (:REWRITE APPLY$-WARRANT-RSQ-NECC))
 (6 6 (:REWRITE APPLY$-WARRANT-ISQ-NECC))
 (4 4 (:REWRITE PLAIN-UQI-ALWAYS$))
 (2 2 (:REWRITE FOLD-CONSTS-IN-+))
 (2 2 (:REWRITE FANCY-UQI-ALWAYS$-2))
 (2 2 (:REWRITE FANCY-UQI-ALWAYS$-1))
 )
(TEST)
(TEST
 (56461 290 (:DEFINITION APPLY$-BADGEP))
 (56150 694 (:DEFINITION ALWAYS$))
 (36908 583 (:REWRITE APPLY$-BADGEP-PROPERTIES . 1))
 (34038 860 (:DEFINITION SUBSETP-EQUAL))
 (30344 666 (:REWRITE APPLY$-SYMBOL-ARITY-1))
 (26254 2333 (:REWRITE SUBSETP-REFLEXIVE-LEMMA))
 (16873 16519 (:REWRITE DEFAULT-CDR))
 (13288 276 (:REWRITE APPLY$-BADGEP-PROPERTIES . 2))
 (13067 6 (:DEFINITION WHEN$+))
 (13036 10789 (:REWRITE DEFAULT-CAR))
 (11495 46 (:DEFINITION UNTIL$+))
 (11136 1244 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-1))
 (10651 61 (:REWRITE FANCY-UQI-INTEGER-2))
 (9281 638 (:LINEAR APPLY$-BADGEP-PROPERTIES . 1))
 (7466 1890 (:DEFINITION MAKE-LIST-AC))
 (6935 6935 (:TYPE-PRESCRIPTION SUBSETP-EQUAL))
 (5568 928 (:DEFINITION TAILS))
 (5430 150 (:REWRITE PLAIN-UQI-SYMBOL-LISTP))
 (5189 1089 (:REWRITE O-P-O-INFP-CAR))
 (4999 455 (:DEFINITION FROM-TO-BY-DOWN-OPENER))
 (4884 150 (:REWRITE PLAIN-UQI-RATIONAL-LISTP))
 (4746 150 (:REWRITE PLAIN-UQI-ACL2-NUMBER-LISTP))
 (4595 155 (:REWRITE PLAIN-UQI-RATIONAL-LIST-LISTP))
 (4429 4429 (:REWRITE TAMEP-TRUE-CAR/CDR-NESTP))
 (4086 170 (:REWRITE STRUCTURE-OF-LOOP$-AS-ELEMENTS-BRIDGE))
 (4011 3193 (:REWRITE DEFAULT-+-2))
 (3732 3732 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-3))
 (3345 3345 (:REWRITE SUBSETP-IMPLIES-MEMBER))
 (3279 3193 (:REWRITE DEFAULT-+-1))
 (2595 313 (:DEFINITION SYMBOL-LISTP))
 (2488 2488 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-2))
 (2366 678 (:REWRITE APPLY$-CONSP-ARITY-1))
 (2333 2333 (:REWRITE TRANSITIVITY-OF-SUBSETP-EQUAL))
 (2204 2204 (:TYPE-PRESCRIPTION APPLY$-BADGEP))
 (2187 1736 (:REWRITE DEFAULT-<-2))
 (2000 1736 (:REWRITE DEFAULT-<-1))
 (1994 190 (:REWRITE SYMBOL-LISTP-IMPLIES-ALWAYS$-SYMBOLP))
 (1922 1089 (:REWRITE O-P-DEF-O-FINP-1))
 (1883 197 (:DEFINITION ACL2-NUMBER-LISTP))
 (1804 1804 (:REWRITE ZP-OPEN))
 (1792 12 (:DEFINITION UNTIL$))
 (1763 164 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ALWAYS$-ACL2-NUMBERP))
 (1734 177 (:REWRITE RATIONAL-LISTP-IMPLIES-ALWAYS$-RATIONALP))
 (1439 1439 (:TYPE-PRESCRIPTION LOOP$-AS))
 (1335 97 (:REWRITE DEFAULT-COERCE-2))
 (1302 290 (:DEFINITION WEAK-APPLY$-BADGE-P))
 (1290 215 (:DEFINITION ALL-NILS))
 (1256 492 (:REWRITE APPLY$-BADGEP-PROPERTIES . 3))
 (1177 1177 (:REWRITE RATIONAL-LISTP-IMPLIES-RATIONALP))
 (1173 501 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (1075 1075 (:TYPE-PRESCRIPTION ALL-NILS))
 (913 913 (:REWRITE INTEGER-LISTP-IMPLIES-INTEGERP))
 (908 908 (:REWRITE ALWAYS$-P-LST-IMPLIES-P-ELEMENT))
 (836 70 (:REWRITE FANCY-UQI-SYMBOL-1))
 (780 61 (:REWRITE FANCY-UQI-RATIONAL-1))
 (746 746 (:TYPE-PRESCRIPTION O-FINP))
 (629 70 (:REWRITE FANCY-UQI-ACL2-NUMBER-2))
 (566 215 (:LINEAR APPLY$-BADGEP-PROPERTIES . 2))
 (551 551 (:LINEAR BOUNDS-POSITION-EQUAL-AC))
 (551 551 (:LINEAR BOUNDS-POSITION-EQUAL))
 (485 485 (:REWRITE SYMBOL-LISTP-IMPLIES-SYMBOLP))
 (258 97 (:DEFINITION IDENTITY))
 (196 68 (:REWRITE DEFAULT-SYMBOL-NAME))
 (169 13 (:REWRITE PLAIN-UQI-INTEGER-LISTP-TAILS))
 (140 140 (:REWRITE PLAIN-UQI-ALWAYS$))
 (110 110 (:META RELINK-FANCY-SCION-CORRECT))
 (96 96 (:REWRITE DEFAULT-COERCE-1))
 (48 48 (:REWRITE DEFAULT-*-2))
 (48 48 (:REWRITE DEFAULT-*-1))
 (45 45 (:REWRITE FANCY-UQI-ALWAYS$-2))
 (45 45 (:REWRITE FANCY-UQI-ALWAYS$-1))
 (42 42 (:TYPE-PRESCRIPTION UNTIL$+))
 (16 16 (:REWRITE FOLD-CONSTS-IN-+))
 (16 16 (:REWRITE DEFAULT-UNARY-MINUS))
 (4 2 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
 )
(BOOHOO
 (8414 37 (:DEFINITION MEMBER-EQUAL))
 (5650 29 (:DEFINITION APPLY$-BADGEP))
 (5259 42 (:DEFINITION ALWAYS$))
 (4944 1 (:DEFINITION WHEN$+))
 (4938 14 (:REWRITE PLAIN-UQI-INTEGER-LISTP))
 (3374 88 (:DEFINITION SUBSETP-EQUAL))
 (3229 28 (:DEFINITION INTEGER-LISTP))
 (3145 14 (:REWRITE INTEGER-LISTP-IMPLIES-ALWAYS$-INTEGERP))
 (3052 59 (:REWRITE APPLY$-BADGEP-PROPERTIES . 1))
 (2996 43 (:REWRITE APPLY$-SYMBOL-ARITY-1))
 (2645 241 (:REWRITE SUBSETP-REFLEXIVE-LEMMA))
 (1764 294 (:DEFINITION TAILS))
 (1627 1574 (:REWRITE DEFAULT-CDR))
 (1514 29 (:REWRITE APPLY$-BADGEP-PROPERTIES . 2))
 (1404 65 (:LINEAR APPLY$-BADGEP-PROPERTIES . 1))
 (1253 15 (:REWRITE DEFAULT-COERCE-2))
 (1176 294 (:DEFINITION MAKE-LIST-AC))
 (1153 947 (:REWRITE DEFAULT-CAR))
 (1076 100 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-1))
 (721 721 (:TYPE-PRESCRIPTION SUBSETP-EQUAL))
 (678 678 (:REWRITE TAMEP-TRUE-CAR/CDR-NESTP))
 (672 14 (:REWRITE PLAIN-UQI-TRUE-LIST-LISTP))
 (638 119 (:REWRITE O-P-O-INFP-CAR))
 (596 65 (:DEFINITION TRUE-LISTP))
 (565 18 (:REWRITE STRUCTURE-OF-LOOP$-AS-ELEMENTS-BRIDGE))
 (484 389 (:REWRITE DEFAULT-+-2))
 (483 14 (:REWRITE PLAIN-UQI-ACL2-NUMBER-LISTP))
 (441 14 (:REWRITE PLAIN-UQI-SYMBOL-LISTP))
 (441 14 (:REWRITE PLAIN-UQI-RATIONAL-LISTP))
 (389 389 (:REWRITE DEFAULT-+-1))
 (385 14 (:REWRITE PLAIN-UQI-RATIONAL-LIST-LISTP))
 (300 300 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-3))
 (294 294 (:REWRITE ZP-OPEN))
 (294 14 (:REWRITE TRUE-LIST-LISTP-IMPLIES-ALWAYS$-TRUE-LISTP))
 (281 119 (:REWRITE O-P-DEF-O-FINP-1))
 (280 28 (:DEFINITION ACL2-NUMBER-LISTP))
 (241 241 (:REWRITE TRANSITIVITY-OF-SUBSETP-EQUAL))
 (241 241 (:REWRITE SUBSETP-IMPLIES-MEMBER))
 (238 238 (:TYPE-PRESCRIPTION O-P))
 (224 28 (:DEFINITION SYMBOL-LISTP))
 (219 219 (:TYPE-PRESCRIPTION APPLY$-BADGEP))
 (204 9 (:REWRITE FANCY-UQI-TRUE-LIST-2))
 (200 200 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-2))
 (171 86 (:REWRITE DEFAULT-<-2))
 (168 14 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ALWAYS$-ACL2-NUMBERP))
 (144 144 (:TYPE-PRESCRIPTION O-FINP))
 (140 140 (:TYPE-PRESCRIPTION SYMBOL-LISTP))
 (140 140 (:TYPE-PRESCRIPTION INTEGER-LISTP))
 (140 140 (:TYPE-PRESCRIPTION ACL2-NUMBER-LISTP))
 (140 14 (:REWRITE SYMBOL-LISTP-IMPLIES-ALWAYS$-SYMBOLP))
 (140 14 (:REWRITE RATIONAL-LISTP-IMPLIES-ALWAYS$-RATIONALP))
 (134 29 (:DEFINITION WEAK-APPLY$-BADGE-P))
 (132 54 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (132 22 (:DEFINITION ALL-NILS))
 (122 122 (:REWRITE RATIONAL-LISTP-IMPLIES-RATIONALP))
 (122 86 (:REWRITE DEFAULT-<-1))
 (120 44 (:REWRITE APPLY$-BADGEP-PROPERTIES . 3))
 (110 110 (:TYPE-PRESCRIPTION ALL-NILS))
 (98 7 (:REWRITE FANCY-UQI-ACL2-NUMBER-2))
 (98 7 (:REWRITE FANCY-UQI-ACL2-NUMBER-1))
 (90 90 (:REWRITE INTEGER-LISTP-IMPLIES-INTEGERP))
 (84 7 (:REWRITE FANCY-UQI-SYMBOL-2))
 (84 7 (:REWRITE FANCY-UQI-SYMBOL-1))
 (84 7 (:REWRITE FANCY-UQI-RATIONAL-2))
 (84 7 (:REWRITE FANCY-UQI-RATIONAL-1))
 (84 7 (:REWRITE FANCY-UQI-INTEGER-2))
 (84 7 (:REWRITE FANCY-UQI-INTEGER-1))
 (64 14 (:REWRITE FANCY-UQI-IDENTITY-2))
 (60 22 (:LINEAR APPLY$-BADGEP-PROPERTIES . 2))
 (56 56 (:LINEAR BOUNDS-POSITION-EQUAL-AC))
 (56 56 (:LINEAR BOUNDS-POSITION-EQUAL))
 (55 14 (:REWRITE FANCY-UQI-IDENTITY-1))
 (54 54 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ACL2-NUMBERP))
 (47 47 (:REWRITE ALWAYS$-P-LST-IMPLIES-P-ELEMENT))
 (43 43 (:REWRITE APPLY$-CONSP-ARITY-1))
 (35 35 (:REWRITE SYMBOL-LISTP-IMPLIES-SYMBOLP))
 (28 28 (:REWRITE NO-ELEMENT-TAILS-EMPTY))
 (14 14 (:REWRITE PLAIN-UQI-ALWAYS$))
 (14 14 (:REWRITE DEFAULT-COERCE-1))
 (8 2 (:REWRITE FOLD-CONSTS-IN-+))
 (7 7 (:REWRITE FANCY-UQI-ALWAYS$-2))
 (7 7 (:REWRITE FANCY-UQI-ALWAYS$-1))
 (3 3 (:META RELINK-FANCY-SCION-CORRECT))
 )
(BOOHOO-LEMMA
 (1 1 (:TYPE-PRESCRIPTION TRUE-LISTP))
 )
(BOOHOO
 (4944 1 (:DEFINITION WHEN$+))
 (4170 33 (:DEFINITION MEMBER-EQUAL))
 (3094 13 (:DEFINITION APPLY$-BADGEP))
 (2231 18 (:DEFINITION ALWAYS$))
 (2090 40 (:DEFINITION SUBSETP-EQUAL))
 (2082 6 (:REWRITE PLAIN-UQI-INTEGER-LISTP))
 (1445 109 (:REWRITE SUBSETP-REFLEXIVE-LEMMA))
 (1410 235 (:DEFINITION TAILS))
 (1361 12 (:DEFINITION INTEGER-LISTP))
 (1325 6 (:REWRITE INTEGER-LISTP-IMPLIES-ALWAYS$-INTEGERP))
 (1296 29 (:LINEAR APPLY$-BADGEP-PROPERTIES . 1))
 (1292 19 (:REWRITE APPLY$-SYMBOL-ARITY-1))
 (1288 27 (:REWRITE APPLY$-BADGEP-PROPERTIES . 1))
 (1253 15 (:REWRITE DEFAULT-COERCE-2))
 (1028 981 (:REWRITE DEFAULT-CDR))
 (940 235 (:DEFINITION MAKE-LIST-AC))
 (854 660 (:REWRITE DEFAULT-CAR))
 (836 52 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-1))
 (678 678 (:REWRITE TAMEP-TRUE-CAR/CDR-NESTP))
 (638 13 (:REWRITE APPLY$-BADGEP-PROPERTIES . 2))
 (502 91 (:REWRITE O-P-O-INFP-CAR))
 (357 296 (:REWRITE DEFAULT-+-2))
 (356 12 (:REWRITE STRUCTURE-OF-LOOP$-AS-ELEMENTS-BRIDGE))
 (325 325 (:TYPE-PRESCRIPTION SUBSETP-EQUAL))
 (316 31 (:DEFINITION TRUE-LISTP))
 (296 296 (:REWRITE DEFAULT-+-1))
 (288 6 (:REWRITE PLAIN-UQI-TRUE-LIST-LISTP))
 (235 235 (:REWRITE ZP-OPEN))
 (229 91 (:REWRITE O-P-DEF-O-FINP-1))
 (207 6 (:REWRITE PLAIN-UQI-ACL2-NUMBER-LISTP))
 (189 6 (:REWRITE PLAIN-UQI-SYMBOL-LISTP))
 (189 6 (:REWRITE PLAIN-UQI-RATIONAL-LISTP))
 (182 182 (:TYPE-PRESCRIPTION O-P))
 (165 6 (:REWRITE PLAIN-UQI-RATIONAL-LIST-LISTP))
 (156 156 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-3))
 (137 137 (:REWRITE SUBSETP-IMPLIES-MEMBER))
 (126 6 (:REWRITE TRUE-LIST-LISTP-IMPLIES-ALWAYS$-TRUE-LISTP))
 (120 120 (:TYPE-PRESCRIPTION O-FINP))
 (120 12 (:DEFINITION ACL2-NUMBER-LISTP))
 (119 50 (:REWRITE DEFAULT-<-2))
 (109 109 (:REWRITE TRANSITIVITY-OF-SUBSETP-EQUAL))
 (104 104 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-2))
 (99 99 (:TYPE-PRESCRIPTION APPLY$-BADGEP))
 (96 12 (:DEFINITION SYMBOL-LISTP))
 (86 50 (:REWRITE DEFAULT-<-1))
 (84 30 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (72 6 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ALWAYS$-ACL2-NUMBERP))
 (64 64 (:REWRITE RATIONAL-LISTP-IMPLIES-RATIONALP))
 (62 13 (:DEFINITION WEAK-APPLY$-BADGE-P))
 (60 60 (:TYPE-PRESCRIPTION SYMBOL-LISTP))
 (60 60 (:TYPE-PRESCRIPTION INTEGER-LISTP))
 (60 60 (:TYPE-PRESCRIPTION ACL2-NUMBER-LISTP))
 (60 10 (:DEFINITION ALL-NILS))
 (60 6 (:REWRITE SYMBOL-LISTP-IMPLIES-ALWAYS$-SYMBOLP))
 (60 6 (:REWRITE RATIONAL-LISTP-IMPLIES-ALWAYS$-RATIONALP))
 (50 50 (:TYPE-PRESCRIPTION ALL-NILS))
 (48 20 (:REWRITE APPLY$-BADGEP-PROPERTIES . 3))
 (46 46 (:REWRITE INTEGER-LISTP-IMPLIES-INTEGERP))
 (42 3 (:REWRITE FANCY-UQI-ACL2-NUMBER-2))
 (42 3 (:REWRITE FANCY-UQI-ACL2-NUMBER-1))
 (40 10 (:REWRITE FANCY-UQI-IDENTITY-2))
 (36 10 (:REWRITE FANCY-UQI-IDENTITY-1))
 (36 3 (:REWRITE FANCY-UQI-SYMBOL-2))
 (36 3 (:REWRITE FANCY-UQI-SYMBOL-1))
 (36 3 (:REWRITE FANCY-UQI-RATIONAL-2))
 (36 3 (:REWRITE FANCY-UQI-RATIONAL-1))
 (36 3 (:REWRITE FANCY-UQI-INTEGER-2))
 (36 3 (:REWRITE FANCY-UQI-INTEGER-1))
 (30 30 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ACL2-NUMBERP))
 (28 14 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
 (26 26 (:LINEAR BOUNDS-POSITION-EQUAL-AC))
 (26 26 (:LINEAR BOUNDS-POSITION-EQUAL))
 (24 10 (:LINEAR APPLY$-BADGEP-PROPERTIES . 2))
 (23 23 (:REWRITE ALWAYS$-P-LST-IMPLIES-P-ELEMENT))
 (20 20 (:REWRITE NO-ELEMENT-TAILS-EMPTY))
 (19 19 (:REWRITE APPLY$-CONSP-ARITY-1))
 (15 15 (:REWRITE SYMBOL-LISTP-IMPLIES-SYMBOLP))
 (14 14 (:REWRITE DEFAULT-COERCE-1))
 (6 6 (:REWRITE PLAIN-UQI-ALWAYS$))
 (3 3 (:REWRITE FANCY-UQI-ALWAYS$-2))
 (3 3 (:REWRITE FANCY-UQI-ALWAYS$-1))
 (3 3 (:META RELINK-FANCY-SCION-CORRECT))
 )
(MY-MV)
(APPLY$-WARRANT-MY-MV)
(APPLY$-WARRANT-MY-MV-DEFINITION)
(APPLY$-WARRANT-MY-MV-NECC)
(APPLY$-MY-MV
 (2 2 (:TYPE-PRESCRIPTION APPLY$-PRIMP))
 (2 2 (:REWRITE DEFAULT-CAR))
 (2 1 (:REWRITE APPLY$-PRIMP-BADGE))
 (2 1 (:REWRITE APPLY$-PRIMITIVE))
 )
(LOOP-WITH-MY-MV-TARGET
 (4 3 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
 (3 3 (:TYPE-PRESCRIPTION BINARY-APPEND))
 (1 1 (:TYPE-PRESCRIPTION TRUE-LISTP))
 )
(BELOW-3P)
(BUG1
 (288 39 (:REWRITE APPLY$-PRIMITIVE))
 (210 39 (:META APPLY$-PRIM-META-FN-CORRECT))
 (121 11 (:REWRITE PLAIN-UQI-ACL2-NUMBER-LISTP))
 (99 11 (:REWRITE PLAIN-UQI-RATIONAL-LISTP))
 (99 11 (:REWRITE PLAIN-UQI-INTEGER-LISTP))
 (66 66 (:TYPE-PRESCRIPTION ALWAYS$))
 (54 11 (:REWRITE PLAIN-UQI-TRUE-LIST-LISTP))
 (50 11 (:REWRITE PLAIN-UQI-RATIONAL-LIST-LISTP))
 (41 41 (:REWRITE DEFAULT-CAR))
 (39 39 (:TYPE-PRESCRIPTION APPLY$-PRIMP))
 (39 39 (:REWRITE CAR-CONS))
 (39 39 (:REWRITE ALWAYS$-P-LST-IMPLIES-P-ELEMENT))
 (36 11 (:REWRITE PLAIN-UQI-SYMBOL-LISTP))
 (24 24 (:REWRITE RATIONAL-LISTP-IMPLIES-RATIONALP))
 (22 11 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (14 2 (:DEFINITION TRUE-LISTP))
 (14 2 (:DEFINITION RATIONAL-LISTP))
 (11 11 (:REWRITE SUBSETP-IMPLIES-MEMBER))
 (11 11 (:REWRITE PLAIN-UQI-ALWAYS$))
 (11 11 (:REWRITE INTEGER-LISTP-IMPLIES-INTEGERP))
 (11 11 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ACL2-NUMBERP))
 (8 8 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (8 8 (:TYPE-PRESCRIPTION RATIONAL-LISTP))
 (4 4 (:REWRITE TRUE-LIST-LISTP-IMPLIES-TRUE-LISTP))
 (4 4 (:REWRITE DEFAULT-CDR))
 (4 4 (:REWRITE BOOHOO-LEMMA))
 (2 2 (:REWRITE SYMBOL-LISTP-IMPLIES-SYMBOLP))
 )
(BUG2
 (3449 4 (:DEFINITION MEMBER-EQUAL))
 (2965 8 (:REWRITE PLAIN-UQI-INTEGER-LISTP))
 (2885 34 (:DEFINITION ALWAYS$))
 (2542 20 (:DEFINITION APPLY$-BADGEP))
 (1911 16 (:REWRITE INTEGER-LISTP-IMPLIES-ALWAYS$-INTEGERP))
 (1765 36 (:REWRITE APPLY$-BADGEP-PROPERTIES . 1))
 (1318 34 (:REWRITE APPLY$-SYMBOL-ARITY-1))
 (1284 48 (:DEFINITION SUBSETP-EQUAL))
 (1200 132 (:REWRITE SUBSETP-REFLEXIVE-LEMMA))
 (1188 42 (:REWRITE APPLY$-PRIMITIVE))
 (1104 36 (:META APPLY$-PRIM-META-FN-CORRECT))
 (865 16 (:REWRITE APPLY$-BADGEP-PROPERTIES . 2))
 (500 500 (:REWRITE DEFAULT-CDR))
 (416 8 (:REWRITE PLAIN-UQI-ACL2-NUMBER-LISTP))
 (396 396 (:TYPE-PRESCRIPTION SUBSETP-EQUAL))
 (368 8 (:REWRITE PLAIN-UQI-SYMBOL-LISTP))
 (368 8 (:REWRITE PLAIN-UQI-RATIONAL-LISTP))
 (303 24 (:DEFINITION NATP))
 (271 271 (:REWRITE DEFAULT-CAR))
 (240 48 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-1))
 (200 16 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ALWAYS$-ACL2-NUMBERP))
 (178 178 (:TYPE-PRESCRIPTION ALWAYS$))
 (168 16 (:REWRITE SYMBOL-LISTP-IMPLIES-ALWAYS$-SYMBOLP))
 (168 16 (:REWRITE RATIONAL-LISTP-IMPLIES-ALWAYS$-RATIONALP))
 (152 16 (:DEFINITION ACL2-NUMBER-LISTP))
 (144 144 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-3))
 (138 18 (:DEFINITION RATIONAL-LISTP))
 (136 68 (:REWRITE APPLY$-PRIMP-BADGE))
 (132 132 (:REWRITE TRANSITIVITY-OF-SUBSETP-EQUAL))
 (125 8 (:REWRITE PLAIN-UQI-TRUE-LIST-LISTP))
 (124 124 (:TYPE-PRESCRIPTION APPLY$-BADGEP))
 (120 16 (:DEFINITION SYMBOL-LISTP))
 (110 110 (:TYPE-PRESCRIPTION APPLY$-PRIMP))
 (105 105 (:REWRITE SUBSETP-IMPLIES-MEMBER))
 (99 36 (:LINEAR APPLY$-BADGEP-PROPERTIES . 1))
 (96 96 (:REWRITE MEMBER-EQUAL-NEWVAR-COMPONENTS-2))
 (93 12 (:DEFINITION LEN))
 (84 84 (:TYPE-PRESCRIPTION LEN))
 (80 80 (:TYPE-PRESCRIPTION SYMBOL-LISTP))
 (80 20 (:DEFINITION WEAK-APPLY$-BADGE-P))
 (78 39 (:DEFINITION TAILS))
 (74 8 (:REWRITE PLAIN-UQI-RATIONAL-LIST-LISTP))
 (72 12 (:DEFINITION ALL-NILS))
 (66 24 (:REWRITE APPLY$-BADGEP-PROPERTIES . 3))
 (60 60 (:TYPE-PRESCRIPTION ALL-NILS))
 (55 55 (:REWRITE INTEGER-LISTP-IMPLIES-INTEGERP))
 (54 6 (:REWRITE TRUE-LIST-LISTP-IMPLIES-ALWAYS$-TRUE-LISTP))
 (50 50 (:REWRITE RATIONAL-LISTP-IMPLIES-RATIONALP))
 (48 24 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (42 42 (:REWRITE ALWAYS$-P-LST-IMPLIES-P-ELEMENT))
 (37 4 (:DEFINITION TRUE-LISTP))
 (36 2 (:DEFINITION TRUE-LIST-LISTP))
 (34 34 (:REWRITE APPLY$-CONSP-ARITY-1))
 (33 12 (:LINEAR APPLY$-BADGEP-PROPERTIES . 2))
 (24 24 (:REWRITE SYMBOL-LISTP-IMPLIES-SYMBOLP))
 (24 24 (:REWRITE DEFAULT-<-2))
 (24 24 (:REWRITE DEFAULT-<-1))
 (24 24 (:REWRITE ACL2-NUMBER-LISTP-IMPLIES-ACL2-NUMBERP))
 (24 24 (:LINEAR BOUNDS-POSITION-EQUAL-AC))
 (24 24 (:LINEAR BOUNDS-POSITION-EQUAL))
 (24 12 (:REWRITE DEFAULT-+-2))
 (16 16 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (16 4 (:REWRITE O-P-O-INFP-CAR))
 (14 14 (:TYPE-PRESCRIPTION TRUE-LIST-LISTP))
 (12 12 (:REWRITE LEN-MEMBER-EQUAL-LOOP$-AS))
 (12 12 (:REWRITE DEFAULT-+-1))
 (8 8 (:TYPE-PRESCRIPTION O-P))
 (8 8 (:REWRITE TRUE-LIST-LISTP-IMPLIES-TRUE-LISTP))
 (8 8 (:REWRITE PLAIN-UQI-ALWAYS$))
 (4 4 (:REWRITE TRUE-LIST-LISTP-TAILS))
 (4 4 (:REWRITE O-P-DEF-O-FINP-1))
 (4 4 (:REWRITE ALWAYS-RATIONAL-LISTP-TAILS))
 (2 2 (:REWRITE CAR-CONS))
 (2 2 (:REWRITE BOOHOO-LEMMA))
 )
(BELOW-11P)
(BUG3)
(LOOP-TEST-1-USING-MY-MV)
(LOOP-TEST-2-USING-MY-MV)
