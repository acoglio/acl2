(|f|
 (534 534 (:REWRITE ARITH-NORMALIZE-FACTORS-SCATTER-EXPONENTS))
 (462 462 (:REWRITE |arith (* c (* d x))|))
 (210 60 (:REWRITE SIMPLIFY-PRODUCTS-GATHER-EXPONENTS-<))
 (196 196 (:REWRITE |arith (* (- x) y)|))
 (184 184 (:REWRITE |arith (- (* c x))|))
 (182 51 (:REWRITE DEFAULT-PLUS-2))
 (144 60 (:REWRITE REMOVE-WEAK-INEQUALITIES))
 (140 62 (:REWRITE DEFAULT-LESS-THAN-2))
 (140 62 (:REWRITE DEFAULT-LESS-THAN-1))
 (132 56 (:REWRITE SIMPLIFY-SUMS-<))
 (114 51 (:REWRITE DEFAULT-PLUS-1))
 (63 32 (:REWRITE DEFAULT-TIMES-2))
 (62 62 (:REWRITE THE-FLOOR-BELOW))
 (62 62 (:REWRITE THE-FLOOR-ABOVE))
 (62 62 (:REWRITE REDUCE-RATIONAL-MULTIPLICATIVE-CONSTANT-<))
 (62 62 (:REWRITE REDUCE-MULTIPLICATIVE-CONSTANT-<))
 (62 62 (:REWRITE REDUCE-ADDITIVE-CONSTANT-<))
 (60 60 (:REWRITE REMOVE-STRICT-INEQUALITIES))
 (60 60 (:REWRITE INTEGERP-<-CONSTANT))
 (60 60 (:REWRITE CONSTANT-<-INTEGERP))
 (60 60 (:REWRITE |(< c (/ x)) positive c --- present in goal|))
 (60 60 (:REWRITE |(< c (/ x)) positive c --- obj t or nil|))
 (60 60 (:REWRITE |(< c (/ x)) negative c --- present in goal|))
 (60 60 (:REWRITE |(< c (/ x)) negative c --- obj t or nil|))
 (60 60 (:REWRITE |(< c (- x))|))
 (60 60 (:REWRITE |(< (/ x) c) positive c --- present in goal|))
 (60 60 (:REWRITE |(< (/ x) c) positive c --- obj t or nil|))
 (60 60 (:REWRITE |(< (/ x) c) negative c --- present in goal|))
 (60 60 (:REWRITE |(< (/ x) c) negative c --- obj t or nil|))
 (60 60 (:REWRITE |(< (/ x) (/ y))|))
 (60 60 (:REWRITE |(< (- x) c)|))
 (60 60 (:REWRITE |(< (- x) (- y))|))
 (51 32 (:REWRITE DEFAULT-TIMES-1))
 (42 42 (:REWRITE C::SINTP-WHEN-MEMBER-EQUAL-OF-SINT-LISTP))
 (36 36 (:TYPE-PRESCRIPTION NOT-INTEGERP-3A))
 (36 36 (:TYPE-PRESCRIPTION NOT-INTEGERP-2A))
 (36 36 (:TYPE-PRESCRIPTION NOT-INTEGERP-1A))
 (29 29 (:REWRITE NORMALIZE-TERMS-SUCH-AS-A/A+B-+-B/A+B))
 (23 23 (:REWRITE NORMALIZE-FACTORS-GATHER-EXPONENTS))
 (14 14 (:REWRITE |(< x (+ c/d y))|))
 (14 14 (:REWRITE |(< (+ c/d x) y)|))
 (12 12 (:REWRITE |(+ c (+ d x))|))
 (8 8 (:REWRITE FOLD-CONSTS-IN-+))
 (8 4 (:TYPE-PRESCRIPTION BUBBLE-DOWN))
 (6 6 (:REWRITE ARITH-NORMALIZE-ADDENDS))
 (2 2 (:REWRITE |arith (+ c (+ d x))|))
 (2 2 (:REWRITE |(* x (- y))|))
 (2 2 (:REWRITE |(* (- x) y)|))
 )
