(ECURVE::SECP256K1-POINT-TO-POINTP)
(ECURVE::POINTP-OF-SECP256K1-POINT-TO-POINTP
 (15 10 (:REWRITE DEFAULT-<-1))
 (15 2 (:REWRITE INTEGERP-OF-CAR-WHEN-INTEGER-LISTP))
 (11 1 (:DEFINITION INTEGER-LISTP))
 (10 10 (:REWRITE DEFAULT-<-2))
 (6 1 (:REWRITE NATP-OF-CAR-WHEN-NAT-LISTP))
 (5 5 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (4 4 (:REWRITE DEFAULT-CDR))
 (4 4 (:REWRITE DEFAULT-CAR))
 (2 2 (:REWRITE INTEGER-LISTP-WHEN-NOT-CONSP))
 (2 1 (:REWRITE INTEGER-LISTP-OF-CDR-WHEN-INTEGER-LISTP))
 (1 1 (:REWRITE NATP-LISTP-WHEN-DAB-DIGIT-LISTP))
 (1 1 (:REWRITE NAT-LISTP-WHEN-UNSIGNED-BYTE-LISTP))
 (1 1 (:REWRITE NAT-LISTP-WHEN-NOT-CONSP))
 )
(ECURVE::POINT-IN-PXP-P-OF-SECP256K1-POINT-TO-POINTP
 (1874 192 (:REWRITE INTEGERP-OF-CAR-WHEN-INTEGER-LISTP))
 (1614 124 (:DEFINITION INTEGER-LISTP))
 (920 184 (:REWRITE INTEGER-LISTP-OF-CDR-WHEN-INTEGER-LISTP))
 (264 264 (:REWRITE INTEGER-LISTP-WHEN-NOT-CONSP))
 (237 237 (:REWRITE DEFAULT-CAR))
 (198 198 (:REWRITE DEFAULT-CDR))
 (130 102 (:REWRITE DEFAULT-<-1))
 (102 102 (:REWRITE DEFAULT-<-2))
 (21 14 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (7 7 (:REWRITE RATIONALP-OF-CAR-WHEN-RATIONAL-LISTP))
 (7 7 (:REWRITE ACL2-NUMBERP-OF-CAR-WHEN-ACL2-NUMBER-LISTP))
 )
(ECURVE::SECP256K1-POINT-TO-POINTP-OF-SECP256K1-POINT-FIX-SECP-POINT)
(ECURVE::SECP256K1-POINT-TO-POINTP-SECP256K1-POINT-EQUIV-CONGRUENCE-ON-SECP-POINT)
(ECURVE::POINTP-TO-SECP256K1-POINT
 (56 8 (:REWRITE DEFAULT-<-1))
 (33 3 (:REWRITE RATIONALP-IMPLIES-ACL2-NUMBERP))
 (31 2 (:REWRITE ACL2-NUMBERP-OF-CAR-WHEN-ACL2-NUMBER-LISTP))
 (30 4 (:REWRITE RATIONALP-OF-CAR-WHEN-RATIONAL-LISTP))
 (27 1 (:DEFINITION ACL2-NUMBER-LISTP))
 (22 2 (:DEFINITION RATIONAL-LISTP))
 (15 2 (:REWRITE INTEGERP-OF-CAR-WHEN-INTEGER-LISTP))
 (11 1 (:DEFINITION INTEGER-LISTP))
 (8 8 (:REWRITE DEFAULT-<-2))
 (7 7 (:REWRITE DEFAULT-CDR))
 (7 7 (:REWRITE DEFAULT-CAR))
 (6 1 (:REWRITE NATP-OF-CAR-WHEN-NAT-LISTP))
 (4 4 (:REWRITE RATIONAL-LISTP-WHEN-NOT-CONSP))
 (4 2 (:REWRITE RATIONAL-LISTP-OF-CDR-WHEN-RATIONAL-LISTP))
 (2 2 (:REWRITE INTEGER-LISTP-WHEN-NOT-CONSP))
 (2 2 (:REWRITE ACL2-NUMBER-LISTP-WHEN-NOT-CONSP))
 (2 1 (:REWRITE INTEGER-LISTP-OF-CDR-WHEN-INTEGER-LISTP))
 (2 1 (:REWRITE ACL2-NUMBER-LISTP-OF-CDR-WHEN-ACL2-NUMBER-LISTP))
 (1 1 (:REWRITE NATP-LISTP-WHEN-DAB-DIGIT-LISTP))
 (1 1 (:REWRITE NAT-LISTP-WHEN-UNSIGNED-BYTE-LISTP))
 (1 1 (:REWRITE NAT-LISTP-WHEN-NOT-CONSP))
 )
(ECURVE::SECP256K1-POINTP-OF-POINTP-TO-SECP256K1-POINT)
(ECURVE::POINTP-TO-SECP256K1-POINT-OF-SECP256K1-POINT-TO-POINTP
 (141 141 (:TYPE-PRESCRIPTION ECURVE::SECP256K1-FIELD-FIX))
 (87 1 (:REWRITE ECURVE::SECP256K1-POINT-FIX-WHEN-SECP256K1-POINTP))
 (44 2 (:DEFINITION TRUE-LISTP))
 (40 33 (:REWRITE DEFAULT-CAR))
 (39 32 (:REWRITE DEFAULT-CDR))
 (32 4 (:REWRITE SET::SETS-ARE-TRUE-LISTS-CHEAP))
 (11 11 (:TYPE-PRESCRIPTION LEN))
 (10 5 (:REWRITE DEFAULT-+-2))
 (9 3 (:REWRITE ECURVE::SECP256K1-POINTP-WHEN-SECP256K1-PUB-KEY-P))
 (8 8 (:TYPE-PRESCRIPTION SET::SETP-TYPE))
 (8 4 (:REWRITE OMAP::SETP-WHEN-MAPP))
 (8 4 (:REWRITE SET::NONEMPTY-MEANS-SET))
 (6 6 (:TYPE-PRESCRIPTION TRUE-LISTP))
 (6 6 (:TYPE-PRESCRIPTION ECURVE::SECP256K1-PUB-KEY-P))
 (5 5 (:REWRITE DEFAULT-+-1))
 (4 4 (:TYPE-PRESCRIPTION OMAP::MAPP))
 (4 4 (:TYPE-PRESCRIPTION SET::EMPTY-TYPE))
 (4 4 (:REWRITE TRUE-LISTP-WHEN-UNSIGNED-BYTE-LISTP))
 (4 4 (:REWRITE TRUE-LISTP-WHEN-SIGNED-BYTE-LISTP))
 (4 4 (:REWRITE TRUE-LISTP-WHEN-DAB-DIGIT-LISTP))
 (4 4 (:REWRITE SET::IN-SET))
 (1 1 (:TYPE-PRESCRIPTION ECURVE::SECP256K1-POINTP))
 )
(ECURVE::SECP256K1-POINT-TO-POINTP-OF-POINTP-TO-SECP256K1-POINT
 (15 15 (:REWRITE DEFAULT-CDR))
 (15 2 (:REWRITE INTEGERP-OF-CAR-WHEN-INTEGER-LISTP))
 (11 11 (:REWRITE DEFAULT-CAR))
 (11 1 (:DEFINITION INTEGER-LISTP))
 (8 8 (:REWRITE DEFAULT-<-2))
 (8 8 (:REWRITE DEFAULT-<-1))
 (6 1 (:REWRITE NATP-OF-CAR-WHEN-NAT-LISTP))
 (2 2 (:REWRITE-QUOTED-CONSTANT ECURVE::SECP256K1-POINT-FIX-UNDER-SECP256K1-POINT-EQUIV))
 (2 2 (:REWRITE INTEGER-LISTP-WHEN-NOT-CONSP))
 (2 1 (:REWRITE INTEGER-LISTP-OF-CDR-WHEN-INTEGER-LISTP))
 (1 1 (:REWRITE NATP-LISTP-WHEN-DAB-DIGIT-LISTP))
 (1 1 (:REWRITE NAT-LISTP-WHEN-UNSIGNED-BYTE-LISTP))
 (1 1 (:REWRITE NAT-LISTP-WHEN-NOT-CONSP))
 )
