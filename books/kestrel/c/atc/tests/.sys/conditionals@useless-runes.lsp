(|f|)
(|g|)
(|h|
 (10 10 (:REWRITE C::SINTP-WHEN-MEMBER-EQUAL-OF-SINT-LISTP))
 (9 4 (:REWRITE DEFAULT-<-2))
 (7 4 (:REWRITE DEFAULT-<-1))
 (2 2 (:REWRITE-QUOTED-CONSTANT C::SINT-FIX-UNDER-SINT-EQUIV))
 (2 1 (:REWRITE DEFAULT-UNARY-MINUS))
 (2 1 (:REWRITE DEFAULT-+-2))
 (1 1 (:REWRITE DEFAULT-+-1))
 )
(|i|
 (16 6 (:REWRITE DEFAULT-<-2))
 (16 6 (:REWRITE DEFAULT-<-1))
 (12 12 (:REWRITE C::SINTP-WHEN-MEMBER-EQUAL-OF-SINT-LISTP))
 (4 4 (:REWRITE-QUOTED-CONSTANT C::SINT-INTEGER-FIX-UNDER-SINT-INTEGER-EQUIV))
 (4 4 (:REWRITE-QUOTED-CONSTANT C::SINT-FIX-UNDER-SINT-EQUIV))
 (4 2 (:REWRITE DEFAULT-UNARY-MINUS))
 (4 2 (:REWRITE DEFAULT-+-2))
 (4 2 (:REWRITE DEFAULT-+-1))
 )
(|j|
 (22 12 (:REWRITE DEFAULT-<-1))
 (20 12 (:REWRITE DEFAULT-<-2))
 (4 4 (:REWRITE-QUOTED-CONSTANT C::SINT-INTEGER-FIX-UNDER-SINT-INTEGER-EQUIV))
 (4 4 (:REWRITE C::SINTP-WHEN-MEMBER-EQUAL-OF-SINT-LISTP))
 (4 4 (:REWRITE DEFAULT-+-2))
 (4 4 (:REWRITE DEFAULT-+-1))
 (4 4 (:REWRITE DEFAULT-*-2))
 (4 4 (:REWRITE DEFAULT-*-1))
 (2 2 (:REWRITE-QUOTED-CONSTANT C::SINT-FIX-UNDER-SINT-EQUIV))
 )
(C::*PROGRAM*-WELL-FORMED)
(|f-RETURNS-VALUE|
 (2 2 (:TYPE-PRESCRIPTION |f|))
 )
