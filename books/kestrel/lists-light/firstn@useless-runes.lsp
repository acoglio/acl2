(FIRSTN)
(FIRSTN-OF-NIL)
(FIRSTN-WHEN-ZP-CHEAP (10 1 (:REWRITE CONSP-FROM-LEN-CHEAP))
                      (5 5 (:TYPE-PRESCRIPTION LEN))
                      (2 1 (:REWRITE DEFAULT-<-2))
                      (1 1 (:REWRITE ZP-OPEN))
                      (1 1 (:REWRITE LEN-WHEN-NOT-CONSP-CHEAP))
                      (1 1 (:REWRITE DEFAULT-<-1))
                      (1 1 (:REWRITE CONSP-WHEN-LEN-GREATER))
                      (1 1
                         (:LINEAR LEN-POSITIVE-WHEN-CONSP-LINEAR-CHEAP)))
(LEN-OF-FIRSTN (82 14 (:REWRITE CONSP-FROM-LEN-CHEAP))
               (46 31 (:REWRITE DEFAULT-<-2))
               (44 26
                   (:LINEAR LEN-POSITIVE-WHEN-CONSP-LINEAR-CHEAP))
               (31 31 (:REWRITE DEFAULT-<-1))
               (17 17 (:REWRITE FIRSTN-WHEN-ZP-CHEAP))
               (10 10 (:REWRITE DEFAULT-+-2))
               (10 10 (:REWRITE DEFAULT-+-1))
               (10 8 (:REWRITE DEFAULT-CAR))
               (9 7 (:REWRITE DEFAULT-CDR))
               (8 8 (:REWRITE ZP-OPEN))
               (8 8 (:REWRITE CONSP-WHEN-LEN-GREATER)))
(FIRSTN-OF-SINGLETON (2 2 (:REWRITE FIRSTN-WHEN-ZP-CHEAP))
                     (1 1 (:REWRITE DEFAULT-CDR))
                     (1 1 (:REWRITE DEFAULT-CAR))
                     (1 1 (:REWRITE DEFAULT-<-2))
                     (1 1 (:REWRITE DEFAULT-<-1))
                     (1 1 (:REWRITE DEFAULT-+-2))
                     (1 1 (:REWRITE DEFAULT-+-1)))
(FIRSTN-OF-ONE-MORE (168 17 (:REWRITE LEN-OF-FIRSTN))
                    (83 40 (:REWRITE DEFAULT-CAR))
                    (82 61 (:REWRITE DEFAULT-<-2))
                    (72 72 (:REWRITE LEN-WHEN-NOT-CONSP-CHEAP))
                    (71 40 (:REWRITE DEFAULT-CDR))
                    (63 17 (:DEFINITION MIN))
                    (61 61 (:REWRITE DEFAULT-<-1))
                    (51 17 (:DEFINITION NFIX))
                    (34 31 (:REWRITE DEFAULT-+-2))
                    (31 31 (:REWRITE DEFAULT-+-1))
                    (23 23 (:REWRITE CONSP-WHEN-LEN-GREATER))
                    (12 3 (:REWRITE EQUAL-OF-LEN-AND-0))
                    (11 11 (:REWRITE ZP-OPEN))
                    (10 1 (:LINEAR LEN-OF-CDR-LINEAR-STRONG))
                    (8 1 (:LINEAR LEN-OF-CDR-LINEAR))
                    (7 7
                       (:REWRITE CONSP-OF-CDR-WHEN-LEN-KNOWN)))
(NTH-OF-FIRSTN (126 31 (:REWRITE DEFAULT-CAR))
               (105 74 (:REWRITE DEFAULT-<-2))
               (74 74 (:REWRITE DEFAULT-<-1))
               (38 35 (:REWRITE LEN-WHEN-NOT-CONSP-CHEAP))
               (25 25 (:REWRITE FIRSTN-WHEN-ZP-CHEAP))
               (20 17 (:REWRITE DEFAULT-+-2))
               (19 19 (:REWRITE CONSP-WHEN-LEN-GREATER))
               (17 17 (:REWRITE DEFAULT-+-1))
               (14 12 (:REWRITE DEFAULT-CDR))
               (10 10 (:REWRITE ZP-OPEN)))
