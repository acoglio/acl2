(NIL-LIST)
(SIMPLE-STATEGENERATORLOCAL (1 1 (:TYPE-PRESCRIPTION TRUE-LISTP)))
(SIMPLE-STATEGENERATOR)
(SIMPLE-VALIDSTATEPARAMSP)
(UPDATE-BUFFER)
(SIMPLE-LOADBUFFERS)
(SIMPLE-READBUFFERS)
(HAS-EMPTY-BUFFER (10 5
                      (:TYPE-PRESCRIPTION TRUE-LISTP-MEMBER-EQUAL))
                  (5 5 (:TYPE-PRESCRIPTION TRUE-LISTP)))
(GET-TRAVELS)
(CREATE-BUFFER)
(UPDATE-NTKSTATE)
(GET-TRANSACTIONS)
(CREATE-BUFFER-TA)
(SIMPLE-GENERATE-INITIAL-NTKSTATE)
(SIMPLE-GEN-VALIDSTATES
     (55 10
         (:REWRITE VALIDSTATE-ENTRY-IMPLIES-COORD-AND-BUFFER))
     (48 46 (:REWRITE DEFAULT-CAR))
     (48 1 (:DEFINITION SUBSETP-EQUAL))
     (44 42 (:REWRITE DEFAULT-CDR))
     (32 1 (:DEFINITION MEMBER-EQUAL))
     (18 18
         (:TYPE-PRESCRIPTION VALIDSTATE-ENTRYP))
     (17 5 (:DEFINITION VALIDBUFFER))
     (10 6
         (:TYPE-PRESCRIPTION TRUE-LISTP-MEMBER-EQUAL))
     (7 1
        (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-TRLST))
     (7 1
        (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-MISSIVES))
     (7 1 (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR))
     (3 3 (:REWRITE SUBSETP-TRANS))
     (3 1 (:DEFINITION IDV))
     (3 1 (:DEFINITION IDTM))
     (3 1 (:DEFINITION IDM)))