(C::|*PROGRAM*-f-CORRECT|
 (2925 11 (:REWRITE C::EXEC-BLOCK-ITEM-LIST-UNROLL))
 (169 169 (:REWRITE C::VALUEP-WHEN-ULONGP))
 (169 169 (:REWRITE C::VALUEP-WHEN-ULLONGP))
 (169 169 (:REWRITE C::VALUEP-WHEN-SLONGP))
 (169 169 (:REWRITE C::VALUEP-WHEN-SLLONGP))
 (169 169 (:REWRITE C::VALUEP-WHEN-POINTERP))
 (82 61 (:REWRITE C::EXEC-STMT-UNROLL-1))
 (60 60 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-5))
 (60 60 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-4))
 (60 60 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-3))
 (60 60 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-2))
 (60 60 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-1))
 (60 60 (:REWRITE C::EXEC-EXPR-PURE-BASE-5))
 (60 60 (:REWRITE C::EXEC-EXPR-PURE-BASE-4))
 (60 60 (:REWRITE C::EXEC-EXPR-PURE-BASE-3))
 (60 60 (:REWRITE C::EXEC-EXPR-PURE-BASE-2))
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
 (33 33 (:REWRITE C::NOT-ERRORP-WHEN-VALUE-LISTP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-USHORTP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-ULONGP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-ULLONGP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-UINTP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-UCHARP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-SSHORTP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-SLONGP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-SLLONGP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-SCHARP))
 (28 28 (:REWRITE C::NOT-SINTP-WHEN-POINTERP))
 (25 25 (:REWRITE C::NOT-SSHORTP-WHEN-ULONGP))
 (25 25 (:REWRITE C::NOT-SSHORTP-WHEN-ULLONGP))
 (25 25 (:REWRITE C::NOT-SSHORTP-WHEN-SLONGP))
 (25 25 (:REWRITE C::NOT-SSHORTP-WHEN-SLLONGP))
 (25 25 (:REWRITE C::NOT-SSHORTP-WHEN-POINTERP))
 (25 25 (:REWRITE C::NOT-SCHARP-WHEN-ULONGP))
 (25 25 (:REWRITE C::NOT-SCHARP-WHEN-ULLONGP))
 (25 25 (:REWRITE C::NOT-SCHARP-WHEN-SLONGP))
 (25 25 (:REWRITE C::NOT-SCHARP-WHEN-SLLONGP))
 (25 25 (:REWRITE C::NOT-SCHARP-WHEN-POINTERP))
 (22 11 (:REWRITE C::EXEC-STMT-BASE-7))
 (22 11 (:REWRITE C::EXEC-STMT-BASE-5))
 (22 11 (:REWRITE C::EXEC-STMT-BASE-4))
 (15 15 (:REWRITE C::NOT-USHORTP-WHEN-ULONGP))
 (15 15 (:REWRITE C::NOT-USHORTP-WHEN-ULLONGP))
 (15 15 (:REWRITE C::NOT-USHORTP-WHEN-SLONGP))
 (15 15 (:REWRITE C::NOT-USHORTP-WHEN-SLLONGP))
 (15 15 (:REWRITE C::NOT-USHORTP-WHEN-POINTERP))
 (15 15 (:REWRITE C::NOT-UINTP-WHEN-ULONGP))
 (15 15 (:REWRITE C::NOT-UINTP-WHEN-ULLONGP))
 (15 15 (:REWRITE C::NOT-UINTP-WHEN-SLONGP))
 (15 15 (:REWRITE C::NOT-UINTP-WHEN-SLLONGP))
 (15 15 (:REWRITE C::NOT-UINTP-WHEN-POINTERP))
 (15 15 (:REWRITE C::NOT-UCHARP-WHEN-ULONGP))
 (15 15 (:REWRITE C::NOT-UCHARP-WHEN-ULLONGP))
 (15 15 (:REWRITE C::NOT-UCHARP-WHEN-SLONGP))
 (15 15 (:REWRITE C::NOT-UCHARP-WHEN-SLLONGP))
 (15 15 (:REWRITE C::NOT-UCHARP-WHEN-POINTERP))
 (6 4 (:REWRITE OMAP::IN-UNROLL))
 (3 3 (:REWRITE OMAP::IN-BASE-1))
 (1 1 (:REWRITE C::EXEC-FUN-OF-CONST-IDENTIFIER))
 (1 1 (:REWRITE C::COMPUSTATEP-WHEN-COMPUSTATE-RESULTP-AND-NOT-ERRORP))
 )