(NTHCDR-OF-FIRSTN-SAME (20 10 (:REWRITE DEFAULT-<-2))
                       (11 10 (:REWRITE DEFAULT-<-1))
                       (4 4 (:REWRITE LEN-WHEN-NOT-CONSP-CHEAP))
                       (1 1
                          (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP)))
(FIRSTN-OF-TRUE-LIST-FIX (154 8
                              (:REWRITE TRUE-LIST-FIX-WHEN-TRUE-LISTP))
                         (148 13 (:REWRITE CONSP-FROM-LEN-CHEAP))
                         (132 9 (:DEFINITION TRUE-LISTP))
                         (38 38 (:TYPE-PRESCRIPTION TRUE-LISTP))
                         (26 4 (:REWRITE LEN-OF-CDR))
                         (24 13 (:REWRITE DEFAULT-<-2))
                         (21 21 (:REWRITE LEN-WHEN-NOT-CONSP-CHEAP))
                         (19 11
                             (:LINEAR LEN-POSITIVE-WHEN-CONSP-LINEAR-CHEAP))
                         (15 15 (:REWRITE FIRSTN-WHEN-ZP-CHEAP))
                         (14 14 (:REWRITE DEFAULT-CDR))
                         (13 13 (:REWRITE DEFAULT-<-1))
                         (13 13 (:REWRITE CONSP-WHEN-LEN-GREATER))
                         (11 9 (:REWRITE DEFAULT-+-2))
                         (9 9 (:REWRITE DEFAULT-+-1))
                         (6 6 (:REWRITE ZP-OPEN))
                         (6 6 (:REWRITE DEFAULT-CAR))
                         (4 4
                            (:REWRITE CONSP-OF-CDR-WHEN-LEN-KNOWN))
                         (2 2 (:REWRITE EQUAL-OF-LEN-AND-0)))
(FIRSTN-BECOMES-TAKE (17 13 (:REWRITE DEFAULT-<-1))
                     (16 13 (:REWRITE DEFAULT-<-2))
                     (16 7 (:REWRITE DEFAULT-CDR))
                     (16 6 (:REWRITE DEFAULT-CAR))
                     (13 11 (:REWRITE DEFAULT-+-2))
                     (11 11 (:REWRITE DEFAULT-+-1))
                     (10 2 (:REWRITE EQUAL-OF-LEN-AND-0))
                     (10 1 (:LINEAR LEN-OF-CDR-LINEAR-STRONG))
                     (8 1 (:LINEAR LEN-OF-CDR-LINEAR))
                     (6 6 (:REWRITE ZP-OPEN))
                     (3 3 (:REWRITE CONSP-WHEN-LEN-GREATER))
                     (3 1
                        (:REWRITE TRUE-LIST-FIX-WHEN-TRUE-LISTP))
                     (1 1 (:TYPE-PRESCRIPTION TRUE-LISTP))
                     (1 1 (:DEFINITION TRUE-LISTP)))
