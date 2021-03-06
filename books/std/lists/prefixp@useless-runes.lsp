(PREFIXP)
(PREFIXP-WHEN-NOT-CONSP-LEFT)
(PREFIXP-OF-CONS-LEFT (8 8 (:REWRITE DEFAULT-CDR))
                      (8 8 (:REWRITE DEFAULT-CAR))
                      (6 6
                         (:REWRITE PREFIXP-WHEN-NOT-CONSP-LEFT)))
(PREFIXP-WHEN-NOT-CONSP-RIGHT (10 10 (:REWRITE DEFAULT-CDR)))
(PREFIXP-OF-CONS-RIGHT (15 15
                           (:REWRITE PREFIXP-WHEN-NOT-CONSP-RIGHT))
                       (8 8 (:REWRITE DEFAULT-CAR))
                       (5 5 (:REWRITE DEFAULT-CDR)))
(PREFIXP-OF-LIST-FIX-LEFT (88 11 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
                          (57 12 (:DEFINITION TRUE-LISTP))
                          (53 53 (:TYPE-PRESCRIPTION TRUE-LISTP))
                          (38 38 (:REWRITE DEFAULT-CDR))
                          (24 12 (:REWRITE DEFAULT-+-2))
                          (22 22 (:REWRITE DEFAULT-CAR))
                          (12 12 (:REWRITE DEFAULT-+-1))
                          (10 10 (:REWRITE LIST-FIX-WHEN-NOT-CONSP)))
(PREFIXP-OF-LIST-FIX-RIGHT (72 9 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
                           (47 10 (:DEFINITION TRUE-LISTP))
                           (43 43 (:TYPE-PRESCRIPTION TRUE-LISTP))
                           (30 30 (:REWRITE DEFAULT-CDR))
                           (20 20 (:REWRITE DEFAULT-CAR))
                           (20 10 (:REWRITE DEFAULT-+-2))
                           (10 10 (:REWRITE DEFAULT-+-1))
                           (8 8 (:REWRITE LIST-FIX-WHEN-NOT-CONSP)))
(LIST-EQUIV-IMPLIES-EQUAL-PREFIXP-1
     (24 2 (:REWRITE LIST-FIX-WHEN-LEN-ZERO))
     (16 2 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
     (10 10 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (10 4
         (:REWRITE PREFIXP-WHEN-NOT-CONSP-LEFT))
     (10 2 (:DEFINITION TRUE-LISTP))
     (10 2 (:DEFINITION LEN))
     (4 4 (:TYPE-PRESCRIPTION TRUE-LIST-FIX))
     (4 4
        (:REWRITE PREFIXP-WHEN-NOT-CONSP-RIGHT))
     (4 4 (:REWRITE DEFAULT-CDR))
     (4 2 (:REWRITE DEFAULT-+-2))
     (2 2 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
     (2 2 (:REWRITE DEFAULT-+-1))
     (2 2 (:REWRITE CONSP-OF-LIST-FIX)))
(LIST-EQUIV-IMPLIES-EQUAL-PREFIXP-2
     (24 2 (:REWRITE LIST-FIX-WHEN-LEN-ZERO))
     (16 2 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
     (10 10 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (10 4
         (:REWRITE PREFIXP-WHEN-NOT-CONSP-RIGHT))
     (10 2 (:DEFINITION TRUE-LISTP))
     (10 2 (:DEFINITION LEN))
     (4 4 (:TYPE-PRESCRIPTION TRUE-LIST-FIX))
     (4 4
        (:REWRITE PREFIXP-WHEN-NOT-CONSP-LEFT))
     (4 4 (:REWRITE DEFAULT-CDR))
     (4 2 (:REWRITE DEFAULT-+-2))
     (2 2 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
     (2 2 (:REWRITE DEFAULT-+-1))
     (2 2 (:REWRITE CONSP-OF-LIST-FIX)))
(LEN-WHEN-PREFIXP (56 28 (:REWRITE DEFAULT-+-2))
                  (28 28 (:REWRITE DEFAULT-+-1))
                  (24 12 (:REWRITE DEFAULT-<-1))
                  (23 12 (:REWRITE DEFAULT-<-2))
                  (18 18 (:REWRITE DEFAULT-CDR))
                  (17 17 (:REWRITE DEFAULT-CAR)))
(TAKE-WHEN-PREFIXP (883 33 (:REWRITE TAKE-OF-LEN-FREE))
                   (521 225 (:LINEAR LEN-WHEN-PREFIXP))
                   (273 143 (:REWRITE DEFAULT-+-2))
                   (229 23 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
                   (201 201 (:REWRITE DEFAULT-CDR))
                   (171 33 (:DEFINITION TRUE-LISTP))
                   (143 143 (:REWRITE DEFAULT-+-1))
                   (131 131 (:TYPE-PRESCRIPTION TRUE-LISTP))
                   (104 13 (:REWRITE ZP-OPEN))
                   (52 52 (:REWRITE DEFAULT-CAR))
                   (26 13 (:REWRITE DEFAULT-<-2))
                   (22 22 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
                   (13 13 (:REWRITE DEFAULT-<-1)))
(PREFIXP-OF-TAKE (142 11 (:REWRITE TAKE-OF-LEN-FREE))
                 (45 25 (:REWRITE DEFAULT-+-2))
                 (36 6 (:REWRITE CONSP-OF-TAKE))
                 (35 24 (:REWRITE DEFAULT-<-1))
                 (25 25 (:REWRITE DEFAULT-+-1))
                 (24 24 (:REWRITE DEFAULT-<-2))
                 (22 16 (:REWRITE ZP-OPEN))
                 (21 21 (:REWRITE DEFAULT-CDR))
                 (12 12 (:TYPE-PRESCRIPTION TRUE-LISTP-TAKE))
                 (6 6 (:REWRITE DEFAULT-CAR))
                 (1 1
                    (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP)))
(PREFIXP-REFLEXIVE (4 4
                      (:REWRITE PREFIXP-WHEN-NOT-CONSP-LEFT))
                   (4 4 (:REWRITE DEFAULT-CDR)))
(PREFIXP-OF-APPEND-ARG2 (1454 52 (:REWRITE TAKE-OF-LEN-FREE))
                        (676 342 (:LINEAR LEN-WHEN-PREFIXP))
                        (462 260 (:REWRITE DEFAULT-+-2))
                        (392 196
                             (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
                        (304 38 (:REWRITE ZP-OPEN))
                        (287 281 (:REWRITE DEFAULT-CAR))
                        (275 260 (:REWRITE DEFAULT-+-1))
                        (222 45 (:DEFINITION TRUE-LISTP))
                        (140 8 (:REWRITE LEN-OF-APPEND))
                        (76 38 (:REWRITE DEFAULT-<-2))
                        (44 44
                            (:REWRITE APPEND-ATOM-UNDER-LIST-EQUIV))
                        (38 38 (:REWRITE DEFAULT-<-1))
                        (28 28 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
                        (15 15 (:REWRITE CDR-OF-APPEND-WHEN-CONSP)))
(EQUAL-LEN-0 (12 12 (:LINEAR LEN-WHEN-PREFIXP))
             (9 5 (:REWRITE DEFAULT-+-2))
             (5 5 (:REWRITE DEFAULT-+-1))
             (4 4 (:REWRITE DEFAULT-CDR)))
(PREFIXP-OF-APPEND-WHEN-SAME-LENGTH
     (146 8 (:REWRITE TAKE-OF-LEN-FREE))
     (116 64 (:REWRITE DEFAULT-+-2))
     (104 104 (:REWRITE DEFAULT-CDR))
     (82 6 (:REWRITE LIST-FIX-WHEN-LEN-ZERO))
     (72 4 (:DEFINITION NTHCDR))
     (70 70 (:LINEAR LEN-WHEN-PREFIXP))
     (64 64 (:REWRITE DEFAULT-+-1))
     (56 56 (:REWRITE DEFAULT-CAR))
     (48 6 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
     (30 6 (:DEFINITION TRUE-LISTP))
     (20 20
         (:REWRITE APPEND-ATOM-UNDER-LIST-EQUIV))
     (16 8 (:REWRITE DEFAULT-<-2))
     (12 4 (:REWRITE COMMUTATIVITY-OF-+))
     (8 8 (:REWRITE DEFAULT-<-1))
     (6 6 (:REWRITE LIST-FIX-WHEN-NOT-CONSP)))
(PREFIXP-WHEN-EQUAL-LENGTHS (405 44 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
                            (291 57 (:DEFINITION TRUE-LISTP))
                            (235 235 (:TYPE-PRESCRIPTION TRUE-LISTP))
                            (230 115 (:REWRITE DEFAULT-+-2))
                            (156 156 (:REWRITE DEFAULT-CDR))
                            (115 115 (:REWRITE DEFAULT-+-1))
                            (50 25 (:REWRITE EQUAL-LEN-0))
                            (42 42 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
                            (31 31 (:REWRITE DEFAULT-CAR))
                            (25 25 (:DEFINITION ATOM))
                            (10 10
                                (:REWRITE PREFIXP-WHEN-NOT-CONSP-RIGHT))
                            (10 10
                                (:REWRITE PREFIXP-WHEN-NOT-CONSP-LEFT)))
(PREFIXP-TRANSITIVE (1244 26
                          (:REWRITE PREFIXP-WHEN-EQUAL-LENGTHS))
                    (696 136 (:DEFINITION LEN))
                    (621 153 (:LINEAR LEN-WHEN-PREFIXP))
                    (503 503 (:TYPE-PRESCRIPTION LEN))
                    (280 140 (:REWRITE DEFAULT-+-2))
                    (152 152 (:REWRITE DEFAULT-CDR))
                    (140 140 (:REWRITE DEFAULT-+-1))
                    (52 52 (:REWRITE DEFAULT-CAR))
                    (6 4 (:REWRITE EQUAL-LEN-0))
                    (2 2 (:DEFINITION ATOM)))
(PREFIXP-APPEND-APPEND (1093 183 (:DEFINITION LEN))
                       (665 36 (:REWRITE LEN-OF-APPEND))
                       (510 258 (:REWRITE DEFAULT-+-2))
                       (329 267 (:LINEAR LEN-WHEN-PREFIXP))
                       (319 258 (:REWRITE DEFAULT-+-1))
                       (311 258 (:REWRITE DEFAULT-CDR))
                       (295 48
                            (:REWRITE PREFIXP-WHEN-NOT-CONSP-LEFT))
                       (268 134
                            (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
                       (140 30 (:REWRITE COMMUTATIVITY-OF-+))
                       (134 134 (:TYPE-PRESCRIPTION BINARY-APPEND))
                       (130 5 (:DEFINITION NTHCDR))
                       (77 71 (:REWRITE DEFAULT-CAR))
                       (48 48
                           (:REWRITE PREFIXP-WHEN-NOT-CONSP-RIGHT))
                       (48 6 (:REWRITE LIST-FIX-WHEN-LEN-ZERO))
                       (40 5 (:REWRITE ZP-OPEN))
                       (38 38
                           (:REWRITE APPEND-ATOM-UNDER-LIST-EQUIV))
                       (27 6 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
                       (15 3 (:DEFINITION TRUE-LISTP))
                       (10 5 (:REWRITE DEFAULT-<-2))
                       (6 6 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
                       (6 6 (:REWRITE LIST-EQUIV-WHEN-ATOM-RIGHT))
                       (6 6 (:REWRITE LIST-EQUIV-WHEN-ATOM-LEFT))
                       (6 3 (:REWRITE EQUAL-LEN-0))
                       (5 5 (:REWRITE DEFAULT-<-1))
                       (4 4 (:REWRITE FOLD-CONSTS-IN-+))
                       (3 3 (:DEFINITION ATOM)))
(PREFIXP-NTHCDR-NTHCDR (559 23
                            (:REWRITE PREFIXP-WHEN-EQUAL-LENGTHS))
                       (267 20 (:REWRITE TAKE-OF-LEN-FREE))
                       (181 110 (:REWRITE DEFAULT-+-2))
                       (152 152 (:LINEAR LEN-WHEN-PREFIXP))
                       (110 110 (:REWRITE DEFAULT-+-1))
                       (45 21 (:REWRITE ZP-OPEN))
                       (24 16 (:REWRITE DEFAULT-<-1))
                       (24 8 (:REWRITE FOLD-CONSTS-IN-+))
                       (23 23 (:REWRITE PREFIXP-TRANSITIVE . 2))
                       (23 23 (:REWRITE PREFIXP-TRANSITIVE . 1))
                       (19 16 (:REWRITE DEFAULT-<-2))
                       (6 3 (:REWRITE EQUAL-LEN-0))
                       (3 3
                          (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
                       (3 3 (:DEFINITION ATOM)))
(PREFIXP-ONE-WAY-OR-ANOTHER (1370 272 (:LINEAR LEN-WHEN-PREFIXP))
                            (572 286 (:REWRITE DEFAULT-+-2))
                            (419 45 (:REWRITE PREFIXP-TRANSITIVE . 1))
                            (310 310 (:REWRITE DEFAULT-CDR))
                            (286 286 (:REWRITE DEFAULT-+-1))
                            (78 78 (:REWRITE DEFAULT-CAR))
                            (45 45 (:REWRITE PREFIXP-TRANSITIVE . 2))
                            (9 6 (:REWRITE EQUAL-LEN-0))
                            (3 3 (:DEFINITION ATOM)))
(NTH-WHEN-PREFIXP (318 15
                       (:REWRITE PREFIXP-WHEN-EQUAL-LENGTHS))
                  (189 98 (:REWRITE DEFAULT-+-2))
                  (98 98 (:REWRITE DEFAULT-+-1))
                  (82 82 (:REWRITE DEFAULT-CDR))
                  (34 34 (:REWRITE DEFAULT-CAR))
                  (22 15 (:REWRITE DEFAULT-<-2))
                  (16 15 (:REWRITE DEFAULT-<-1))
                  (15 15
                      (:REWRITE PREFIXP-WHEN-NOT-CONSP-RIGHT))
                  (15 15 (:REWRITE PREFIXP-TRANSITIVE . 2))
                  (15 15 (:REWRITE PREFIXP-TRANSITIVE . 1))
                  (15 15
                      (:REWRITE PREFIXP-ONE-WAY-OR-ANOTHER . 2))
                  (15 15
                      (:REWRITE PREFIXP-ONE-WAY-OR-ANOTHER . 1))
                  (9 9 (:REWRITE ZP-OPEN))
                  (4 3 (:REWRITE EQUAL-LEN-0))
                  (1 1
                     (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
                  (1 1 (:DEFINITION ATOM)))
(APPEND-WHEN-PREFIXP
     (1008 336
           (:TYPE-PRESCRIPTION TRUE-LISTP-NTHCDR-TYPE-PRESCRIPTION))
     (896 112
          (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
     (448 448 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (448 112 (:TYPE-PRESCRIPTION BINARY-APPEND))
     (153 5 (:REWRITE PREFIXP-WHEN-EQUAL-LENGTHS))
     (49 27 (:REWRITE DEFAULT-+-2))
     (34 34 (:REWRITE DEFAULT-CDR))
     (28 27 (:REWRITE DEFAULT-+-1))
     (22 22 (:LINEAR LEN-WHEN-PREFIXP))
     (16 2 (:REWRITE ZP-OPEN))
     (14 14 (:REWRITE DEFAULT-CAR))
     (5 5 (:REWRITE PREFIXP-TRANSITIVE . 2))
     (5 5 (:REWRITE PREFIXP-TRANSITIVE . 1))
     (5 5
        (:REWRITE PREFIXP-ONE-WAY-OR-ANOTHER . 2))
     (5 5
        (:REWRITE PREFIXP-ONE-WAY-OR-ANOTHER . 1))
     (4 2 (:REWRITE DEFAULT-<-2))
     (3 2 (:REWRITE EQUAL-LEN-0))
     (2 2 (:REWRITE DEFAULT-<-1))
     (1 1 (:DEFINITION ATOM)))
(SUBSETP-WHEN-PREFIXP (433 15
                           (:REWRITE PREFIXP-WHEN-EQUAL-LENGTHS))
                      (191 191 (:TYPE-PRESCRIPTION LEN))
                      (178 34 (:DEFINITION LEN))
                      (93 3 (:REWRITE SUBSETP-CONS-2))
                      (82 82 (:LINEAR LEN-WHEN-PREFIXP))
                      (72 36 (:REWRITE DEFAULT-+-2))
                      (69 28 (:REWRITE SUBSETP-TRANS2))
                      (63 63 (:REWRITE DEFAULT-CDR))
                      (60 2 (:REWRITE SUBSETP-OF-CONS))
                      (37 27 (:REWRITE SUBSETP-TRANS))
                      (36 36 (:REWRITE DEFAULT-+-1))
                      (35 5
                          (:REWRITE SUBSETP-IMPLIES-SUBSETP-CDR))
                      (30 30 (:REWRITE DEFAULT-CAR))
                      (24 3 (:DEFINITION MEMBER-EQUAL))
                      (23 23 (:REWRITE SUBSETP-WHEN-ATOM-RIGHT))
                      (17 17 (:TYPE-PRESCRIPTION MEMBER-EQUAL))
                      (16 6 (:REWRITE SUBSETP-MEMBER . 2))
                      (15 15 (:REWRITE PREFIXP-TRANSITIVE . 2))
                      (15 15 (:REWRITE PREFIXP-TRANSITIVE . 1))
                      (15 15
                          (:REWRITE PREFIXP-ONE-WAY-OR-ANOTHER . 2))
                      (15 15
                          (:REWRITE PREFIXP-ONE-WAY-OR-ANOTHER . 1))
                      (6 6 (:REWRITE SUBSETP-MEMBER . 1))
                      (3 2 (:REWRITE EQUAL-LEN-0))
                      (2 2 (:REWRITE SUBSETP-REFL))
                      (1 1 (:DEFINITION ATOM)))
(PREFIXP-OF-APPEND-ARG1 (1259 661 (:REWRITE DEFAULT-+-2))
                        (881 46 (:REWRITE TAKE-OF-LEN-FREE))
                        (880 794 (:REWRITE DEFAULT-CDR))
                        (730 661 (:REWRITE DEFAULT-+-1))
                        (652 2 (:REWRITE PREFIXP-OF-APPEND-ARG2))
                        (299 98
                             (:REWRITE PREFIXP-WHEN-NOT-CONSP-LEFT))
                        (279 31 (:REWRITE LIST-FIX-WHEN-TRUE-LISTP))
                        (240 120
                             (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
                        (201 39 (:DEFINITION TRUE-LISTP))
                        (194 194 (:REWRITE DEFAULT-CAR))
                        (129 60 (:REWRITE DEFAULT-<-2))
                        (123 116
                             (:REWRITE PREFIXP-ONE-WAY-OR-ANOTHER . 1))
                        (120 120 (:TYPE-PRESCRIPTION BINARY-APPEND))
                        (112 112 (:REWRITE PREFIXP-TRANSITIVE . 1))
                        (78 60 (:REWRITE DEFAULT-<-1))
                        (52 1 (:REWRITE LEN-WHEN-PREFIXP))
                        (40 40
                            (:REWRITE APPEND-ATOM-UNDER-LIST-EQUIV))
                        (30 30 (:REWRITE LIST-FIX-WHEN-NOT-CONSP))
                        (11 11 (:REWRITE CDR-OF-APPEND-WHEN-CONSP))
                        (3 3 (:REWRITE LIST-EQUIV-WHEN-ATOM-RIGHT))
                        (3 3 (:REWRITE LIST-EQUIV-WHEN-ATOM-LEFT)))