(|g-RETURNS-VALUE|)
(C::|*PROGRAM*-g-CORRECT|
 (30067 61 (:REWRITE C::EXEC-BLOCK-ITEM-LIST-UNROLL))
 (1498 1123 (:REWRITE C::VALUEP-WHEN-ULONGP))
 (1498 1123 (:REWRITE C::VALUEP-WHEN-ULLONGP))
 (1498 1123 (:REWRITE C::VALUEP-WHEN-SLONGP))
 (1498 1123 (:REWRITE C::VALUEP-WHEN-SLLONGP))
 (1123 1123 (:REWRITE C::VALUEP-WHEN-POINTERP))
 (470 425 (:REWRITE C::NOT-SINTP-WHEN-USHORTP))
 (470 425 (:REWRITE C::NOT-SINTP-WHEN-ULONGP))
 (470 425 (:REWRITE C::NOT-SINTP-WHEN-ULLONGP))
 (470 425 (:REWRITE C::NOT-SINTP-WHEN-UINTP))
 (470 425 (:REWRITE C::NOT-SINTP-WHEN-UCHARP))
 (470 425 (:REWRITE C::NOT-SINTP-WHEN-SSHORTP))
 (470 425 (:REWRITE C::NOT-SINTP-WHEN-SLONGP))
 (470 425 (:REWRITE C::NOT-SINTP-WHEN-SLLONGP))
 (470 425 (:REWRITE C::NOT-SINTP-WHEN-SCHARP))
 (455 455 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-5))
 (452 336 (:REWRITE C::EXEC-STMT-UNROLL-1))
 (425 425 (:REWRITE C::NOT-SINTP-WHEN-POINTERP))
 (409 364 (:REWRITE C::NOT-SSHORTP-WHEN-ULONGP))
 (409 364 (:REWRITE C::NOT-SSHORTP-WHEN-ULLONGP))
 (409 364 (:REWRITE C::NOT-SSHORTP-WHEN-SLONGP))
 (409 364 (:REWRITE C::NOT-SSHORTP-WHEN-SLLONGP))
 (409 364 (:REWRITE C::NOT-SCHARP-WHEN-ULONGP))
 (409 364 (:REWRITE C::NOT-SCHARP-WHEN-ULLONGP))
 (409 364 (:REWRITE C::NOT-SCHARP-WHEN-SLONGP))
 (409 364 (:REWRITE C::NOT-SCHARP-WHEN-SLLONGP))
 (395 395 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-3))
 (395 395 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-2))
 (395 395 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-1))
 (395 395 (:REWRITE C::EXEC-EXPR-PURE-BASE-5))
 (395 395 (:REWRITE C::EXEC-EXPR-PURE-BASE-4))
 (395 395 (:REWRITE C::EXEC-EXPR-PURE-BASE-3))
 (364 364 (:REWRITE C::NOT-SSHORTP-WHEN-POINTERP))
 (364 364 (:REWRITE C::NOT-SCHARP-WHEN-POINTERP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-USHORT-ARRAYP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-ULONG-ARRAYP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-ULLONG-ARRAYP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-UINT-ARRAYP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-UCHAR-ARRAYP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-SSHORT-ARRAYP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-SLONG-ARRAYP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-SLLONG-ARRAYP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-SINT-ARRAYP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-SCOPE-LISTP))
 (304 304 (:REWRITE C::NOT-ERRORP-WHEN-SCHAR-ARRAYP))
 (303 303 (:REWRITE C::NOT-ERRORP-WHEN-VALUE-LISTP))
 (229 184 (:REWRITE C::NOT-USHORTP-WHEN-ULONGP))
 (229 184 (:REWRITE C::NOT-USHORTP-WHEN-ULLONGP))
 (229 184 (:REWRITE C::NOT-USHORTP-WHEN-SLONGP))
 (229 184 (:REWRITE C::NOT-USHORTP-WHEN-SLLONGP))
 (229 184 (:REWRITE C::NOT-UCHARP-WHEN-ULONGP))
 (229 184 (:REWRITE C::NOT-UCHARP-WHEN-ULLONGP))
 (229 184 (:REWRITE C::NOT-UCHARP-WHEN-SLONGP))
 (229 184 (:REWRITE C::NOT-UCHARP-WHEN-SLLONGP))
 (184 184 (:REWRITE C::NOT-USHORTP-WHEN-POINTERP))
 (184 184 (:REWRITE C::NOT-UCHARP-WHEN-POINTERP))
 (151 124 (:REWRITE C::NOT-UINTP-WHEN-ULONGP))
 (151 124 (:REWRITE C::NOT-UINTP-WHEN-ULLONGP))
 (151 124 (:REWRITE C::NOT-UINTP-WHEN-SLONGP))
 (151 124 (:REWRITE C::NOT-UINTP-WHEN-SLLONGP))
 (138 120 (:REWRITE C::NOT-SLONGP-WHEN-ULONGP))
 (138 120 (:REWRITE C::NOT-SLONGP-WHEN-ULLONGP))
 (138 120 (:REWRITE C::NOT-SLONGP-WHEN-SLLONGP))
 (138 120 (:REWRITE C::NOT-SLLONGP-WHEN-ULONGP))
 (138 120 (:REWRITE C::NOT-SLLONGP-WHEN-ULLONGP))
 (138 120 (:REWRITE C::NOT-SLLONGP-WHEN-SLONGP))
 (124 124 (:REWRITE C::NOT-UINTP-WHEN-POINTERP))
 (122 61 (:REWRITE C::EXEC-STMT-BASE-7))
 (122 61 (:REWRITE C::EXEC-STMT-BASE-5))
 (122 61 (:REWRITE C::EXEC-STMT-BASE-4))
 (120 120 (:REWRITE C::NOT-SLONGP-WHEN-POINTERP))
 (120 120 (:REWRITE C::NOT-SLLONGP-WHEN-POINTERP))
 (1 1 (:REWRITE C::EXEC-FUN-OF-CONST-IDENTIFIER))
 (1 1 (:REWRITE C::COMPUSTATEP-WHEN-COMPUSTATE-RESULTP-AND-NOT-ERRORP))
 )
