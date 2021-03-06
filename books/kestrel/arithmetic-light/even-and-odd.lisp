; Theorems about evenness and oddness
;
; Copyright (C) 2008-2011 Eric Smith and Stanford University
; Copyright (C) 2013-2020 Kestrel Institute
;
; License: A 3-clause BSD license. See the file books/3BSD-mod.txt.
;
; Author: Eric Smith (eric.smith@kestrel.edu)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package "ACL2")

(local (include-book "kestrel/library-wrappers/arithmetic-top-with-meta" :dir :system))
(local (include-book "plus"))
(local (include-book "times"))
(local (include-book "integerp"))
(local (include-book "mod2"))
(local (include-book "kestrel/utilities/equal-of-booleans" :dir :system))

(in-theory (disable evenp oddp))

(defthm evenp-of-sum-when-evenp-arg1
  (implies (and (evenp x)
                (integerp x)
                (integerp y))
           (equal (evenp (+ x y))
                  (evenp y)))
  :hints (("Goal" :in-theory (enable evenp))))

;TODO: generalize this to allow any addend to be even
;TODO: might be expensive?
(defthm evenp-of-sum-when-evenp-arg2
  (implies (and (evenp x)
                (integerp x)
                (integerp y))
           (equal (evenp (+ y x))
                  (evenp y)))
  :hints (("Goal" :in-theory (enable evenp))))

(defthm evenp-reduce-alt3
  (implies (and (evenp x)
                (integerp x)
                (integerp y))
           (equal (evenp (+ y z x))
                  (evenp (+ y z))))
  :hints (("Goal" :in-theory (enable evenp))))

(defthm evenp-of-minus
  (equal (evenp (- x))
         (evenp x))
  :hints (("Goal" :in-theory (enable evenp))))

(defthmd evenp-of-one-more
  (implies (and (oddp x)
                (integerp x))
           (evenp (+ 1 x)))
  :hints (("Goal" :in-theory (enable evenp oddp))))

;wow, this isn't in the rtl even-odd book!
(defthm odd-plus-odd-is-even
  (implies (and (integerp x)
                (integerp y)
                (not (evenp x))
                (not (evenp y)))
           (evenp (+ x y)))
  :hints (("Goal"
           :use ((:instance evenp-of-one-more (x x))
                 (:instance evenp-of-one-more (x y))
                 (:instance integerp-of-+ (acl2::x (+ 1/2 (* 1/2 x))) (acl2::y (+ 1/2 (* 1/2 y))))
                 )
           :in-theory (e/d (evenp) (integerp-of-+)))))

(defthm evenp-reduce-odd-alt
  (implies (and (not (evenp x))
                (integerp x)
                (integerp y))
           (equal (evenp (+ y x))
                  (not (evenp y))))
  :hints (("Goal" :use (:instance odd-plus-odd-is-even)
           :in-theory (disable odd-plus-odd-is-even))))

(defthm evenp-reduce-odd
  (implies (and (not (evenp x))
                (integerp x)
                (integerp y))
           (equal (evenp (+ x y))
                  (not (evenp y))))
  :hints (("Goal" :use (:instance evenp-reduce-odd-alt)
           :in-theory (disable evenp-reduce-odd-alt))))

;FIXME can be expensive?
(defthm evenp-of-product-when-evenp
  (implies (and (evenp x)
                (integerp y))
           (evenp (* x y)))
  :hints (("Goal" :in-theory (enable evenp integerp-of-*-three))))

(defthm evenp-of-product-when-evenp-alt
  (implies (and (evenp x)
                (integerp y))
           (evenp (* y x)))
  :hints (("Goal" :use (:instance evenp-of-product-when-evenp)
           :in-theory (disable evenp-of-product-when-evenp))))

(defthmd odd-times-odd
  (implies (and (oddp x)
                (oddp y)
                (integerp x)
                (integerp y))
           (oddp (* x y)))
  :hints (("Goal"
           :use ((:instance integerp-of-* (x (+ 1/2 (* 1/2 x))) (y y))
                 (:instance evenp-of-one-more (x x)))
           :in-theory (e/d (evenp oddp) (integerp-of-*)))))



;when one factor is odd, the other factor determines the even/odd-ness of the product
(defthm odd-of-product-when-odd
  (implies (and (oddp x)
                (integerp x)
                (integerp y))
           (equal (oddp (* x y))
                  (oddp y)))
  :hints (("Goal" :use (:instance odd-times-odd))))

(defthm evenp-of-product-when-odd-alt
  (implies (and (oddp x)
                (integerp x)
                (integerp y))
           (equal (evenp (* y x))
                  (evenp y)))
  :hints (("Goal" :use (:instance odd-of-product-when-odd)
           :in-theory (disable odd-of-product-when-odd))))

;; (thm
;;  (IMPLIES (AND (INTEGERP X)
;;                (INTEGERP Y)
;;                )
;;           (equal (LOGBITP 31 (* X (BVCHOP 31 Y)))
;;                  (LOGBITP 31 (* X Y))))
;;  :hints (("Goal" :do-not '(generalize eliminate-destructors)
;;           :in-theory (enable logbitp bvchop mod))))