(STATEPARAMSP=PARAMSP)
(SIMPLE-LOADBUFBERS-VALIDSTATES
     (1689 26 (:DEFINITION SUBSETP-EQUAL))
     (980 32 (:DEFINITION MEMBER-EQUAL))
     (385 170
          (:TYPE-PRESCRIPTION TRUE-LISTP-MEMBER-EQUAL))
     (283 46
          (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-TRLST))
     (277 46
          (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-MISSIVES))
     (277 46 (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR))
     (201 192 (:REWRITE DEFAULT-CDR))
     (170 170 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (170 170
          (:TYPE-PRESCRIPTION CONSP-MEMBER-EQUAL))
     (168 36
          (:REWRITE VALIDSTATE-ENTRY-IMPLIES-COORD-AND-BUFFER))
     (88 41 (:DEFINITION IDV))
     (82 41 (:DEFINITION IDTM))
     (82 41 (:DEFINITION IDM))
     (81 81
         (:TYPE-PRESCRIPTION VALIDSTATE-ENTRYP))
     (56 56 (:REWRITE SUBSETP-TRANS)))
(SIMPLE-READBUFFERS-VALID-ENTRYP-LOCAL
     (163 163 (:REWRITE DEFAULT-CDR))
     (15 15
         (:REWRITE SUBSETS-ARE-VALID-RESOURCES)))
(VALIDSTATE-UPDATE-NTKSTATE
     (1185 16 (:DEFINITION SUBSETP-EQUAL))
     (685 25 (:DEFINITION MEMBER-EQUAL))
     (300 20 (:REWRITE NTH-WITH-LARGE-INDEX))
     (268 139
          (:TYPE-PRESCRIPTION TRUE-LISTP-MEMBER-EQUAL))
     (218 33
          (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-TRLST))
     (218 33
          (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-MISSIVES))
     (218 33 (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR))
     (195 5 (:DEFINITION GET-TRAVELS))
     (190 5 (:DEFINITION CREATE-BUFFER))
     (170 10 (:DEFINITION NTH))
     (165 159 (:REWRITE DEFAULT-CDR))
     (165 5 (:DEFINITION ROUTESV))
     (165 5 (:DEFINITION FRMV))
     (123 24
          (:REWRITE VALIDSTATE-ENTRY-IMPLIES-COORD-AND-BUFFER))
     (120 120 (:TYPE-PRESCRIPTION LEN))
     (112 112 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (112 112
          (:TYPE-PRESCRIPTION CONSP-MEMBER-EQUAL))
     (100 20 (:DEFINITION LEN))
     (48 48
         (:TYPE-PRESCRIPTION VALIDSTATE-ENTRYP))
     (44 22 (:DEFINITION IDV))
     (44 22 (:DEFINITION IDTM))
     (44 22 (:DEFINITION IDM))
     (40 20 (:REWRITE DEFAULT-<-2))
     (40 20 (:REWRITE DEFAULT-+-2))
     (34 34 (:REWRITE SUBSETP-TRANS))
     (20 20 (:TYPE-PRESCRIPTION NFIX))
     (20 20 (:REWRITE DEFAULT-<-1))
     (20 20 (:REWRITE DEFAULT-+-1))
     (20 20 (:LINEAR LEQ-POSITION-EQUAL-LEN))
     (10 10 (:TYPE-PRESCRIPTION GET-TRAVELS)))
(VALIDSTATE-SIMPLE-GENERATE-INITIAL-NTKSTATE
     (1182 16 (:DEFINITION SUBSETP-EQUAL))
     (685 25 (:DEFINITION MEMBER-EQUAL))
     (300 20 (:REWRITE NTH-WITH-LARGE-INDEX))
     (268 139
          (:TYPE-PRESCRIPTION TRUE-LISTP-MEMBER-EQUAL))
     (218 33
          (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-TRLST))
     (218 33
          (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-MISSIVES))
     (218 33 (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR))
     (190 5 (:DEFINITION CREATE-BUFFER-TA))
     (180 5 (:DEFINITION GET-TRANSACTIONS))
     (170 10 (:DEFINITION NTH))
     (165 159 (:REWRITE DEFAULT-CDR))
     (165 5 (:DEFINITION ORGT))
     (165 5 (:DEFINITION MSGT))
     (123 24
          (:REWRITE VALIDSTATE-ENTRY-IMPLIES-COORD-AND-BUFFER))
     (120 120 (:TYPE-PRESCRIPTION LEN))
     (112 112 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (112 112
          (:TYPE-PRESCRIPTION CONSP-MEMBER-EQUAL))
     (100 20 (:DEFINITION LEN))
     (48 48
         (:TYPE-PRESCRIPTION VALIDSTATE-ENTRYP))
     (44 22 (:DEFINITION IDV))
     (44 22 (:DEFINITION IDTM))
     (44 22 (:DEFINITION IDM))
     (40 20 (:REWRITE DEFAULT-<-2))
     (40 20 (:REWRITE DEFAULT-+-2))
     (34 34 (:REWRITE SUBSETP-TRANS))
     (20 20 (:TYPE-PRESCRIPTION NFIX))
     (20 20 (:REWRITE DEFAULT-<-1))
     (20 20 (:REWRITE DEFAULT-+-1))
     (20 20 (:LINEAR LEQ-POSITION-EQUAL-LEN))
     (10 10
         (:TYPE-PRESCRIPTION GET-TRANSACTIONS)))
(NODESETP-COORDINATES-SIMPLE (22 21 (:REWRITE DEFAULT-CAR))
                             (19 18 (:REWRITE DEFAULT-CDR)))
(SIMPLE-NTKSTATE-COMPLIES-GENERIC
     (87 5
         (:DEFINITION SIMPLE-STATEGENERATORLOCAL))
     (64 10 (:DEFINITION BINARY-APPEND))
     (61 61 (:REWRITE DEFAULT-CAR))
     (37 37 (:REWRITE DEFAULT-CDR))
     (23 1 (:DEFINITION MEMBER-EQUAL))
     (9 1 (:DEFINITION SIMPLE-READBUFFERS))
     (9 1 (:DEFINITION GETCOORDINATES))
     (8 2 (:DEFINITION GET_COOR))
     (7 2 (:DEFINITION TRUE-LISTP))
     (6 1
        (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-TRLST))
     (6 1
        (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR-MISSIVES))
     (6 1 (:REWRITE ID-NOT-EQ-CAR-MEMBER-CDR))
     (5 5 (:TYPE-PRESCRIPTION TRUE-LISTP))
     (5 5 (:REWRITE CDR-CONS))
     (5 5 (:REWRITE CAR-CONS))
     (4 4
        (:TYPE-PRESCRIPTION SIMPLE-STATEGENERATORLOCAL))
     (2 1 (:DEFINITION IDV))
     (2 1 (:DEFINITION IDTM))
     (2 1 (:DEFINITION IDM)))