(|h-RETURNS-VALUE|)
(C::|*PROGRAM*-h-CORRECT|
 (4218 2 (:REWRITE C::EXEC-BLOCK-ITEM-LIST-UNROLL))
 (314 290 (:REWRITE C::VALUEP-WHEN-ULONGP))
 (314 290 (:REWRITE C::VALUEP-WHEN-ULLONGP))
 (314 290 (:REWRITE C::VALUEP-WHEN-SLONGP))
 (314 290 (:REWRITE C::VALUEP-WHEN-SLLONGP))
 (290 290 (:REWRITE C::VALUEP-WHEN-POINTERP))
 (168 138 (:REWRITE C::NOT-SINTP-WHEN-USHORTP))
 (168 138 (:REWRITE C::NOT-SINTP-WHEN-ULONGP))
 (168 138 (:REWRITE C::NOT-SINTP-WHEN-ULLONGP))
 (168 138 (:REWRITE C::NOT-SINTP-WHEN-UINTP))
 (168 138 (:REWRITE C::NOT-SINTP-WHEN-UCHARP))
 (168 138 (:REWRITE C::NOT-SINTP-WHEN-SSHORTP))
 (168 138 (:REWRITE C::NOT-SINTP-WHEN-SLONGP))
 (168 138 (:REWRITE C::NOT-SINTP-WHEN-SLLONGP))
 (168 138 (:REWRITE C::NOT-SINTP-WHEN-SCHARP))
 (138 138 (:REWRITE C::NOT-SINTP-WHEN-POINTERP))
 (130 106 (:REWRITE C::NOT-SSHORTP-WHEN-ULONGP))
 (130 106 (:REWRITE C::NOT-SSHORTP-WHEN-ULLONGP))
 (130 106 (:REWRITE C::NOT-SSHORTP-WHEN-SLONGP))
 (130 106 (:REWRITE C::NOT-SSHORTP-WHEN-SLLONGP))
 (130 106 (:REWRITE C::NOT-SCHARP-WHEN-ULONGP))
 (130 106 (:REWRITE C::NOT-SCHARP-WHEN-ULLONGP))
 (130 106 (:REWRITE C::NOT-SCHARP-WHEN-SLONGP))
 (130 106 (:REWRITE C::NOT-SCHARP-WHEN-SLLONGP))
 (106 106 (:REWRITE C::NOT-SSHORTP-WHEN-POINTERP))
 (106 106 (:REWRITE C::NOT-SCHARP-WHEN-POINTERP))
 (80 56 (:REWRITE C::NOT-USHORTP-WHEN-ULONGP))
 (80 56 (:REWRITE C::NOT-USHORTP-WHEN-ULLONGP))
 (80 56 (:REWRITE C::NOT-USHORTP-WHEN-SLONGP))
 (80 56 (:REWRITE C::NOT-USHORTP-WHEN-SLLONGP))
 (80 56 (:REWRITE C::NOT-UCHARP-WHEN-ULONGP))
 (80 56 (:REWRITE C::NOT-UCHARP-WHEN-ULLONGP))
 (80 56 (:REWRITE C::NOT-UCHARP-WHEN-SLONGP))
 (80 56 (:REWRITE C::NOT-UCHARP-WHEN-SLLONGP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-USHORT-ARRAYP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-ULONG-ARRAYP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-ULLONG-ARRAYP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-UINT-ARRAYP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-UCHAR-ARRAYP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-SSHORT-ARRAYP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-SLONG-ARRAYP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-SLLONG-ARRAYP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-SINT-ARRAYP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-SCOPE-LISTP))
 (60 60 (:REWRITE C::NOT-ERRORP-WHEN-SCHAR-ARRAYP))
 (56 56 (:REWRITE C::NOT-USHORTP-WHEN-POINTERP))
 (56 56 (:REWRITE C::NOT-UCHARP-WHEN-POINTERP))
 (56 56 (:REWRITE C::NOT-ERRORP-WHEN-VALUE-LISTP))
 (52 40 (:REWRITE C::NOT-SLONGP-WHEN-ULONGP))
 (52 40 (:REWRITE C::NOT-SLONGP-WHEN-ULLONGP))
 (52 40 (:REWRITE C::NOT-SLONGP-WHEN-SLLONGP))
 (52 40 (:REWRITE C::NOT-SLLONGP-WHEN-ULONGP))
 (52 40 (:REWRITE C::NOT-SLLONGP-WHEN-ULLONGP))
 (52 40 (:REWRITE C::NOT-SLLONGP-WHEN-SLONGP))
 (48 36 (:REWRITE C::NOT-UINTP-WHEN-ULONGP))
 (48 36 (:REWRITE C::NOT-UINTP-WHEN-ULLONGP))
 (48 36 (:REWRITE C::NOT-UINTP-WHEN-SLONGP))
 (48 36 (:REWRITE C::NOT-UINTP-WHEN-SLLONGP))
 (40 40 (:REWRITE C::NOT-SLONGP-WHEN-POINTERP))
 (40 40 (:REWRITE C::NOT-SLLONGP-WHEN-POINTERP))
 (40 40 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-3))
 (40 40 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-2))
 (40 40 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-1))
 (40 40 (:REWRITE C::EXEC-EXPR-PURE-BASE-5))
 (40 40 (:REWRITE C::EXEC-EXPR-PURE-BASE-4))
 (40 40 (:REWRITE C::EXEC-EXPR-PURE-BASE-3))
 (36 36 (:REWRITE C::NOT-UINTP-WHEN-POINTERP))
 (16 12 (:REWRITE C::EXEC-STMT-UNROLL-2))
 (16 12 (:REWRITE C::EXEC-STMT-UNROLL-1))
 (4 2 (:REWRITE C::EXEC-STMT-BASE-7))
 (4 2 (:REWRITE C::EXEC-STMT-BASE-5))
 (4 2 (:REWRITE C::EXEC-STMT-BASE-4))
 (2 2 (:REWRITE OMAP::IN-BASE-1))
 (2 2 (:REWRITE C::EXEC-FUN-OF-CONST-IDENTIFIER))
 (2 2 (:REWRITE C::COMPUSTATEP-WHEN-COMPUSTATE-RESULTP-AND-NOT-ERRORP))
 )