(C::*PROGRAM*-WELL-FORMED)
(|f-RETURNS-VALUE|)
(C::|*PROGRAM*-f-CORRECT|
 (2556 1 (:REWRITE C::EXEC-BLOCK-ITEM-LIST-UNROLL))
 (210 198 (:REWRITE C::VALUEP-WHEN-ULONGP))
 (210 198 (:REWRITE C::VALUEP-WHEN-ULLONGP))
 (210 198 (:REWRITE C::VALUEP-WHEN-SLONGP))
 (210 198 (:REWRITE C::VALUEP-WHEN-SLLONGP))
 (198 198 (:REWRITE C::VALUEP-WHEN-POINTERP))
 (112 100 (:REWRITE C::NOT-SINTP-WHEN-USHORTP))
 (112 100 (:REWRITE C::NOT-SINTP-WHEN-ULONGP))
 (112 100 (:REWRITE C::NOT-SINTP-WHEN-ULLONGP))
 (112 100 (:REWRITE C::NOT-SINTP-WHEN-UINTP))
 (112 100 (:REWRITE C::NOT-SINTP-WHEN-UCHARP))
 (112 100 (:REWRITE C::NOT-SINTP-WHEN-SSHORTP))
 (112 100 (:REWRITE C::NOT-SINTP-WHEN-SLONGP))
 (112 100 (:REWRITE C::NOT-SINTP-WHEN-SLLONGP))
 (112 100 (:REWRITE C::NOT-SINTP-WHEN-SCHARP))
 (100 100 (:REWRITE C::NOT-SINTP-WHEN-POINTERP))
 (76 64 (:REWRITE C::NOT-SSHORTP-WHEN-ULONGP))
 (76 64 (:REWRITE C::NOT-SSHORTP-WHEN-ULLONGP))
 (76 64 (:REWRITE C::NOT-SSHORTP-WHEN-SLONGP))
 (76 64 (:REWRITE C::NOT-SSHORTP-WHEN-SLLONGP))
 (76 64 (:REWRITE C::NOT-SCHARP-WHEN-ULONGP))
 (76 64 (:REWRITE C::NOT-SCHARP-WHEN-ULLONGP))
 (76 64 (:REWRITE C::NOT-SCHARP-WHEN-SLONGP))
 (76 64 (:REWRITE C::NOT-SCHARP-WHEN-SLLONGP))
 (64 64 (:REWRITE C::NOT-SSHORTP-WHEN-POINTERP))
 (64 64 (:REWRITE C::NOT-SCHARP-WHEN-POINTERP))
 (46 34 (:REWRITE C::NOT-USHORTP-WHEN-ULONGP))
 (46 34 (:REWRITE C::NOT-USHORTP-WHEN-ULLONGP))
 (46 34 (:REWRITE C::NOT-USHORTP-WHEN-SLONGP))
 (46 34 (:REWRITE C::NOT-USHORTP-WHEN-SLLONGP))
 (46 34 (:REWRITE C::NOT-UCHARP-WHEN-ULONGP))
 (46 34 (:REWRITE C::NOT-UCHARP-WHEN-ULLONGP))
 (46 34 (:REWRITE C::NOT-UCHARP-WHEN-SLONGP))
 (46 34 (:REWRITE C::NOT-UCHARP-WHEN-SLLONGP))
 (39 30 (:REWRITE C::NOT-SLONGP-WHEN-ULONGP))
 (39 30 (:REWRITE C::NOT-SLONGP-WHEN-ULLONGP))
 (39 30 (:REWRITE C::NOT-SLONGP-WHEN-SLLONGP))
 (39 30 (:REWRITE C::NOT-SLLONGP-WHEN-ULONGP))
 (39 30 (:REWRITE C::NOT-SLLONGP-WHEN-ULLONGP))
 (39 30 (:REWRITE C::NOT-SLLONGP-WHEN-SLONGP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-USHORT-ARRAYP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-ULONG-ARRAYP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-ULLONG-ARRAYP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-UINT-ARRAYP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-UCHAR-ARRAYP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-SSHORT-ARRAYP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-SLONG-ARRAYP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-SLLONG-ARRAYP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-SINT-ARRAYP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-SCOPE-LISTP))
 (36 36 (:REWRITE C::NOT-ERRORP-WHEN-SCHAR-ARRAYP))
 (35 35 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-5))
 (34 34 (:REWRITE C::NOT-USHORTP-WHEN-POINTERP))
 (34 34 (:REWRITE C::NOT-UCHARP-WHEN-POINTERP))
 (33 33 (:REWRITE C::NOT-ERRORP-WHEN-VALUE-LISTP))
 (30 30 (:REWRITE C::NOT-SLONGP-WHEN-POINTERP))
 (30 30 (:REWRITE C::NOT-SLLONGP-WHEN-POINTERP))
 (25 19 (:REWRITE C::NOT-UINTP-WHEN-ULONGP))
 (25 19 (:REWRITE C::NOT-UINTP-WHEN-ULLONGP))
 (25 19 (:REWRITE C::NOT-UINTP-WHEN-SLONGP))
 (25 19 (:REWRITE C::NOT-UINTP-WHEN-SLLONGP))
 (20 20 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-3))
 (20 20 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-2))
 (20 20 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-1))
 (20 20 (:REWRITE C::EXEC-EXPR-PURE-BASE-5))
 (20 20 (:REWRITE C::EXEC-EXPR-PURE-BASE-4))
 (20 20 (:REWRITE C::EXEC-EXPR-PURE-BASE-3))
 (19 19 (:REWRITE C::NOT-UINTP-WHEN-POINTERP))
 (8 6 (:REWRITE C::EXEC-STMT-UNROLL-2))
 (8 6 (:REWRITE C::EXEC-STMT-UNROLL-1))
 (6 4 (:REWRITE OMAP::IN-UNROLL))
 (3 3 (:REWRITE OMAP::IN-BASE-1))
 (2 1 (:REWRITE C::EXEC-STMT-BASE-7))
 (2 1 (:REWRITE C::EXEC-STMT-BASE-5))
 (2 1 (:REWRITE C::EXEC-STMT-BASE-4))
 (1 1 (:REWRITE C::EXEC-FUN-OF-CONST-IDENTIFIER))
 (1 1 (:REWRITE C::COMPUSTATEP-WHEN-COMPUSTATE-RESULTP-AND-NOT-ERRORP))
 )