(FIRSTN-BECOMES-TAKE-GEN (271 32 (:REWRITE CONSP-FROM-LEN-CHEAP))
                         (258 13
                              (:REWRITE TRUE-LIST-FIX-WHEN-TRUE-LISTP))
                         (224 17 (:DEFINITION TRUE-LISTP))
                         (113 3 (:DEFINITION TAKE))
                         (69 69 (:TYPE-PRESCRIPTION TRUE-LISTP))
                         (69 55 (:REWRITE DEFAULT-<-2))
                         (64 55 (:REWRITE DEFAULT-<-1))
                         (54 38 (:REWRITE DEFAULT-CDR))
                         (46 40 (:REWRITE DEFAULT-+-2))
                         (40 40 (:REWRITE DEFAULT-+-1))
                         (28 12 (:REWRITE DEFAULT-CAR))
                         (26 6 (:REWRITE EQUAL-OF-LEN-AND-0))
                         (24 24 (:REWRITE CONSP-WHEN-LEN-GREATER))
                         (14 14 (:REWRITE FIRSTN-WHEN-ZP-CHEAP))
                         (12 6 (:REWRITE ZP-OPEN))
                         (12 4 (:REWRITE FOLD-CONSTS-IN-+))
                         (11 11
                             (:REWRITE CONSP-OF-CDR-WHEN-LEN-KNOWN))
                         (10 1 (:LINEAR LEN-OF-CDR-LINEAR-STRONG))
                         (8 1 (:LINEAR LEN-OF-CDR-LINEAR))
                         (2 2
                            (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
                         (2 2
                            (:REWRITE LEN-OF-CDDR-WHEN-EQUAL-OF-LEN)))
(FIRSTN-OF-1 (21 4 (:REWRITE CONSP-FROM-LEN-CHEAP))
             (13 2
                 (:REWRITE TRUE-LIST-FIX-WHEN-TRUE-LISTP))
             (8 2 (:DEFINITION TRUE-LISTP))
             (6 6 (:TYPE-PRESCRIPTION TRUE-LISTP))
             (5 3 (:REWRITE DEFAULT-<-2))
             (4 4
                (:LINEAR LEN-POSITIVE-WHEN-CONSP-LINEAR-CHEAP))
             (4 3 (:REWRITE DEFAULT-<-1))
             (3 3 (:REWRITE CONSP-WHEN-LEN-GREATER))
             (3 2 (:REWRITE DEFAULT-CAR))
             (1 1 (:REWRITE DEFAULT-CDR)))
(FIRSTN-WHEN-<=-OF-LEN (59 6
                           (:REWRITE TRUE-LIST-FIX-WHEN-TRUE-LISTP))
                       (45 4 (:DEFINITION TRUE-LISTP))
                       (21 4 (:REWRITE CONSP-FROM-LEN-CHEAP))
                       (20 20 (:TYPE-PRESCRIPTION TRUE-LISTP))
                       (11 11 (:REWRITE LEN-WHEN-NOT-CONSP-CHEAP))
                       (11 7 (:REWRITE DEFAULT-<-2))
                       (10 7 (:REWRITE DEFAULT-<-1))
                       (5 5
                          (:LINEAR LEN-POSITIVE-WHEN-CONSP-LINEAR-CHEAP))
                       (4 4 (:REWRITE DEFAULT-CDR))
                       (4 4 (:REWRITE CONSP-WHEN-LEN-GREATER)))
(APPEND-OF-FIRSTN-AND-NTHCDR
     (1644 822
           (:TYPE-PRESCRIPTION TRUE-LISTP-NTHCDR-TYPE-PRESCRIPTION))
     (822 274 (:TYPE-PRESCRIPTION BINARY-APPEND))
     (357 36 (:REWRITE CONSP-FROM-LEN-CHEAP))
     (318 18
          (:REWRITE TRUE-LIST-FIX-WHEN-TRUE-LISTP))
     (273 20 (:DEFINITION TRUE-LISTP))
     (118 87 (:REWRITE DEFAULT-<-2))
     (99 87 (:REWRITE DEFAULT-<-1))
     (95 53 (:REWRITE DEFAULT-CDR))
     (44 42 (:REWRITE DEFAULT-+-2))
     (42 42 (:REWRITE DEFAULT-+-1))
     (34 34 (:REWRITE CONSP-WHEN-LEN-GREATER))
     (30 10 (:DEFINITION POSP))
     (20 20 (:REWRITE NTHCDR-WHEN-EQUAL-OF-LEN))
     (14 14
         (:REWRITE CONSP-OF-CDR-WHEN-LEN-KNOWN))
     (12 12 (:REWRITE DEFAULT-CAR))
     (12 1 (:REWRITE LEN-OF-FIRSTN))
     (10 10 (:TYPE-PRESCRIPTION POSP))
     (10 1 (:LINEAR LEN-OF-CDR-LINEAR-STRONG))
     (8 1 (:LINEAR LEN-OF-CDR-LINEAR))
     (7 1 (:REWRITE TAKE-DOES-NOTHING))
     (7 1 (:DEFINITION MIN))
     (4 4 (:REWRITE FIRSTN-WHEN-ZP-CHEAP))
     (3 3 (:REWRITE ZP-OPEN))
     (3 3
        (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
     (2 2 (:REWRITE EQUAL-OF-LEN-AND-0)))
(CONSP-OF-FIRSTN (19 1
                     (:REWRITE TRUE-LIST-FIX-WHEN-TRUE-LISTP))
                 (17 11 (:REWRITE LEN-WHEN-NOT-CONSP-CHEAP))
                 (16 12 (:REWRITE DEFAULT-<-2))
                 (16 1 (:DEFINITION TRUE-LISTP))
                 (14 12 (:REWRITE DEFAULT-<-1))
                 (14 1 (:REWRITE FIRSTN-WHEN-<=-OF-LEN))
                 (12 7
                     (:LINEAR LEN-POSITIVE-WHEN-CONSP-LINEAR-CHEAP))
                 (5 5 (:TYPE-PRESCRIPTION TRUE-LISTP))
                 (3 3 (:REWRITE CONSP-WHEN-LEN-GREATER))
                 (1 1 (:TYPE-PRESCRIPTION NFIX))
                 (1 1 (:REWRITE DEFAULT-CDR)))
(FIRSTN-OF-APPEND (217 171 (:REWRITE LEN-WHEN-NOT-CONSP-CHEAP))
                  (213 124 (:REWRITE DEFAULT-<-1))
                  (197 124 (:REWRITE DEFAULT-<-2))
                  (176 12 (:DEFINITION TRUE-LISTP))
                  (129 18 (:REWRITE CONSP-FROM-LEN-CHEAP))
                  (126 61 (:REWRITE DEFAULT-+-2))
                  (110 61 (:REWRITE DEFAULT-+-1))
                  (101 49
                       (:LINEAR LEN-POSITIVE-WHEN-CONSP-LINEAR-CHEAP))
                  (88 4 (:REWRITE FIRSTN-WHEN-<=-OF-LEN))
                  (55 29 (:REWRITE DEFAULT-UNARY-MINUS))
                  (44 1 (:REWRITE TRUE-LISTP-OF-NTHCDR-2))
                  (39 3 (:DEFINITION POSP))
                  (33 3 (:REWRITE EQUAL-OF-LEN-AND-0))
                  (31 5
                      (:REWRITE NTHCDR-WHEN-NOT-CONSP-CHEAP))
                  (15 15 (:REWRITE CONSP-WHEN-LEN-GREATER))
                  (14 12
                      (:REWRITE APPEND-WHEN-NOT-CONSP-ARG1-CHEAP))
                  (14 1 (:REWRITE LEN-OF-NTHCDR))
                  (13 12 (:REWRITE DEFAULT-CDR))
                  (7 7
                     (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
                  (5 5 (:REWRITE NTHCDR-WHEN-EQUAL-OF-LEN))
                  (4 4 (:REWRITE FOLD-CONSTS-IN-+))
                  (3 3 (:TYPE-PRESCRIPTION POSP)))
(FIRSTN-OF-FIRSTN (151 117 (:REWRITE DEFAULT-<-1))
                  (127 117 (:REWRITE DEFAULT-<-2))
                  (79 59 (:REWRITE LEN-WHEN-NOT-CONSP-CHEAP))
                  (76 14 (:REWRITE CONSP-FROM-LEN-CHEAP))
                  (59 3 (:REWRITE FIRSTN-WHEN-<=-OF-LEN))
                  (58 4 (:DEFINITION TRUE-LISTP))
                  (56 4 (:REWRITE EQUAL-OF-LEN-AND-0))
                  (40 25
                      (:LINEAR LEN-POSITIVE-WHEN-CONSP-LINEAR-CHEAP))
                  (20 20 (:TYPE-PRESCRIPTION TRUE-LISTP))
                  (12 4 (:REWRITE DEFAULT-CDR))
                  (10 10 (:REWRITE CONSP-WHEN-LEN-GREATER))
                  (4 4
                     (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP)))