(|i-RETURNS-VALUE|
 (2 2 (:TYPE-PRESCRIPTION |i|))
 )
(C::|*PROGRAM*-i-CORRECT|
 (40931 28 (:REWRITE C::EXEC-BLOCK-ITEM-LIST-UNROLL))
 (2096 1931 (:REWRITE C::VALUEP-WHEN-ULONGP))
 (2096 1931 (:REWRITE C::VALUEP-WHEN-ULLONGP))
 (2096 1931 (:REWRITE C::VALUEP-WHEN-SLONGP))
 (2096 1931 (:REWRITE C::VALUEP-WHEN-SLLONGP))
 (1931 1931 (:REWRITE C::VALUEP-WHEN-POINTERP))
 (944 833 (:REWRITE C::NOT-SINTP-WHEN-USHORTP))
 (944 833 (:REWRITE C::NOT-SINTP-WHEN-ULONGP))
 (944 833 (:REWRITE C::NOT-SINTP-WHEN-ULLONGP))
 (944 833 (:REWRITE C::NOT-SINTP-WHEN-UINTP))
 (944 833 (:REWRITE C::NOT-SINTP-WHEN-UCHARP))
 (944 833 (:REWRITE C::NOT-SINTP-WHEN-SSHORTP))
 (944 833 (:REWRITE C::NOT-SINTP-WHEN-SLONGP))
 (944 833 (:REWRITE C::NOT-SINTP-WHEN-SLLONGP))
 (944 833 (:REWRITE C::NOT-SINTP-WHEN-SCHARP))
 (833 833 (:REWRITE C::NOT-SINTP-WHEN-POINTERP))
 (796 691 (:REWRITE C::NOT-SSHORTP-WHEN-ULONGP))
 (796 691 (:REWRITE C::NOT-SSHORTP-WHEN-ULLONGP))
 (796 691 (:REWRITE C::NOT-SSHORTP-WHEN-SLONGP))
 (796 691 (:REWRITE C::NOT-SSHORTP-WHEN-SLLONGP))
 (796 691 (:REWRITE C::NOT-SCHARP-WHEN-ULONGP))
 (796 691 (:REWRITE C::NOT-SCHARP-WHEN-ULLONGP))
 (796 691 (:REWRITE C::NOT-SCHARP-WHEN-SLONGP))
 (796 691 (:REWRITE C::NOT-SCHARP-WHEN-SLLONGP))
 (691 691 (:REWRITE C::NOT-SSHORTP-WHEN-POINTERP))
 (691 691 (:REWRITE C::NOT-SCHARP-WHEN-POINTERP))
 (456 351 (:REWRITE C::NOT-USHORTP-WHEN-ULONGP))
 (456 351 (:REWRITE C::NOT-USHORTP-WHEN-ULLONGP))
 (456 351 (:REWRITE C::NOT-USHORTP-WHEN-SLONGP))
 (456 351 (:REWRITE C::NOT-USHORTP-WHEN-SLLONGP))
 (456 351 (:REWRITE C::NOT-UCHARP-WHEN-ULONGP))
 (456 351 (:REWRITE C::NOT-UCHARP-WHEN-ULLONGP))
 (456 351 (:REWRITE C::NOT-UCHARP-WHEN-SLONGP))
 (456 351 (:REWRITE C::NOT-UCHARP-WHEN-SLLONGP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-USHORT-ARRAYP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-ULONG-ARRAYP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-ULLONG-ARRAYP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-UINT-ARRAYP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-UCHAR-ARRAYP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-SSHORT-ARRAYP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-SLONG-ARRAYP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-SLLONG-ARRAYP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-SINT-ARRAYP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-SCOPE-LISTP))
 (401 401 (:REWRITE C::NOT-ERRORP-WHEN-SCHAR-ARRAYP))
 (395 395 (:REWRITE C::NOT-ERRORP-WHEN-VALUE-LISTP))
 (351 351 (:REWRITE C::NOT-USHORTP-WHEN-POINTERP))
 (351 351 (:REWRITE C::NOT-UCHARP-WHEN-POINTERP))
 (327 327 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-3))
 (327 327 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-2))
 (327 327 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-1))
 (327 327 (:REWRITE C::EXEC-EXPR-PURE-BASE-5))
 (327 327 (:REWRITE C::EXEC-EXPR-PURE-BASE-4))
 (327 327 (:REWRITE C::EXEC-EXPR-PURE-BASE-3))
 (320 260 (:REWRITE C::NOT-SLONGP-WHEN-ULONGP))
 (320 260 (:REWRITE C::NOT-SLONGP-WHEN-ULLONGP))
 (320 260 (:REWRITE C::NOT-SLONGP-WHEN-SLLONGP))
 (320 260 (:REWRITE C::NOT-SLLONGP-WHEN-ULONGP))
 (320 260 (:REWRITE C::NOT-SLLONGP-WHEN-ULLONGP))
 (320 260 (:REWRITE C::NOT-SLLONGP-WHEN-SLONGP))
 (266 221 (:REWRITE C::NOT-UINTP-WHEN-ULONGP))
 (266 221 (:REWRITE C::NOT-UINTP-WHEN-ULLONGP))
 (266 221 (:REWRITE C::NOT-UINTP-WHEN-SLONGP))
 (266 221 (:REWRITE C::NOT-UINTP-WHEN-SLLONGP))
 (260 260 (:REWRITE C::NOT-SLONGP-WHEN-POINTERP))
 (260 260 (:REWRITE C::NOT-SLLONGP-WHEN-POINTERP))
 (221 221 (:REWRITE C::NOT-UINTP-WHEN-POINTERP))
 (190 145 (:REWRITE C::EXEC-STMT-UNROLL-1))
 (52 28 (:REWRITE C::EXEC-STMT-BASE-7))
 (52 28 (:REWRITE C::EXEC-STMT-BASE-5))
 (52 28 (:REWRITE C::EXEC-STMT-BASE-4))
 (3 3 (:REWRITE OMAP::IN-BASE-1))
 (3 3 (:REWRITE C::EXEC-FUN-OF-CONST-IDENTIFIER))
 (3 3 (:REWRITE C::COMPUSTATEP-WHEN-COMPUSTATE-RESULTP-AND-NOT-ERRORP))
 )
(|j-RETURNS-VALUE|)
(C::|*PROGRAM*-j-CORRECT|
 (10944 12 (:REWRITE C::EXEC-BLOCK-ITEM-LIST-UNROLL))
 (724 700 (:REWRITE C::VALUEP-WHEN-ULONGP))
 (724 700 (:REWRITE C::VALUEP-WHEN-ULLONGP))
 (724 700 (:REWRITE C::VALUEP-WHEN-SLONGP))
 (724 700 (:REWRITE C::VALUEP-WHEN-SLLONGP))
 (700 700 (:REWRITE C::VALUEP-WHEN-POINTERP))
 (343 319 (:REWRITE C::NOT-SINTP-WHEN-USHORTP))
 (343 319 (:REWRITE C::NOT-SINTP-WHEN-ULONGP))
 (343 319 (:REWRITE C::NOT-SINTP-WHEN-ULLONGP))
 (343 319 (:REWRITE C::NOT-SINTP-WHEN-UINTP))
 (343 319 (:REWRITE C::NOT-SINTP-WHEN-UCHARP))
 (343 319 (:REWRITE C::NOT-SINTP-WHEN-SSHORTP))
 (343 319 (:REWRITE C::NOT-SINTP-WHEN-SLONGP))
 (343 319 (:REWRITE C::NOT-SINTP-WHEN-SLLONGP))
 (343 319 (:REWRITE C::NOT-SINTP-WHEN-SCHARP))
 (319 319 (:REWRITE C::NOT-SINTP-WHEN-POINTERP))
 (284 260 (:REWRITE C::NOT-SSHORTP-WHEN-ULONGP))
 (284 260 (:REWRITE C::NOT-SSHORTP-WHEN-ULLONGP))
 (284 260 (:REWRITE C::NOT-SSHORTP-WHEN-SLONGP))
 (284 260 (:REWRITE C::NOT-SSHORTP-WHEN-SLLONGP))
 (284 260 (:REWRITE C::NOT-SCHARP-WHEN-ULONGP))
 (284 260 (:REWRITE C::NOT-SCHARP-WHEN-ULLONGP))
 (284 260 (:REWRITE C::NOT-SCHARP-WHEN-SLONGP))
 (284 260 (:REWRITE C::NOT-SCHARP-WHEN-SLLONGP))
 (260 260 (:REWRITE C::NOT-SSHORTP-WHEN-POINTERP))
 (260 260 (:REWRITE C::NOT-SCHARP-WHEN-POINTERP))
 (162 162 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-5))
 (156 132 (:REWRITE C::NOT-USHORTP-WHEN-ULONGP))
 (156 132 (:REWRITE C::NOT-USHORTP-WHEN-ULLONGP))
 (156 132 (:REWRITE C::NOT-USHORTP-WHEN-SLONGP))
 (156 132 (:REWRITE C::NOT-USHORTP-WHEN-SLLONGP))
 (156 132 (:REWRITE C::NOT-UCHARP-WHEN-ULONGP))
 (156 132 (:REWRITE C::NOT-UCHARP-WHEN-ULLONGP))
 (156 132 (:REWRITE C::NOT-UCHARP-WHEN-SLONGP))
 (156 132 (:REWRITE C::NOT-UCHARP-WHEN-SLLONGP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-USHORT-ARRAYP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-ULONG-ARRAYP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-ULLONG-ARRAYP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-UINT-ARRAYP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-UCHAR-ARRAYP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-SSHORT-ARRAYP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-SLONG-ARRAYP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-SLLONG-ARRAYP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-SINT-ARRAYP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-SCOPE-LISTP))
 (148 148 (:REWRITE C::NOT-ERRORP-WHEN-SCHAR-ARRAYP))
 (146 146 (:REWRITE C::NOT-ERRORP-WHEN-VALUE-LISTP))
 (132 132 (:REWRITE C::NOT-USHORTP-WHEN-POINTERP))
 (132 132 (:REWRITE C::NOT-UCHARP-WHEN-POINTERP))
 (120 108 (:REWRITE C::NOT-SLONGP-WHEN-ULONGP))
 (120 108 (:REWRITE C::NOT-SLONGP-WHEN-ULLONGP))
 (120 108 (:REWRITE C::NOT-SLONGP-WHEN-SLLONGP))
 (120 108 (:REWRITE C::NOT-SLLONGP-WHEN-ULONGP))
 (120 108 (:REWRITE C::NOT-SLLONGP-WHEN-ULLONGP))
 (120 108 (:REWRITE C::NOT-SLLONGP-WHEN-SLONGP))
 (108 108 (:REWRITE C::NOT-SLONGP-WHEN-POINTERP))
 (108 108 (:REWRITE C::NOT-SLLONGP-WHEN-POINTERP))
 (108 108 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-3))
 (108 108 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-2))
 (108 108 (:REWRITE C::EXEC-EXPR-PURE-UNROLL-1))
 (108 108 (:REWRITE C::EXEC-EXPR-PURE-BASE-5))
 (108 108 (:REWRITE C::EXEC-EXPR-PURE-BASE-4))
 (108 108 (:REWRITE C::EXEC-EXPR-PURE-BASE-3))
 (90 78 (:REWRITE C::NOT-UINTP-WHEN-ULONGP))
 (90 78 (:REWRITE C::NOT-UINTP-WHEN-ULLONGP))
 (90 78 (:REWRITE C::NOT-UINTP-WHEN-SLONGP))
 (90 78 (:REWRITE C::NOT-UINTP-WHEN-SLLONGP))
 (78 78 (:REWRITE C::NOT-UINTP-WHEN-POINTERP))
 (52 46 (:REWRITE C::EXEC-STMT-UNROLL-1))
 (16 12 (:REWRITE C::EXEC-STMT-BASE-7))
 (16 12 (:REWRITE C::EXEC-STMT-BASE-5))
 (16 12 (:REWRITE C::EXEC-STMT-BASE-4))
 (2 2 (:REWRITE C::EXEC-FUN-OF-CONST-IDENTIFIER))
 (2 2 (:REWRITE C::COMPUSTATEP-WHEN-COMPUSTATE-RESULTP-AND-NOT-ERRORP))
 )
