;  abs-syscalls.lisp                                    Mihir Mehta

; This is a model of the FAT32 filesystem, related to HiFAT but with abstract
; variables.

(in-package "ACL2")

(include-book "absfat/abs-find-file-src")
(include-book "absfat/abs-alloc")
(include-book "absfat/path-clear")
(include-book "hifat-syscalls")
(local (include-book "std/lists/prefixp" :dir :system))
(local (include-book "std/lists/intersectp" :dir :system))

(local
 (in-theory
  (e/d
   (abs-file-p-when-m1-regular-file-p len-when-consp)
   ((:definition member-equal)
    (:definition intersection-equal)
    (:definition integer-listp)
    (:rewrite true-listp-when-string-list)
    (:linear position-equal-ac-when-member)
    (:linear position-when-member)
    (:rewrite nth-when->=-n-len-l)
    (:linear len-of-remove-assoc-1)
    (:definition position-equal-ac)
    (:definition remove1-assoc-equal)
    (:rewrite m1-directory-file-p-correctness-1)
    (:rewrite assoc-of-car-when-member)
    (:rewrite integerp-of-car-when-integer-listp)
    (:linear len-when-hifat-bounded-file-alist-p . 1)
    (:rewrite m1-file-p-of-cdar-when-m1-file-alist-p)
    (:rewrite natp-of-car-when-nat-listp)
    (:rewrite when-zp-src-of-1st-collapse-1)
    (:rewrite ctx-app-ok-of-abs-fs-fix-1)
    (:rewrite abs-addrs-of-ctx-app-1-lemma-2)
    (:rewrite abs-fs-fix-of-put-assoc-equal-lemma-2)
    (:rewrite hifat-file-alist-fix-guard-lemma-1)
    (:rewrite abs-file-alist-p-of-abs-file->contents)
    (:rewrite member-of-abs-fs-fix-when-natp)
    (:rewrite abs-find-file-helper-of-collapse-lemma-2)
    (:rewrite m1-file-alist-p-of-intersection-equal-2)
    (:rewrite absfat-subsetp-transitivity-lemma-5)
    (:rewrite
     abs-separate-of-frame->frame-of-collapse-this-lemma-7)
    (:linear 1st-complete-correctness-2)
    different-from-own-src-1
    (:rewrite m1-file-alist-p-when-subsetp-equal)
    (:rewrite stringp-when-nonempty-stringp)
    m1-file-alist-p-of-nthcdr
    take-of-len-free
    nth-when-prefixp take-of-too-many
    len-of-remove-assoc-2 nth-of-take
    no-duplicatesp-of-abs-addrs-of-remove-assoc-lemma-3
    hifat-no-dups-p-of-m1-file-contents-of-cdar
    abs-find-file-correctness-1-lemma-18
    (:rewrite abs-complete-when-stringp)
    (:rewrite hifat-place-file-correctness-3)
    (:rewrite
     fat32-filename-list-p-of-cdr-when-fat32-filename-list-p)
    (:rewrite dir-stream-table-p-when-subsetp-equal)
    (:rewrite
     abs-separate-of-frame->frame-of-collapse-this-lemma-8
     . 2)
    (:rewrite append-atom-under-list-equiv)
    (:rewrite abs-find-file-of-put-assoc-lemma-7 . 1)
    (:rewrite final-val-seq-of-collapse-this-lemma-5)
    (:rewrite abs-find-file-of-remove-assoc-1)
    (:rewrite abs-file-alist-p-of-abs-file-contents-fix)
    (:rewrite consp-of-remove-assoc-1)
    (:rewrite intersectp-when-subsetp)
    (:rewrite abs-addrs-of-ctx-app-list)
    (:rewrite str::consp-of-explode)
    (:rewrite
     collapse-1st-index-of-frame-val->src-of-cdr-of-assoc-linear-lemma-2)
    (:rewrite
     abs-find-file-correctness-1-lemma-40)
    (:rewrite consp-of-last)
    (:rewrite abs-find-file-correctness-lemma-14)
    (:rewrite fat32-filename-list-p-of-last)
    (:rewrite
     abs-separate-of-frame->frame-of-collapse-this-lemma-8
     . 1)
    (:linear len-of-remove-when-member-1)
    (:rewrite true-listp-when-abs-file-alist-p)
    len-when-hifat-bounded-file-alist-p
    (:rewrite ctx-app-ok-of-ctx-app-1)
    hifat-find-file-correctness-lemma-4
    (:rewrite abs-find-file-correctness-lemma-26)
    fat32-filename-list-p-of-remove
    (:rewrite
     abs-separate-of-collapse-this-lemma-1
     . 1)
    (:rewrite 1st-complete-under-path-when-atom-1)
    (:rewrite hifat-subsetp-when-atom)
    (:type-prescription
     final-val-seq-of-collapse-this-lemma-6)
    (:rewrite
     d-e-p-when-member-equal-of-d-e-list-p)
    (:rewrite
     1st-complete-under-path-of-frame->frame-of-partial-collapse-lemma-69)
    (:rewrite take-when-atom)
    (:rewrite absfat-subsetp-transitivity-lemma-2)
    (:definition set-difference-equal)
    (:rewrite abs-find-file-correctness-lemma-24)
    (:rewrite abs-find-file-correctness-lemma-15)
    (:rewrite abs-find-file-correctness-lemma-37)
    (:definition character-listp)
    (:rewrite valid-seqp-after-collapse-this-lemma-25)
    (:rewrite
     1st-complete-under-path-of-frame->frame-of-partial-collapse-lemma-57)
    (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-1)
    (:rewrite abs-find-file-correctness-lemma-40)
    (:definition binary-append)
    (:rewrite abs-addrs-of-ctx-app-1-lemma-4)
    (:rewrite hifat-find-file-correctness-lemma-6)
    abs-addrs-of-ctx-app-1-lemma-6
    abs-addrs-of-ctx-app-lemma-4
    (:rewrite abs-addrs-of-ctx-app)
    (:linear
     abs-separate-of-frame->frame-of-collapse-this-lemma-11)
    (:rewrite path-clear-partial-collapse-when-zp-src-lemma-17)
    (:rewrite
     abs-separate-of-collapse-this-lemma-7)
    (:rewrite 1st-complete-of-put-assoc-lemma-1)))))

(defund abs-no-dups-file-p (file)
  (declare (xargs :guard t))
  (or (m1-regular-file-p file)
      (and (abs-directory-file-p file)
           (abs-no-dups-p (abs-file->contents file)))))

(defthm
  abs-file-p-when-abs-no-dups-file-p
  (implies (abs-no-dups-file-p file)
           (abs-file-p file))
  :hints (("goal" :in-theory (enable abs-file-p-alt abs-no-dups-file-p))))

(defund
  abs-no-dups-file-fix (file)
  (if (not (abs-file-alist-p (abs-file->contents file)))
      (abs-file-fix file)
      (change-abs-file
       file
       :contents (abs-fs-fix (abs-file->contents file)))))

(defthm abs-no-dups-file-fix-of-abs-no-dups-file-fix
  (equal (abs-no-dups-file-fix (abs-no-dups-file-fix x))
         (abs-no-dups-file-fix x))
  :hints (("goal" :in-theory (enable abs-no-dups-file-fix))))

(defthm abs-no-dups-file-fix-when-abs-no-dups-file-p
  (implies (abs-no-dups-file-p x)
           (equal (abs-no-dups-file-fix x) x))
  :hints (("goal" :in-theory (enable abs-no-dups-file-fix abs-no-dups-file-p))))

(defthm
  abs-no-dups-file-p-of-abs-no-dups-file-fix
  (abs-no-dups-file-p (abs-no-dups-file-fix x))
  :hints
  (("goal"
    :in-theory (e/d (abs-no-dups-file-fix abs-no-dups-file-p abs-file-p-alt)
                    (abs-file-p-of-abs-file-fix))
    :use abs-file-p-of-abs-file-fix)))

(defthm abs-no-dups-file-p-of-m1-file-when-stringp-1
  (implies (stringp contents)
           (abs-no-dups-file-p (m1-file d-e contents)))
  :hints (("goal" :in-theory (enable abs-no-dups-file-p
                                     m1-file-contents-fix))))

(defund
  abs-no-dups-file-equiv (file1 file2)
  (cond ((and (abs-file-alist-p (abs-file->contents file1))
              (abs-file-alist-p (abs-file->contents file2)))
         (absfat-equiv (abs-file->contents file1)
                       (abs-file->contents file2)))
        ((and (stringp (abs-file->contents file1))
              (stringp (abs-file->contents file2)))
         (equal (abs-file->contents file1)
                (abs-file->contents file2)))
        (t nil)))

(defund abs-place-file-helper (fs path file)
  (declare (xargs :guard (and (abs-fs-p fs) (abs-no-dups-file-p file)
                              (fat32-filename-list-p path))
                  :measure (len path)))
  (b* ((fs (mbe :exec fs :logic (abs-fs-fix fs)))
       (file (mbe :exec file :logic (abs-no-dups-file-fix file)))
       ((unless (consp path)) (mv fs *enoent*))
       (name (fat32-filename-fix (car path)))
       (alist-elem (abs-assoc name fs))
       ((unless (consp alist-elem)) (if (consp (cdr path)) (mv fs *enoent*)
                                      (mv (abs-put-assoc name file fs) 0)))
       ((when (and (not (abs-directory-file-p (cdr alist-elem)))
                   (consp (cdr path))))
        (mv fs *enotdir*))
       ((when (and (not (abs-directory-file-p (cdr alist-elem)))
                   (abs-directory-file-p file)))
        (mv fs *eexist*))
       ((when (not (or (abs-directory-file-p (cdr alist-elem))
                       (consp (cdr path)) (abs-directory-file-p file)
                       (and (atom alist-elem) (>= (len fs) *ms-max-d-e-count*)))))
        (mv (abs-put-assoc name file fs) 0))
       ((when (not (or (m1-regular-file-p (cdr alist-elem))
                       (consp (cdr path)) (m1-regular-file-p file)
                       (and (atom alist-elem) (>= (len fs) *ms-max-d-e-count*)))))
        (mv (abs-put-assoc name file fs) 0))
       ((when (and (atom alist-elem) (>= (len fs) *ms-max-d-e-count*))) (mv fs *enospc*))
       ((mv new-contents error-code) (abs-place-file-helper (abs-file->contents (cdr alist-elem))
                                                            (cdr path) file)))
    (mv (abs-put-assoc name (make-abs-file :d-e (abs-file->d-e (cdr alist-elem))
                                           :contents new-contents)
                       fs)
        error-code)))

(defthm abs-file-alist-p-of-abs-place-file-helper
  (abs-file-alist-p (mv-nth 0 (abs-place-file-helper fs path file)))
  :hints (("goal" :in-theory (enable abs-place-file-helper))))

(defthm
  abs-no-dups-p-of-abs-file->contents-of-abs-no-dups-file-fix
  (abs-no-dups-p (abs-file->contents (abs-no-dups-file-fix file)))
  :hints (("goal" :in-theory (enable abs-no-dups-file-fix
                                     abs-file->contents abs-file-contents-fix
                                     abs-no-dups-p abs-file-contents-p
                                     abs-file abs-file-fix))))

(defthm
  abs-no-dups-p-of-abs-place-file-helper
  (abs-no-dups-p (mv-nth 0 (abs-place-file-helper fs path file)))
  :hints (("goal" :in-theory (enable abs-place-file-helper abs-no-dups-p)
           :induct (abs-place-file-helper fs path file))))

(defthm abs-fs-p-of-abs-place-file-helper
  (abs-fs-p (mv-nth 0 (abs-place-file-helper fs path file)))
  :hints (("goal" :in-theory (enable abs-fs-p))))

(defthmd abs-place-file-helper-of-fat32-filename-list-fix
  (equal
   (abs-place-file-helper fs (fat32-filename-list-fix path) file)
   (abs-place-file-helper fs path file))
  :hints (("goal" :in-theory (enable abs-place-file-helper))))

(defcong
  fat32-filename-list-equiv
  equal
  (abs-place-file-helper fs path file)
  2
  :hints (("Goal" :use
           (abs-place-file-helper-of-fat32-filename-list-fix
            (:instance
             abs-place-file-helper-of-fat32-filename-list-fix
             (path path-equiv))))))

(defthm
  subsetp-of-abs-addrs-of-abs-place-file-helper
  (implies
   (abs-complete (abs-file->contents (abs-no-dups-file-fix file)))
   (subsetp-equal (abs-addrs (mv-nth 0 (abs-place-file-helper fs path file)))
                  (abs-addrs (abs-fs-fix fs))))
  :hints (("goal" :in-theory (enable abs-place-file-helper)))
  :rule-classes
  (:rewrite
   (:rewrite
    :corollary
    (implies
     (and (abs-fs-p fs)
          (abs-complete (abs-file->contents (abs-no-dups-file-fix file))))
     (subsetp-equal
      (abs-addrs (mv-nth 0 (abs-place-file-helper fs path file)))
      (abs-addrs fs))))
   (:rewrite
    :corollary
    (implies (and
              (abs-complete (abs-file->contents (abs-no-dups-file-fix file)))
              (not (consp (abs-addrs (abs-fs-fix fs)))))
             (not
              (consp (abs-addrs (mv-nth 0 (abs-place-file-helper fs path file)))))))))

(defthm
  no-duplicatesp-of-abs-addrs-of-abs-place-file-helper
  (implies
   (and
    (no-duplicatesp-equal (abs-addrs (abs-fs-fix fs)))
    (abs-complete (abs-file->contents$inline (abs-no-dups-file-fix file))))
   (no-duplicatesp-equal
    (abs-addrs (mv-nth 0
                       (abs-place-file-helper fs path file)))))
  :hints (("goal" :in-theory (enable abs-place-file-helper
                                     (:REWRITE ABS-ADDRS-OF-CTX-APP-1-LEMMA-4)))))

(defund good-frame-p (frame)
  (b*
      (((mv & result) (collapse frame)))
    (and result
         (equal (frame-val->path (cdr (assoc-equal 0 frame)))
                nil)
         (consp (assoc-equal 0 frame))
         (equal (frame-val->src (cdr (assoc-equal 0 frame)))
                0)
         (frame-p frame)
         (no-duplicatesp-equal (strip-cars frame))
         (abs-separate frame)
         (subsetp-equal (abs-addrs (frame->root frame))
                        (frame-addrs-root (frame->frame frame))))))

;; I guess I should say that this function can only really do so much, and if
;; we try to use this in our proofs we'll kinda be back to representing
;; filesystem trees as... filesystem trees. When I say it can only do so much,
;; I mean that it can only help us do some refinement proofs, which will tie
;; lofat to hifat and hifat to absfat. Ultimately, I guess we'll want theorems
;; that use the collapse-equiv relation defined previously...
(defund frame-reps-fs
    (frame fs)
  (b*
      (((mv fs-equiv result) (collapse frame)))
    (and result
         (absfat-equiv fs-equiv fs)
         (frame-p frame)
         (abs-separate frame)
         (subsetp-equal
          (abs-addrs (frame->root frame))
          (frame-addrs-root (frame->frame frame)))
         (no-duplicatesp-equal (strip-cars frame))
         (atom (frame-val->path (cdr (assoc-equal 0 frame)))))))

(defcong absfat-equiv equal (frame-reps-fs frame fs) 2
  :hints (("Goal" :in-theory (enable frame-reps-fs))))

(thm (implies (good-frame-p frame)
              (frame-reps-fs frame (mv-nth 0 (collapse frame))))
     :hints (("goal" :in-theory (enable good-frame-p frame-reps-fs))))

(defund
  abs-place-file (frame path file)
  (declare
   (xargs :guard (and (frame-p frame)
                      (abs-no-dups-file-p file)
                      (fat32-filename-list-p path))
          :guard-hints (("Goal" :do-not-induct t) )))
  (b*
      (((when (atom frame))
        (mv frame *enoent*))
       (path (mbe :exec path
                      :logic (fat32-filename-list-fix path)))
       ((mv tail tail-error-code)
        (abs-place-file (cdr frame) path file))
       ((unless (and (equal tail-error-code *ENOENT*)
                     (prefixp (frame-val->path (cdar frame))
                              path)))
        (mv (list* (car frame) tail) tail-error-code))
       ;; Look up the parent directory - it has to be in one of the variables,
       ;; or else we must return ENOENT.
       ((mv & error-code)
        (abs-find-file-helper
         (frame-val->dir (cdar frame))
         (nthcdr (len (frame-val->path (cdar frame)))
                 (butlast path 1))))
       ((when (or (equal error-code *enoent*)
                  (not (abs-complete (frame-val->dir (cdar frame))))))
        (mv (list* (car frame) tail) tail-error-code))
       ((mv head head-error-code)
        (abs-place-file-helper (frame-val->dir (cdar frame)) path file)))
    (mv
     (list* (cons (caar frame) (change-frame-val (cdar frame)
                                                 :dir (abs-fs-fix head)))
            (cdr frame))
     head-error-code)))

(defthm
  hifat-place-file-correctness-lemma-4
  (implies
   (hifat-equiv x y)
   (equal (m1-regular-file-p (cdr (assoc-equal (fat32-filename-fix name)
                                               (hifat-file-alist-fix x))))
          (m1-regular-file-p (cdr (assoc-equal (fat32-filename-fix name)
                                               (hifat-file-alist-fix y))))))
  :hints (("goal" :do-not-induct t
           :in-theory (e/d (hifat-equiv)
                           (hifat-place-file-correctness-lemma-3))
           :use ((:instance hifat-place-file-correctness-lemma-3
                            (name (fat32-filename-fix name))
                            (x (hifat-file-alist-fix x))
                            (y (hifat-file-alist-fix y)))
                 (:instance hifat-place-file-correctness-lemma-3
                            (name (fat32-filename-fix name))
                            (x (hifat-file-alist-fix y))
                            (y (hifat-file-alist-fix x))))))
  :rule-classes
  :congruence)

(defthmd
  hifat-place-file-correctness-lemma-1
  (implies (and (m1-file-alist-p x)
                (m1-file-alist-p y)
                (hifat-no-dups-p x)
                (hifat-no-dups-p y)
                (hifat-subsetp x y)
                (hifat-subsetp y x)
                (hifat-no-dups-p (m1-file->contents file)))
           (and (hifat-subsetp (mv-nth 0 (hifat-place-file y path file))
                               (mv-nth 0 (hifat-place-file x path file)))
                (equal (mv-nth 1 (hifat-place-file y path file))
                       (mv-nth 1 (hifat-place-file x path file)))))
  :hints (("goal" :in-theory (enable hifat-place-file hifat-subsetp
                                     (:rewrite hifat-find-file-correctness-lemma-6)))))

(defthm
  hifat-place-file-correctness-4
  (implies
   (and (hifat-equiv m1-file-alist2 m1-file-alist1)
        (syntaxp (not (term-order m1-file-alist1 m1-file-alist2)))
        (hifat-no-dups-p (m1-file->contents file)))
   (and
    (equal (mv-nth 1
                   (hifat-place-file m1-file-alist1 path file))
           (mv-nth 1
                   (hifat-place-file m1-file-alist2 path file)))
    (hifat-equiv (mv-nth 0
                         (hifat-place-file m1-file-alist1 path file))
                 (mv-nth 0
                         (hifat-place-file m1-file-alist2 path file)))))
  :hints
  (("goal" :in-theory (enable hifat-place-file hifat-equiv)
    :use ((:instance (:rewrite hifat-place-file-correctness-lemma-1)
                     (x (hifat-file-alist-fix m1-file-alist2))
                     (file file)
                     (path path)
                     (y (hifat-file-alist-fix m1-file-alist1)))
          (:instance (:rewrite hifat-place-file-correctness-lemma-1)
                     (x (hifat-file-alist-fix m1-file-alist1))
                     (file file)
                     (path path)
                     (y (hifat-file-alist-fix m1-file-alist2))))
    :do-not-induct t)))

(defthm
  absfat-place-file-correctness-lemma-4
  (implies
   (subsetp-equal
    (abs-addrs root)
    (frame-addrs-root
     (cons (cons x
                 (frame-val nil
                            (put-assoc-equal (car (last path))
                                             file dir)
                            src))
           frame)))
   (subsetp-equal (abs-addrs root)
                  (frame-addrs-root (cons (cons x (frame-val 'nil dir src))
                                          frame))))
  :hints
  (("goal" :do-not-induct t
    :in-theory
    (e/d (hifat-equiv-when-absfat-equiv dist-names
                                        abs-separate frame-addrs-root)
         nil)))
  :otf-flg t)

(defthm
  absfat-place-file-correctness-lemma-5
  (implies
   (and
    (hifat-equiv
     (mv-nth
      0
      (collapse
       (frame-with-root
        root
        (cons (cons x
                    (frame-val nil
                               (put-assoc-equal (car (last path))
                                                file dir)
                               src))
              frame))))
     (mv-nth
      0
      (hifat-place-file
       fs nil
       (m1-file
        (m1-file->d-e
         (mv-nth
          0
          (hifat-find-file
           (mv-nth
            0
            (collapse (frame-with-root root
                                       (cons (cons x (frame-val nil dir src))
                                             frame))))
           nil)))
        (put-assoc-equal (car (last path))
                         file dir)))))
    (equal (mv-nth 1
                   (hifat-place-file fs nil
                                     (put-assoc-equal (car (last path))
                                                      file dir)))
           0))
   (hifat-equiv
    (mv-nth
     0
     (collapse
      (frame-with-root
       root
       (cons (cons x
                   (frame-val nil
                              (put-assoc-equal (car (last path))
                                               file dir)
                              src))
             frame))))
    (mv-nth 0 (hifat-place-file fs path file))))
  :instructions
  (:promote
   (:=
    (mv-nth
     0
     (collapse
      (frame-with-root
       root
       (cons (cons x
                   (frame-val nil
                              (put-assoc-equal (car (last path))
                                               file dir)
                              src))
             frame))))
    (mv-nth
     0
     (hifat-place-file
      fs nil
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth
           0
           (collapse (frame-with-root root
                                      (cons (cons x (frame-val nil dir src))
                                            frame))))
          nil)))
       (put-assoc-equal (car (last path))
                        file dir))))
    :equiv hifat-equiv)
   (:bash ("goal" :in-theory (enable hifat-place-file)))))

(defthm absfat-place-file-correctness-lemma-6
  (implies (and (abs-fs-p dir)
                (not (member-equal (car (last path))
                                   (names-at dir nil))))
           (not (consp (assoc-equal (car (last path))
                                    dir))))
  :hints (("goal" :in-theory (enable names-at))))

(defthm abs-file-p-when-m1-file-p
  (implies (m1-file-p file)
           (abs-file-p file))
  :hints (("goal" :cases ((abs-directory-file-p file)))))

(defthm
  m1-file-p-of-abs-file
  (equal (m1-file-p (abs-file d-e contents))
         (or (stringp (abs-file-contents-fix contents))
             (m1-file-alist-p contents)))
  :hints (("goal" :do-not-induct t
           :in-theory (enable m1-file-p abs-file abs-file-contents-fix
                              abs-file-contents-p
                              m1-file-contents-p))))

(defthm
  m1-file-alist-p-of-abs-place-file-helper
  (implies
   (and (abs-complete (abs-fs-fix fs))
        (m1-file-p (abs-no-dups-file-fix file)))
   (m1-file-alist-p (mv-nth 0
                            (abs-place-file-helper fs path file))))
  :hints (("goal" :in-theory (enable abs-place-file-helper))))

(defthm abs-place-file-helper-of-abs-fs-fix
  (equal (abs-place-file-helper (abs-fs-fix fs) path file)
         (abs-place-file-helper fs path file))
  :hints (("goal" :in-theory (enable abs-place-file-helper))))

(defthm abs-place-file-helper-of-abs-no-dups-file-fix
  (equal (abs-place-file-helper fs path (abs-no-dups-file-fix file))
         (abs-place-file-helper fs path file))
  :hints (("goal" :in-theory (enable abs-place-file-helper))))

(encapsulate
  ()

  (local
   (defthm
     lemma
     (implies (and (m1-file-alist-p fs)
                   (hifat-no-dups-p fs)
                   ;; This hypothesis is suboptimal... I know.
                   (m1-file-p file)
                   (abs-no-dups-file-p file))
              (equal (abs-place-file-helper fs path file)
                     (hifat-place-file fs path file)))
     :hints
     (("goal"
       :in-theory (enable abs-place-file-helper hifat-place-file
                          abs-file m1-file abs-file->d-e
                          m1-file->d-e abs-fs-p)
       :induct (abs-place-file-helper fs path file)))))

  (defthm
    abs-place-file-helper-correctness-1
    (implies (and (abs-complete (abs-fs-fix fs))
                  (m1-file-p (abs-no-dups-file-fix file)))
             (equal (abs-place-file-helper fs path file)
                    (hifat-place-file (abs-fs-fix fs)
                                      path (abs-no-dups-file-fix file))))
    :hints (("goal" :in-theory (disable lemma)
             :use (:instance lemma
                             (fs (abs-fs-fix fs))
                             (file (abs-no-dups-file-fix file)))))))

(defthm
  abs-top-addrs-of-abs-place-file-helper
  (equal (abs-top-addrs (mv-nth 0
                                (abs-place-file-helper fs path file)))
         (abs-top-addrs fs))
  :hints (("goal" :in-theory (enable abs-place-file-helper))))

(defthm
  addrs-at-of-abs-place-file-helper-lemma-1
  (implies (and (m1-file-p file)
                (or (m1-regular-file-p file)
                    (hifat-no-dups-p (m1-file->contents file))))
           (not (addrs-at (m1-file->contents file)
                          (cdr relpath))))
  :hints
  (("goal" :in-theory
    (e/d (m1-file-contents-p addrs-at m1-regular-file-p
                             m1-file-p m1-file->contents abs-fs-fix)
         (m1-file-contents-p-of-m1-file->contents))
    :use (:instance m1-file-contents-p-of-m1-file->contents
                    (x file))
    :do-not-induct t))
  :otf-flg t)

(defthm
  addrs-at-of-abs-place-file-helper-1
  (implies (and (abs-file-p file)
                (abs-no-dups-p (abs-file->contents file)))
           (equal (addrs-at (mv-nth 0
                                    (abs-place-file-helper fs path file))
                            relpath)
                  (if (and
                       (zp (mv-nth 1
                                   (abs-place-file-helper fs path file)))
                       (prefixp (fat32-filename-list-fix path)
                                (fat32-filename-list-fix relpath)))
                      (addrs-at (abs-file->contents (abs-no-dups-file-fix file))
                                (nthcdr (len path) relpath))
                    (addrs-at fs relpath))))
  :hints
  (("goal"
    :in-theory (enable abs-place-file-helper addrs-at)
    :induct (mv (fat32-filename-list-prefixp relpath path)
                (addrs-at fs relpath))
    :expand
    ((abs-place-file-helper fs path file)
     (addrs-at
      (put-assoc-equal
       (fat32-filename-fix (car path))
       (abs-file
        (abs-file->d-e
         (cdr (assoc-equal (fat32-filename-fix (car path))
                           fs)))
        (mv-nth
         0
         (abs-place-file-helper
          (abs-file->contents
           (cdr (assoc-equal (fat32-filename-fix (car path))
                             fs)))
          (cdr path)
          file)))
       fs)
      relpath)))))

(defthm natp-of-abs-place-file-helper
  (natp (mv-nth 1
                (abs-place-file-helper fs path file)))
  :hints (("goal" :in-theory (enable abs-place-file-helper)))
  :rule-classes :type-prescription)

(defthm abs-place-file-helper-correctness-2
  (implies (not (zp (mv-nth 1
                            (abs-place-file-helper fs path file))))
           (equal (mv-nth 0
                          (abs-place-file-helper fs path file))
                  (abs-fs-fix fs)))
  :hints (("goal" :in-theory (enable abs-place-file-helper))))

(encapsulate
  ()

  (local
   (defthmd lemma
     (implies
      (and (abs-file-p file)
           (abs-no-dups-p (abs-file->contents file)))
      (equal (ctx-app-ok (mv-nth 0
                                 (abs-place-file-helper fs path file))
                         x x-path)
             (if (and (zp (mv-nth 1
                                  (abs-place-file-helper fs path file)))
                      (prefixp (fat32-filename-list-fix path)
                               (fat32-filename-list-fix x-path)))
                 (ctx-app-ok (abs-file->contents (abs-no-dups-file-fix file))
                             x (nthcdr (len path) x-path))
               (ctx-app-ok fs x x-path))))
     :hints (("goal" :in-theory (enable ctx-app-ok)
              :do-not-induct t))
     :otf-flg t))

  (defthm
    ctx-app-ok-of-abs-place-file-helper-1
    (equal (ctx-app-ok (mv-nth 0 (abs-place-file-helper fs path file))
                       x x-path)
           (if (and (zp (mv-nth 1 (abs-place-file-helper fs path file)))
                    (prefixp (fat32-filename-list-fix path)
                             (fat32-filename-list-fix x-path)))
               (ctx-app-ok (abs-file->contents (abs-no-dups-file-fix file))
                           x (nthcdr (len path) x-path))
             (ctx-app-ok fs x x-path)))
    :hints (("goal" :use (:instance lemma
                                    (file (abs-no-dups-file-fix file)))))))

(defthm natp-of-abs-place-file-helper
  (natp (mv-nth 1
                (abs-place-file-helper fs path file)))
  :hints (("goal" :in-theory (enable abs-place-file-helper)))
  :rule-classes :type-prescription)

(defthm names-at-of-abs-place-file-helper-lemma-1
  (implies (and (abs-file-p file)
                (not (abs-directory-file-p file)))
           (not (names-at (abs-file->contents file)
                          (nthcdr 1 relpath))))
  :hints (("goal" :in-theory (enable names-at abs-directory-file-p
                                     abs-file-p abs-file->contents
                                     abs-file-contents-p abs-fs-fix)
           :do-not-induct t)))

(defthm
  names-at-of-abs-place-file-helper-lemma-2
  (implies (m1-regular-file-p file)
           (not (names-at (m1-file->contents file)
                          (nthcdr 1 relpath))))
  :hints (("goal" :in-theory (enable names-at
                                     abs-directory-file-p m1-regular-file-p
                                     abs-file-p abs-file->contents
                                     abs-file-contents-p abs-fs-fix)
           :do-not-induct t)))

(defthm names-at-of-abs-place-file-helper-lemma-5
  (implies (m1-regular-file-p file)
           (equal (strip-cars (abs-fs-fix (m1-file->contents file)))
                  nil))
  :hints (("goal" :do-not-induct t
           :in-theory (enable m1-regular-file-p
                              abs-file-p abs-file->contents
                              abs-fs-fix abs-file-contents-p))))

(defthmd names-at-of-abs-place-file-helper-lemma-6
  (implies (not (m1-regular-file-p (abs-no-dups-file-fix file)))
           (abs-directory-file-p (abs-no-dups-file-fix file)))
  :hints
  (("goal" :in-theory (e/d (abs-file-p-alt)
                           ((:rewrite abs-file-p-when-abs-no-dups-file-p)))
    :use (:instance (:rewrite abs-file-p-when-abs-no-dups-file-p)
                    (file (abs-no-dups-file-fix file))))))

(defthm
  names-at-of-abs-place-file-helper-1
  (equal (names-at (mv-nth 0 (abs-place-file-helper fs path file))
                   relpath)
         (cond ((not (zp (mv-nth 1
                                 (abs-place-file-helper fs path file))))
                (names-at fs relpath))
               ((fat32-filename-list-prefixp path relpath)
                (names-at (abs-file->contents (abs-no-dups-file-fix file))
                          (nthcdr (len path) relpath)))
               ((and (fat32-filename-list-equiv relpath (butlast path 1))
                     (not (member-equal (fat32-filename-fix (car (last path)))
                                        (names-at fs relpath))))
                (append (names-at fs relpath)
                        (list (fat32-filename-fix (car (last path))))))
               (t (names-at fs relpath))))
  :hints
  (("goal"
    :in-theory
    (e/d (abs-place-file-helper names-at fat32-filename-list-fix
                                fat32-filename-list-equiv
                                fat32-filename-equiv
                                names-at-of-abs-place-file-helper-lemma-6)
         ((:definition put-assoc-equal)
          (:rewrite ctx-app-ok-when-absfat-equiv-lemma-3)
          (:definition abs-complete)
          (:rewrite hifat-find-file-correctness-1-lemma-1)
          (:type-prescription assoc-equal-when-frame-p)
          (:definition assoc-equal)
          (:definition no-duplicatesp-equal)
          (:rewrite m1-file-alist-p-when-subsetp-equal)))
    :induct (mv (fat32-filename-list-prefixp relpath path)
                (names-at fs relpath))
    :expand (abs-place-file-helper fs path file))))

;; This is based on collapse-hifat-place-file-2, which relies on the lemma
;; collapse-hifat-place-file-lemma-6. That lemma would probably have to be tweaked to
;; deal with all the path appending stuff, which I'm skipping over for now.
(skip-proofs
 (defthm
   collapse-hifat-place-file-2
   (implies
    (and
     (m1-file-p file)
     (or (m1-regular-file-p file)
         (hifat-no-dups-p (m1-file->contents file)))
     (dist-names (frame->root (frame-with-root root frame))
                 nil
                 (frame->frame (frame-with-root root frame)))
     (abs-separate (frame->frame (frame-with-root root frame)))
     (frame-p (frame->frame (frame-with-root root frame)))
     (no-duplicatesp-equal
      (strip-cars (frame->frame (frame-with-root root frame))))
     (consp (assoc-equal x frame)))
    (equal
     (collapse
      (frame-with-root
       root
       (put-assoc-equal
        x
        (frame-val
         (frame-val->path (cdr (assoc-equal x frame)))
         (mv-nth
          0
          (abs-place-file-helper
           (frame-val->dir (cdr (assoc-equal x frame)))
           path file))
         (frame-val->src (cdr (assoc-equal x frame))))
        frame)))
     (mv
      (mv-nth
       0
       (abs-place-file-helper
        (mv-nth 0
                (collapse (frame-with-root root frame)))
        (append (frame-val->path (cdr (assoc-equal x frame)))
                path)
        file))
      (mv-nth 1
              (collapse (frame-with-root root frame))))))))

(defund abs-lstat (frame path)
  (declare
   (xargs
    :guard (and (fat32-filename-list-p path)
                (frame-p frame))
    :guard-debug t
    :guard-hints
    (("goal"
      :in-theory (e/d (abs-file-p-alt)
                      ((:rewrite abs-file-p-of-abs-find-file)))
      :use (:rewrite abs-file-p-of-abs-find-file)))))
  (b* (((mv file errno)
        (abs-find-file frame path))
       ((when (not (equal errno 0)))
        (mv (make-struct-stat) -1 errno))
       (st_size (if (abs-directory-file-p file)
                    *ms-max-dir-size*
                  (length (abs-file->contents file)))))
    (mv (make-struct-stat :st_size st_size)
        0 0)))

(defthm
  abs-lstat-refinement-lemma-1
  (implies (stringp (m1-file->contents (mv-nth 0 (hifat-find-file fs path))))
           (m1-regular-file-p (mv-nth '0 (hifat-find-file fs path)))))

(encapsulate
  ()

  (local
   (defthmd
     lemma
     (implies
      (and
       (frame-reps-fs frame fs)
       (abs-fs-p fs)
       (m1-file-alist-p fs)
       (consp (assoc-equal 0 frame))
       (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
       (frame-p frame)
       (no-duplicatesp-equal (strip-cars frame))
       (subsetp-equal (abs-addrs (frame->root frame))
                      (frame-addrs-root (frame->frame frame)))
       (abs-separate frame)
       (abs-complete (abs-file->contents (mv-nth 0 (abs-find-file frame path)))))
      (equal (abs-lstat frame path)
             (hifat-lstat fs path)))
     :hints (("goal" :do-not-induct t
              :in-theory (enable abs-lstat frame-reps-fs hifat-lstat)))))

  (defthm
    abs-lstat-refinement
    (implies
     (and
      (consp (assoc-equal 0 frame))
      (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
      (frame-p frame)
      (no-duplicatesp-equal (strip-cars frame))
      (abs-complete (abs-file->contents (mv-nth 0 (abs-find-file frame path))))
      (frame-reps-fs frame fs)
      (abs-fs-p fs))
     (equal (abs-lstat frame path)
            (hifat-lstat fs path)))
    :hints (("goal" :do-not-induct t
             :in-theory (enable frame-reps-fs)
             :use lemma))))

(defthm absfat-place-file-correctness-lemma-1
  (implies (m1-regular-file-p file)
           (abs-no-dups-file-p file))
  :hints (("goal" :in-theory (enable abs-no-dups-file-p))))

(defthm
  frame-p-of-abs-place-file
  (implies (frame-p frame)
           (frame-p (mv-nth 0 (abs-place-file
                               frame
                               path
                               file))))
  :hints (("Goal" :in-theory (enable abs-place-file))))

(defund
  abs-remove-file (frame path)
  (declare
   (xargs :guard (and (frame-p frame)
                      (fat32-filename-list-p path))
          :guard-hints (("Goal" :do-not-induct t) )))
  (b*
      (((when (atom frame))
        (mv frame *enoent*))
       (path (mbe :exec path
                      :logic (fat32-filename-list-fix path)))
       ((mv tail tail-error-code)
        (abs-remove-file (cdr frame) path))
       ((unless (and (equal tail-error-code *ENOENT*)
                     (prefixp (frame-val->path (cdar frame))
                              path)))
        (mv (list* (car frame) tail) tail-error-code))
       ;; Look up the parent directory - it has to be in one of the variables,
       ;; or else we must return ENOENT.
       ((mv & error-code)
        (abs-find-file-helper
         (frame-val->dir (cdar frame))
         (nthcdr (len (frame-val->path (cdar frame)))
                 (butlast path 1))))
       ((when (or (equal error-code *enoent*)
                  (not (abs-complete (frame-val->dir (cdar frame))))))
        (mv (list* (car frame) tail) tail-error-code))
       ((mv head head-error-code)
        (hifat-remove-file (frame-val->dir (cdar frame)) path)))
    (mv
     (list* (cons (caar frame) (change-frame-val (cdar frame) :dir head))
            (cdr frame))
     head-error-code)))

(defthm abs-mkdir-guard-lemma-1
  (implies (consp (assoc-equal 0 frame))
           (consp (assoc-equal 0 (partial-collapse frame path))))
  :hints (("goal" :in-theory (enable partial-collapse))))

(defthm abs-mkdir-guard-lemma-2
  (implies (abs-no-dups-p fs)
           (no-duplicatesp-equal (remove-equal nil (strip-cars fs))))
  :hints (("goal" :in-theory (enable abs-no-dups-p))))

(defthm
  abs-mkdir-guard-lemma-3
  (implies
   (abs-directory-file-p (mv-nth 0 (abs-find-file frame path)))
   (abs-no-dups-p
    (abs-file->contents (mv-nth 0 (abs-find-file frame path)))))
  :hints (("goal" :in-theory (enable abs-find-file))))

;; OK, here's the plan for defining abs-mkdir. We can proooobably get rid of
;; abs-place-file and abs-remove-file, since those tasks are going to be
;; accomplished by first bringing the parent directory to the front and then
;; doing a put-assoc or a remove-assoc respectively.
(defund abs-mkdir (frame path)
  (declare (xargs :guard (and (frame-p frame)
                              (consp (assoc-equal 0 frame))
                              (fat32-filename-list-p path)
                              (no-duplicatesp-equal (strip-cars frame)))
                  :guard-debug t
                  :guard-hints
                  (("goal"
                    :in-theory (enable abs-find-file-helper abs-fs-p)))))
  (b*
      ((path (mbe :exec path :logic (fat32-filename-list-fix path)))
       (dirname (dirname path)) (frame (partial-collapse frame dirname))
       ;; After partial-collapse, either the parent directory is there in one
       ;; variable, or it isn't there at all.
       ((mv parent-dir error-code) (abs-find-file frame dirname))
       ((unless (or (atom dirname) (and (zp error-code) (abs-directory-file-p parent-dir))))
        (mv frame -1 *enoent*))
       (src (abs-find-file-src frame dirname))
       (new-index (find-new-index
                   ;; Using this, not (strip-cars (frame->frame frame)), to make
                   ;; sure we don't get a zero.
                   (strip-cars frame)))
       ;; It's not even a matter of removing that thing - we need to leave a
       ;; body address in its place...
       ((mv var new-src-dir)
        (abs-alloc (frame-val->dir (cdr (assoc-equal src frame)))
                   (nthcdr (len (frame-val->path (cdr (assoc-equal src frame)))) dirname)
                   new-index))
       ;; Check somewhere that (basename path) is not already present...
       ((unless (consp path)) (mv frame -1 *enoent*))
       ((when (consp (abs-assoc (basename path) var))) (mv frame -1 *eexist*))
       (frame (put-assoc-equal src (change-frame-val (cdr (assoc-equal src frame))
                                                     :dir new-src-dir)
                               frame))
       (new-var (abs-put-assoc (basename path)
                               (make-abs-file :contents nil
                                              :d-e (d-e-install-directory-bit
                                                        (d-e-fix nil) t))
                               var))
       (frame
        (frame-with-root (frame->root frame)
                         (cons (cons new-index
                                     (frame-val dirname
                                                new-var src))
                               (frame->frame frame)))))
    (mv frame 0 0)))

;; An example demonstrating that both ways of doing mkdir work out the same:
(assert-event
 (equal
  (b*
      ((fs (list (cons (implode (name-to-fat32-name (explode "tmp")))
                       (make-m1-file :contents nil))))
       (frame (frame-with-root fs nil))
       (result1 (frame-reps-fs frame fs))
       ((mv frame & &) (abs-mkdir frame (path-to-fat32-path (explode "/tmp/docs"))))
       ((mv frame error-code result3)
        (abs-mkdir frame
                   (path-to-fat32-path (explode "/tmp/docs/pdf-docs"))))
       ((mv frame result4) (collapse frame)))
    (list (m1-file-alist-p fs) result1 error-code result3 frame
          result4))
  '(T
    T 0 0
    (("TMP        "
      (D-E 0 0 0 0 0 0 0 0 0 0 0 0
               0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (CONTENTS
       ("DOCS       "
        (D-E 0 0 0 0 0 0 0 0 0 0 0 16
                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
        (CONTENTS
         ("PDF-DOCS   " (D-E 0 0 0 0 0 0 0 0 0 0 0 16
                                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
          (CONTENTS)))))))
    T)))

(assert-event
 (equal
  (b*
      ((fs (list (cons (implode (name-to-fat32-name (explode "tmp")))
                       (make-m1-file :contents nil))))
       ((mv fs & &) (hifat-mkdir fs (path-to-fat32-path (explode "/tmp/docs"))))
       ((mv fs & &)
        (hifat-mkdir fs
                     (path-to-fat32-path (explode "/tmp/docs/pdf-docs")))))
    (list fs))
  '((("TMP        "
      (D-E 0 0 0 0 0 0 0 0 0 0 0 0
               0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (CONTENTS
       ("DOCS       "
        (D-E 0 0 0 0 0 0 0 0 0 0 0 16
                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
        (CONTENTS
         ("PDF-DOCS   " (D-E 0 0 0 0 0 0 0 0 0 0 0 16
                                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
          (CONTENTS))))))))))

(defthm
  abs-mkdir-correctness-lemma-8
  (not (consp (assoc-equal (find-new-index (strip-cars alist))
                           alist)))
  :hints (("goal" :in-theory (disable member-of-strip-cars)
           :use (:instance member-of-strip-cars
                           (x (find-new-index (strip-cars alist))))))
  :rule-classes (:rewrite :type-prescription))

(defthm
  abs-mkdir-correctness-lemma-9
  (implies
   (consp (assoc-equal 0 alist))
   (not (equal (find-new-index (strip-cars alist)) 0)))
  :hints (("Goal" :in-theory
           (disable
            abs-mkdir-correctness-lemma-8)
           :use
           abs-mkdir-correctness-lemma-8))
  :rule-classes
  (:rewrite
   (:linear
    :corollary
    (implies
     (consp (assoc-equal 0 alist))
     (< 0 (find-new-index (strip-cars alist)))))
   (:type-prescription
    :corollary
    (implies
     (consp (assoc-equal 0 alist))
     (< 0 (find-new-index (strip-cars alist)))))))

(defthm abs-mkdir-correctness-lemma-11
  (equal (frame->root (put-assoc-equal 0 val frame))
         (frame-val->dir val))
  :hints (("goal" :do-not-induct t
           :in-theory (enable frame->root))))

(defthm abs-mkdir-correctness-lemma-12
  (equal (frame->frame (put-assoc-equal 0 val frame))
         (frame->frame frame))
  :hints (("goal" :do-not-induct t
           :in-theory (enable frame->frame))))

(defthmd
  abs-mkdir-correctness-lemma-16
  (implies (not (consp (dirname path)))
           (equal (dirname path) nil))
  :hints (("goal" :in-theory (enable dirname)))
  :rule-classes
  (:rewrite
   (:rewrite
    :corollary
    (implies (zp (len (dirname path)))
             (equal (dirname path) nil))
    :hints (("goal" :in-theory (disable len-of-dirname))))))

(defthm
  abs-mkdir-correctness-lemma-18
  (implies
   (and (no-duplicatesp-equal (strip-cars frame))
        (frame-p frame)
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
        (mv-nth 1 (collapse frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame))))
   (hifat-equiv
    (mv-nth 0
            (collapse (partial-collapse frame (dirname path))))
    (mv-nth 0 (collapse frame))))
  :hints
  (("goal" :in-theory (disable (:rewrite partial-collapse-correctness-1 . 1))
    :use (:instance (:rewrite partial-collapse-correctness-1 . 1)
                    (path (dirname path))
                    (frame frame)))))

(defthm
  abs-mkdir-correctness-lemma-20
  (ctx-app-ok
   (list (find-new-index
          (strip-cars (partial-collapse frame (dirname path)))))
   (find-new-index
    (strip-cars (partial-collapse frame (dirname path))))
   nil)
  :hints (("goal" :in-theory (enable ctx-app-ok addrs-at abs-fs-fix)
           :do-not-induct t)))

;; This is useless and has a free variable...
(defthmd
  abs-mkdir-correctness-lemma-25
  (implies
   (and
    (fat32-filename-list-prefixp x y)
    (zp (mv-nth 1 (abs-find-file-helper fs x)))
    (not
     (consp
      (abs-addrs
       (abs-file->contents (mv-nth 0 (abs-find-file-helper fs x)))))))
   (not (consp (addrs-at fs y))))
  :hints
  (("goal" :in-theory
    (e/d (abs-find-file-helper addrs-at fat32-filename-list-prefixp)
         (ctx-app-ok-when-abs-complete-lemma-4))
    :induct (mv (fat32-filename-list-prefixp x y)
                (mv-nth 0 (abs-find-file-helper fs x))))
   ("subgoal *1/1'''"
    :use
    (:instance
     ctx-app-ok-when-abs-complete-lemma-4
     (fs (abs-file->contents (cdr (assoc-equal (fat32-filename-fix (car x))
                                               (abs-fs-fix fs)))))
     (relpath (cdr y))))))

(defthm
  abs-mkdir-correctness-lemma-26
  (implies
   (and (consp (assoc-equal 0 frame))
        (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
        (mv-nth 1 (collapse frame))
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (abs-separate frame))
   (equal
    (abs-directory-file-p (mv-nth 0 (abs-find-file frame path)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  path)))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d
     (abs-file-p-alt)
     (abs-file-p-of-abs-find-file (:rewrite m1-regular-file-p-correctness-1)
                                  m1-directory-file-p-when-m1-file-p
                                  abs-find-file-correctness-2))
    :use
    (abs-file-p-of-abs-find-file
     abs-find-file-correctness-2
     (:instance (:rewrite m1-regular-file-p-correctness-1)
                (file (mv-nth 0
                              (hifat-find-file (mv-nth 0 (collapse frame))
                                               path)))))))
  :rule-classes
  (:rewrite
   (:rewrite
    :corollary
    (implies
     (and
      (consp (assoc-equal 0 frame))
      (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
      (mv-nth 1 (collapse frame))
      (frame-p frame)
      (no-duplicatesp-equal (strip-cars frame))
      (subsetp-equal (abs-addrs (frame->root frame))
                     (frame-addrs-root (frame->frame frame)))
      (abs-separate frame)
      (abs-complete (abs-file->contents (mv-nth 0 (abs-find-file frame path)))))
     (equal (m1-directory-file-p (mv-nth 0 (abs-find-file frame path)))
            (m1-directory-file-p
             (mv-nth 0
                     (hifat-find-file (mv-nth 0 (collapse frame))
                                      path))))))))

(defthm
  abs-mkdir-correctness-lemma-27
  (not
   (intersectp-equal
    (names-at
     (frame-val->dir
      (cdr (assoc-equal 0
                        (partial-collapse frame (dirname path)))))
     nil)
    (names-at
     (list
      (find-new-index
       (strip-cars (partial-collapse frame (dirname path)))))
     nil)))
  :hints (("goal" :in-theory (enable names-at abs-fs-fix)
           :do-not-induct t)))

(defthm abs-mkdir-correctness-lemma-29
  (implies (atom n)
           (dist-names (list n) relpath frame))
  :hints (("goal" :in-theory (enable names-at abs-fs-fix dist-names))))

(defthm
  abs-mkdir-correctness-lemma-78
  (implies (natp n)
           (ctx-app-ok (list n) n nil))
  :hints (("goal" :in-theory (enable ctx-app-ok addrs-at abs-fs-fix)
           :do-not-induct t)))

(defthm abs-mkdir-correctness-lemma-79
  (implies (not (consp (frame->frame frame)))
           (dist-names (frame->root frame)
                       nil (remove-assoc-equal 0 frame)))
  :hints (("goal" :in-theory (enable frame->frame))))

(defthm
  abs-mkdir-correctness-lemma-40
  (implies
   (and (no-duplicatesp-equal (strip-cars frame))
        (frame-p frame)
        (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame))))
   (subsetp-equal
    (abs-addrs
     (frame-val->dir$inline
      (cdr (assoc-equal 0
                        (partial-collapse frame (dirname path))))))
    (frame-addrs-root
     (frame->frame (partial-collapse frame (dirname path))))))
  :hints
  (("goal"
    :do-not-induct t
    :cases
    ((not
      (equal
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (frame->root (partial-collapse frame (dirname path)))))))
   ("subgoal 1" :in-theory (enable frame->root))))

(defthm
  abs-mkdir-correctness-lemma-41
  (implies (not (zp (abs-find-file-src frame path)))
           (consp (assoc-equal (abs-find-file-src frame path)
                               (frame->frame frame))))
  :hints
  (("goal" :in-theory (e/d (frame->frame)
                           ((:rewrite abs-find-file-src-correctness-1)))
    :use (:rewrite abs-find-file-src-correctness-1))))

(defthm
  abs-mkdir-correctness-lemma-42
  (implies
   (and
    (no-duplicatesp-equal (strip-cars frame))
    (frame-p frame)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (not
     (equal 0
            (abs-find-file-src
             (partial-collapse frame (dirname path))
             (dirname path)))))
   (subsetp-equal
    (abs-addrs
     (frame->root (partial-collapse frame (dirname path))))
    (frame-addrs-root
     (put-assoc-equal
      (abs-find-file-src
       (partial-collapse frame (dirname path))
       (dirname path))
      (frame-val
       (frame-val->path
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse frame (dirname path))
           (dirname path))
          frame)))
       (mv-nth
        1
        (abs-alloc
         (frame-val->dir
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse frame (dirname path))
             (dirname path))
            (partial-collapse frame (dirname path)))))
         (nthcdr
          (len
           (frame-val->path
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse frame (dirname path))
               (dirname path))
              frame))))
          (dirname path))
         (find-new-index
          (strip-cars
           (partial-collapse frame (dirname path))))))
       (frame-val->src
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse frame (dirname path))
           (dirname path))
          frame))))
      (frame->frame
       (partial-collapse frame (dirname path)))))))
  :hints
  (("goal"
    :cases
    ((not
      (and
       (consp
        (assoc-equal
         (abs-find-file-src
          (partial-collapse frame (dirname path))
          (dirname path))
         (frame->frame
          (partial-collapse frame (dirname path)))))
       (equal
        (frame-val->src
         (frame-val
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse frame (dirname path))
              (dirname path))
             frame)))
          (mv-nth
           1
           (abs-alloc
            (frame-val->dir
             (cdr
              (assoc-equal
               (abs-find-file-src
                (partial-collapse frame (dirname path))
                (dirname path))
               (partial-collapse frame (dirname path)))))
            (nthcdr
             (len
              (frame-val->path
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse frame (dirname path))
                  (dirname path))
                 frame))))
             (dirname path))
            (find-new-index
             (strip-cars
              (partial-collapse frame (dirname path))))))
          (frame-val->src
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse frame (dirname path))
              (dirname path))
             frame)))))
        (frame-val->src
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse frame (dirname path))
            (dirname path))
           (frame->frame
            (partial-collapse frame (dirname path))))))))))
    :do-not-induct t)
   ("subgoal 1" :in-theory (enable frame->frame))))

(defthm
  abs-mkdir-correctness-lemma-45
  (implies
   (and (no-duplicatesp-equal (strip-cars frame))
        (frame-p frame)
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
        (abs-separate frame))
   (dist-names
    (frame-val->dir$inline
     (cdr (assoc-equal 0
                       (partial-collapse frame (dirname path)))))
    nil
    (frame->frame (partial-collapse frame (dirname path)))))
  :hints
  (("goal"
    :cases
    ((not
      (equal
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (frame->root (partial-collapse frame (dirname path)))))))
   ("subgoal 1" :in-theory (enable frame->root))))

(defthm
  abs-mkdir-correctness-lemma-46
  (implies
   (and
    (no-duplicatesp-equal (strip-cars frame))
    (frame-p frame)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
    (abs-separate frame)
    (not
     (equal
      0
      (abs-find-file-src (partial-collapse frame (dirname path))
                         (dirname path)))))
   (dist-names
    (frame-val->dir$inline
     (cdr
      (assoc-equal
       (abs-find-file-src (partial-collapse frame (dirname path))
                          (dirname path))
       (partial-collapse frame (dirname path)))))
    (frame-val->path$inline
     (cdr
      (assoc-equal
       (abs-find-file-src (partial-collapse frame (dirname path))
                          (dirname path))
       frame)))
    (remove-assoc-equal
     (abs-find-file-src (partial-collapse frame (dirname path))
                        (dirname path))
     (frame->frame (partial-collapse frame (dirname path))))))
  :hints
  (("goal"
    :in-theory (e/d (frame->frame)
                    (abs-separate-of-frame->frame-of-collapse-this-lemma-2))
    :use
    (:instance
     abs-separate-of-frame->frame-of-collapse-this-lemma-2
     (x (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path)))
     (frame
      (frame->frame (partial-collapse frame (dirname path))))))))

;; It's not hard to imagine a scenario where the first corollary might be
;; needed, even though accumulated-persistence says it is useless.
(defthm
  abs-mkdir-correctness-lemma-47
  (implies
   (and (zp (mv-nth 1 (abs-find-file-helper fs path)))
        (abs-directory-file-p (mv-nth 0 (abs-find-file-helper fs path)))
        (not (member-equal (nfix new-index)
                           (abs-addrs (abs-fs-fix fs)))))
   (not (equal (mv-nth 1 (abs-alloc fs path new-index))
               (abs-fs-fix fs))))
  :hints
  (("goal"
    :in-theory
    (e/d (abs-find-file-helper abs-alloc fat32-filename-list-fix)
         (ctx-app-ok-when-abs-complete-lemma-2 nfix))
    :expand
    ((:with
      put-assoc-equal-without-change
      (equal
       (put-assoc-equal
        (car path)
        (abs-file (abs-file->d-e (cdr (assoc-equal (car path) fs)))
                  (list (nfix new-index)))
        fs)
       fs))
     (abs-alloc fs path new-index)
     (abs-file-contents-fix (list (nfix new-index))))
    :induct (abs-find-file-helper fs path))
   ("subgoal *1/1"
    :use (:instance ctx-app-ok-when-abs-complete-lemma-2
                    (name (fat32-filename-fix (car path))))))
  :rule-classes
  (:rewrite
   (:rewrite
    :corollary
    (implies
     (and (zp (mv-nth 1 (abs-find-file-helper fs path)))
          (abs-directory-file-p (mv-nth 0 (abs-find-file-helper fs path)))
          (not (member-equal (nfix new-index)
                             (abs-addrs (abs-fs-fix fs))))
          (abs-fs-p fs))
     (not (equal (mv-nth 1 (abs-alloc fs path new-index))
                 fs))))))

(defthm
  abs-mkdir-correctness-lemma-48
  (implies
   (consp
    (nthcdr
     (len
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         frame))))
     (dirname path)))
   (not
    (intersectp-equal
     (names-at
      (frame-val->dir
       (cdr
        (assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         (partial-collapse frame (dirname path)))))
      nil)
     (names-at
      nil
      (cdr
       (nthcdr
        (+ -1 (len path))
        (frame-val->path
         (cdr
          (assoc-equal (abs-find-file-src
                        (partial-collapse frame (dirname path))
                        (dirname path))
                       frame)))))))))
  :hints
  (("goal"
    :in-theory (disable (:rewrite nthcdr-of-nthcdr))
    :use
    (:instance
     (:rewrite nthcdr-of-nthcdr)
     (x
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         frame))))
     (b (+ -1 (len path)))
     (a 1)))))

(defthm
  abs-mkdir-correctness-lemma-49
  (implies
   (and
    (no-duplicatesp-equal (strip-cars frame))
    (frame-p frame)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
    (abs-separate frame)
    (not
     (equal
      0
      (abs-find-file-src (partial-collapse frame (dirname path))
                         (dirname path)))))
   (not
    (intersectp-equal
     (names-at
      (frame-val->dir
       (cdr
        (assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         (partial-collapse frame (dirname path)))))
      nil)
     (names-at
      (frame->root (partial-collapse frame (dirname path)))
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         frame)))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d nil
                    ((:rewrite abs-separate-of-collapse-this-lemma-1
                               . 1)))
    :use
    (:instance
     (:rewrite abs-separate-of-collapse-this-lemma-1 . 1)
     (relpath
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         frame))))
     (root (frame->root (partial-collapse frame (dirname path))))
     (frame (frame->frame (partial-collapse frame (dirname path))))
     (x (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path)))))
   ("subgoal 2" :in-theory (enable frame->frame))
   ("subgoal 1" :in-theory (enable frame->frame))))

(defthm
  abs-place-file-helper-of-ctx-app-1
  (implies
   (and (ctx-app-ok abs-file-alist1 x x-path)
        (not (member-equal (fat32-filename-fix (car path))
                           (names-at abs-file-alist1 x-path)))
        (abs-fs-p (ctx-app abs-file-alist1 fs x x-path)))
   (equal
    (ctx-app abs-file-alist1
             (mv-nth 0 (abs-place-file-helper fs path file))
             x x-path)
    (if (consp path)
        (mv-nth 0
                (abs-place-file-helper (ctx-app abs-file-alist1 fs x x-path)
                                       (append x-path path)
                                       file))
        (ctx-app abs-file-alist1 fs x x-path))))
  :hints
  (("goal" :in-theory
    (e/d (abs-place-file-helper ctx-app ctx-app-ok addrs-at names-at
                                (:definition binary-append))
         ((:rewrite abs-file-alist-p-correctness-1)
          (:rewrite hifat-equiv-when-absfat-equiv)
          (:definition no-duplicatesp-equal)
          (:rewrite subsetp-of-abs-addrs-of-put-assoc-lemma-1)
          (:rewrite abs-addrs-when-m1-file-alist-p)
          (:rewrite abs-addrs-of-ctx-app-2)))
    :induct (mv (append x-path path)
                (ctx-app abs-file-alist1 fs x x-path))))
  :rule-classes
  (:rewrite
   (:rewrite
    :corollary
    (implies
     (and (ctx-app-ok abs-file-alist1 x x-path)
          (not (member-equal (fat32-filename-fix (car path))
                             (names-at abs-file-alist1 x-path)))
          (abs-fs-p (ctx-app abs-file-alist1 fs x x-path))
          (abs-fs-p fs)
          (abs-complete fs)
          (abs-no-dups-file-p file)
          (m1-file-p file))
     (equal
      (ctx-app abs-file-alist1
               (mv-nth 0 (hifat-place-file fs path file))
               x x-path)
      (if (consp path)
          (mv-nth 0
                  (abs-place-file-helper (ctx-app abs-file-alist1 fs x x-path)
                                         (append x-path path)
                                         file))
          (ctx-app abs-file-alist1 fs x x-path)))))))

(defthm
  abs-mkdir-correctness-lemma-53
  (implies
   (and
    (not
     (equal
      0
      (abs-find-file-src (partial-collapse frame (dirname path))
                         (dirname path))))
    (consp (assoc-equal 0 frame)))
   (consp (frame->frame frame)))
  :hints
  (("goal"
    :in-theory (e/d (collapse frame->frame)
                    ((:rewrite abs-find-file-src-correctness-1)
                     (:rewrite consp-of-remove-assoc-1)))
    :do-not-induct t
    :use
    ((:instance (:rewrite abs-find-file-src-correctness-1)
                (path (dirname path))
                (frame (partial-collapse frame (dirname path))))
     (:instance
      (:rewrite consp-of-remove-assoc-1)
      (alist frame)
      (x2 0)
      (x1 (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path)))))))
  :rule-classes
  ((:forward-chaining
    :trigger-terms
    ((abs-find-file-src (partial-collapse frame (dirname path))
                        (dirname path))))))

(defthm
  abs-mkdir-correctness-lemma-55
  (implies
   (not
    (equal
     0
     (abs-find-file-src (partial-collapse frame (dirname path))
                        (dirname path))))
   (not
    (equal
     (abs-find-file-src (partial-collapse frame (dirname path))
                        (dirname path))
     (find-new-index
      (strip-cars (partial-collapse frame (dirname path)))))))
  :instructions
  ((:use
    (:instance
     (:rewrite find-new-index-correctness-1)
     (fd-list
      (strip-cars (partial-collapse frame (dirname path))))))
   :split (:contrapose 1)
   (:dive 1)
   := :up (:rewrite member-of-strip-cars)
   (:rewrite abs-find-file-src-correctness-1)))

(defthm
  abs-mkdir-correctness-lemma-56
  (equal (consp (assoc-equal x
                             (mv-nth 0
                                     (abs-alloc fs path new-index))))
         (if (member-equal x (names-at fs path))
             t nil))
  :hints (("goal" :in-theory (enable abs-alloc names-at)
           :induct (abs-alloc fs path new-index)))
  :rule-classes
  ((:rewrite
    :corollary
    (iff (consp (assoc-equal x
                               (mv-nth 0
                                       (abs-alloc fs path new-index))))
         (member-equal x (names-at fs path))))))

(defthm
  abs-mkdir-correctness-lemma-58
  (implies
   (and (absfat-subsetp abs-file-alist1 abs-file-alist2)
        (abs-file-alist-p abs-file-alist1)
        (consp (assoc-equal x abs-file-alist1))
        (not (abs-directory-file-p (cdr (assoc-equal x abs-file-alist1)))))
   (not (abs-directory-file-p (cdr (assoc-equal x abs-file-alist2)))))
  :hints (("goal" :in-theory (enable absfat-subsetp))))

(defthm
  abs-mkdir-correctness-lemma-59
  (implies
   (and
    (not (abs-fs-p (abs-file->contents
                    (cdr (assoc-equal (fat32-filename-fix (car path))
                                      fs1)))))
    (abs-fs-p fs1)
    (absfat-subsetp fs1 fs2))
   (not (abs-directory-file-p
         (cdr (assoc-equal (fat32-filename-fix (car path))
                           fs2)))))
  :hints (("goal" :in-theory (disable (:rewrite abs-mkdir-correctness-lemma-58))
           :use (:instance (:rewrite abs-mkdir-correctness-lemma-58)
                           (abs-file-alist2 fs2)
                           (x (fat32-filename-fix (car path)))
                           (abs-file-alist1 fs1)))))

(defthm
  abs-mkdir-correctness-lemma-62
  (implies
   (and
    (absfat-subsetp
     (mv-nth 0
             (abs-place-file-helper
              (abs-file->contents
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs1)))
              (cdr path)
              file))
     (mv-nth 0
             (abs-place-file-helper
              (abs-file->contents
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs2)))
              (cdr path)
              file)))
    (m1-regular-file-p file))
   (absfat-subsetp
    (mv-nth '0
            (abs-place-file-helper
             (abs-file->contents$inline
              (cdr (assoc-equal (fat32-filename-fix (car path))
                                fs1)))
             (cdr path)
             file))
    (abs-file-contents-fix
     (mv-nth '0
             (abs-place-file-helper
              (abs-file->contents$inline
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs2)))
              (cdr path)
              file))))))

(defthm
  abs-mkdir-correctness-lemma-63
  (implies
   (and
    (absfat-subsetp
     (mv-nth 0
             (abs-place-file-helper
              (abs-file->contents
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs1)))
              (cdr path)
              file))
     (mv-nth 0
             (abs-place-file-helper
              (abs-file->contents
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs2)))
              (cdr path)
              file)))
    (abs-directory-file-p file))
   (absfat-subsetp
    (mv-nth '0
            (abs-place-file-helper
             (abs-file->contents$inline
              (cdr (assoc-equal (fat32-filename-fix (car path))
                                fs1)))
             (cdr path)
             file))
    (abs-file-contents-fix
     (mv-nth '0
             (abs-place-file-helper
              (abs-file->contents$inline
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs2)))
              (cdr path)
              file))))))

(defthm
  abs-mkdir-correctness-lemma-64
  (implies
   (not
    (absfat-subsetp
     (abs-file->contents (cdr (assoc-equal (fat32-filename-fix (car path))
                                           fs1)))
     (abs-file->contents (cdr (assoc-equal (fat32-filename-fix (car path))
                                           fs2)))))
   (consp (assoc-equal (fat32-filename-fix (car path))
                       fs1)))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d (abs-place-file-helper absfat-subsetp abs-file-p-alt)
                    nil))))

(defthm
  abs-mkdir-correctness-lemma-65
  (implies
   (and
    (abs-directory-file-p
     (cdr (assoc-equal (fat32-filename-fix (car path))
                       fs2)))
    (abs-fs-p fs1)
    (absfat-subsetp fs1 fs2)
    (not (abs-directory-file-p
          (cdr (assoc-equal (fat32-filename-fix (car path))
                            fs1)))))
   (absfat-subsetp
    fs1
    (put-assoc-equal
     (fat32-filename-fix (car path))
     (abs-file
      (abs-file->d-e
       (cdr (assoc-equal (fat32-filename-fix (car path))
                         fs2)))
      (mv-nth
       0
       (abs-place-file-helper
        (abs-file->contents
         (cdr (assoc-equal (fat32-filename-fix (car path))
                           fs2)))
        (cdr path)
        file)))
     fs2)))
  :hints
  (("goal"
    :in-theory (e/d (abs-place-file-helper absfat-subsetp abs-file-p-alt)
                    ((:rewrite abs-mkdir-correctness-lemma-58)))
    :use (:instance (:rewrite abs-mkdir-correctness-lemma-58)
                    (abs-file-alist2 fs2)
                    (x (fat32-filename-fix (car path)))
                    (abs-file-alist1 fs1)))))

(defthm
  abs-mkdir-correctness-lemma-66
  (implies
   (and
    (absfat-subsetp
     (mv-nth 0
             (abs-place-file-helper
              (abs-file->contents
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs1)))
              (cdr path)
              file))
     (mv-nth 0
             (abs-place-file-helper
              (abs-file->contents
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs2)))
              (cdr path)
              file)))
    (m1-regular-file-p file))
   (absfat-subsetp
    (abs-file-contents-fix
     (mv-nth '0
             (abs-place-file-helper
              (abs-file->contents$inline
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs1)))
              (cdr path)
              file)))
    (abs-file-contents-fix
     (mv-nth '0
             (abs-place-file-helper
              (abs-file->contents$inline
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs2)))
              (cdr path)
              file)))))
  :hints
  (("goal"
    :in-theory (e/d (abs-place-file-helper absfat-subsetp abs-file-p-alt)))))

(defthm
  abs-mkdir-correctness-lemma-67
  (implies
   (and
    (absfat-subsetp
     (mv-nth 0
             (abs-place-file-helper
              (abs-file->contents
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs1)))
              (cdr path)
              file))
     (mv-nth 0
             (abs-place-file-helper
              (abs-file->contents
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs2)))
              (cdr path)
              file)))
    (abs-directory-file-p file))
   (absfat-subsetp
    (abs-file-contents-fix
     (mv-nth '0
             (abs-place-file-helper
              (abs-file->contents$inline
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs1)))
              (cdr path)
              file)))
    (abs-file-contents-fix
     (mv-nth '0
             (abs-place-file-helper
              (abs-file->contents$inline
               (cdr (assoc-equal (fat32-filename-fix (car path))
                                 fs2)))
              (cdr path)
              file)))))
  :hints
  (("goal"
    :in-theory (e/d (abs-place-file-helper absfat-subsetp abs-file-p-alt))
    :do-not-induct t)))

(encapsulate
  ()

  (local
   (defthmd
     lemma
     (implies (and (absfat-subsetp fs1 fs2)
                   (abs-fs-p fs1)
                   (abs-fs-p fs2)
                   (abs-no-dups-file-p file)
                   (zp (mv-nth 1
                               (abs-place-file-helper fs2 path file))))
              (absfat-subsetp (mv-nth 0 (abs-place-file-helper fs1 path file))
                              (mv-nth 0
                                      (abs-place-file-helper fs2 path file))))
     :hints (("goal" :in-theory (enable abs-place-file-helper absfat-subsetp
                                        abs-file-p-alt abs-no-dups-file-p)
              :induct (mv (abs-place-file-helper fs1 path file)
                          (abs-place-file-helper fs2 path file))))))

  ;; Non-trivial proof, might cause trouble if disabled.
  (defthm
    abs-mkdir-correctness-lemma-57
    (implies
     (and (absfat-subsetp (abs-fs-fix fs1) (abs-fs-fix fs2))
          (zp (mv-nth 1
                      (abs-place-file-helper fs2 path file))))
     (absfat-subsetp (mv-nth 0
                             (abs-place-file-helper fs1 path file))
                     (mv-nth 0
                             (abs-place-file-helper fs2 path file))))
    :hints (("goal" :use
             (:instance
              lemma
              (fs1 (abs-fs-fix fs1))
              (fs2 (abs-fs-fix fs2))
              (file (abs-no-dups-file-fix file)))
             :do-not-induct t))))

(defthmd
  abs-mkdir-correctness-lemma-61
  (implies (not (or (equal (mv-nth 1
                                   (abs-place-file-helper fs path file))
                           *enospc*)
                    (equal (mv-nth 1
                                   (abs-place-file-helper fs path file))
                           *enotdir*)
                    (equal (mv-nth 1
                                   (abs-place-file-helper fs path file))
                           *enoent*)
                    (equal (mv-nth 1
                                   (abs-place-file-helper fs path file))
                           *eexist*)))
           (equal (mv-nth 1
                          (abs-place-file-helper fs path file))
                  0))
  :hints (("goal" :in-theory (enable abs-place-file-helper))))

(defthm
  abs-mkdir-correctness-lemma-69
  (implies
   (and (absfat-equiv fs1 fs2)
        (syntaxp (not (term-order fs1 fs2)))
        (abs-fs-p fs1)
        (abs-fs-p fs2))
   (absfat-equiv
    (abs-file->contents (cdr (assoc-equal (fat32-filename-fix (car path))
                                          fs1)))
    (abs-file->contents (cdr (assoc-equal (fat32-filename-fix (car path))
                                          fs2)))))
  :hints
  (("goal"
    :in-theory (e/d (absfat-equiv absfat-subsetp abs-fs-fix
                                  abs-file-p-alt m1-regular-file-p)
                    ((:rewrite absfat-subsetp-guard-lemma-1)))
    :do-not-induct t
    :cases
    ((or
      (abs-directory-file-p (cdr (assoc-equal (fat32-filename-fix (car path))
                                              fs1)))
      (abs-directory-file-p (cdr (assoc-equal (fat32-filename-fix (car path))
                                              fs2))))))
   ("subgoal 2" :use ((:instance (:rewrite absfat-subsetp-guard-lemma-1)
                                 (abs-file-alist fs1)
                                 (name (fat32-filename-fix (car path))))
                      (:instance (:rewrite absfat-subsetp-guard-lemma-1)
                                 (abs-file-alist fs2)
                                 (name (fat32-filename-fix (car path)))))))
  :otf-flg t)

(encapsulate
  ()

  (local
   (defthmd
     lemma
     (implies (and (equal (mv-nth 1 (abs-place-file-helper fs2 path file))
                          *enotdir*)
                   (abs-fs-p fs1)
                   (abs-fs-p fs2)
                   (absfat-equiv fs1 fs2))
              (equal (mv-nth 1 (abs-place-file-helper fs1 path file))
                     *enotdir*))
     :hints
     (("goal" :in-theory
       (e/d (abs-place-file-helper abs-file-p-alt)
            ((:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-4)
             (:rewrite absfat-equiv-implies-set-equiv-addrs-at-1-lemma-2)
             (:definition put-assoc-equal)
             (:rewrite abs-file-alist-p-correctness-1)
             (:rewrite hifat-find-file-correctness-1-lemma-1)
             (:definition abs-complete)
             (:rewrite subsetp-of-abs-addrs-of-put-assoc-lemma-1)
             abs-mkdir-correctness-lemma-69))
       :induct (mv (abs-place-file-helper fs1 path file)
                   (abs-place-file-helper fs2 path file)))
      ("subgoal *1/5"
       :use
       (abs-mkdir-correctness-lemma-69
        (:instance (:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-3)
                   (abs-file-alist2 fs1)
                   (abs-file-alist1 fs2)
                   (x (fat32-filename-fix (car path))))))
      ("subgoal *1/4"
       :use
       (abs-mkdir-correctness-lemma-69
        (:instance (:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-3)
                   (abs-file-alist2 fs1)
                   (abs-file-alist1 fs2)
                   (x (fat32-filename-fix (car path))))))
      ("subgoal *1/1"
       :use
       (abs-mkdir-correctness-lemma-69
        (:instance (:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-3)
                   (abs-file-alist2 fs1)
                   (abs-file-alist1 fs2)
                   (x (fat32-filename-fix (car path)))))))))

  (defthm abs-mkdir-correctness-lemma-68
    (implies (and (equal (mv-nth 1 (abs-place-file-helper fs2 path file))
                         *enotdir*)
                  (absfat-equiv fs1 fs2))
             (equal (mv-nth 1 (abs-place-file-helper fs1 path file))
                    *enotdir*))
    :hints (("goal" :use (:instance lemma (fs1 (abs-fs-fix fs1))
                                    (fs2 (abs-fs-fix fs2)))))))

(encapsulate
  ()

  (local
   (defthmd
     lemma
     (implies (and (equal (mv-nth 1 (abs-place-file-helper fs2 path file))
                          *enospc*)
                   (abs-fs-p fs1)
                   (abs-fs-p fs2)
                   (absfat-equiv fs1 fs2))
              (equal (mv-nth 1 (abs-place-file-helper fs1 path file))
                     *enospc*))
     :hints
     (("goal" :in-theory
       (e/d (abs-place-file-helper abs-file-p-alt)
            ((:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-4)
             (:rewrite absfat-equiv-implies-set-equiv-addrs-at-1-lemma-2)
             (:definition put-assoc-equal)
             (:rewrite abs-file-alist-p-correctness-1)
             (:rewrite hifat-find-file-correctness-1-lemma-1)
             (:definition abs-complete)
             (:rewrite subsetp-of-abs-addrs-of-put-assoc-lemma-1)
             abs-mkdir-correctness-lemma-69))
       :induct (mv (abs-place-file-helper fs1 path file)
                   (abs-place-file-helper fs2 path file)))
      ("subgoal *1/5"
       :use
       (abs-mkdir-correctness-lemma-69
        (:instance (:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-3)
                   (abs-file-alist2 fs1)
                   (abs-file-alist1 fs2)
                   (x (fat32-filename-fix (car path)))))))))

  (defthm
    abs-mkdir-correctness-lemma-37
    (implies (and (equal (mv-nth 1
                                 (abs-place-file-helper fs2 path file))
                         *enospc*)
                  (absfat-equiv fs1 fs2))
             (equal (mv-nth 1
                            (abs-place-file-helper fs1 path file))
                    *enospc*))
    :hints (("goal" :use (:instance lemma (fs1 (abs-fs-fix fs1))
                                    (fs2 (abs-fs-fix fs2)))))))

(encapsulate
  ()

  (local
   (defthmd
     lemma
     (implies (and (equal (mv-nth 1 (abs-place-file-helper fs2 path file))
                          *enoent*)
                   (abs-fs-p fs1)
                   (abs-fs-p fs2)
                   (absfat-equiv fs1 fs2))
              (equal (mv-nth 1 (abs-place-file-helper fs1 path file))
                     *enoent*))
     :hints
     (("goal" :in-theory
       (e/d (abs-place-file-helper abs-file-p-alt)
            ((:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-4)
             (:rewrite absfat-equiv-implies-set-equiv-addrs-at-1-lemma-2)
             (:definition put-assoc-equal)
             (:rewrite abs-file-alist-p-correctness-1)
             (:rewrite hifat-find-file-correctness-1-lemma-1)
             (:definition abs-complete)
             (:rewrite subsetp-of-abs-addrs-of-put-assoc-lemma-1)
             abs-mkdir-correctness-lemma-69))
       :induct (mv (abs-place-file-helper fs1 path file)
                   (abs-place-file-helper fs2 path file)))
      ("subgoal *1/5"
       :use
       (abs-mkdir-correctness-lemma-69
        (:instance (:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-3)
                   (abs-file-alist2 fs1)
                   (abs-file-alist1 fs2)
                   (x (fat32-filename-fix (car path)))))))))

  (defthm
    abs-mkdir-correctness-lemma-111
    (implies (and (equal (mv-nth 1
                                 (abs-place-file-helper fs2 path file))
                         *enoent*)
                  (absfat-equiv fs1 fs2))
             (equal (mv-nth 1
                            (abs-place-file-helper fs1 path file))
                    *enoent*))
    :hints (("goal" :use (:instance lemma (fs1 (abs-fs-fix fs1))
                                    (fs2 (abs-fs-fix fs2)))))))

(encapsulate
  ()

  (local
   (defthmd
     lemma
     (implies (and (equal (mv-nth 1 (abs-place-file-helper fs2 path file))
                          *enotdir*)
                   (abs-fs-p fs1)
                   (abs-fs-p fs2)
                   (absfat-equiv fs1 fs2))
              (equal (mv-nth 1 (abs-place-file-helper fs1 path file))
                     *enotdir*))
     :hints
     (("goal" :in-theory
       (e/d (abs-place-file-helper abs-file-p-alt)
            ((:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-4)
             (:rewrite absfat-equiv-implies-set-equiv-addrs-at-1-lemma-2)
             (:definition put-assoc-equal)
             (:rewrite abs-file-alist-p-correctness-1)
             (:rewrite hifat-find-file-correctness-1-lemma-1)
             (:definition abs-complete)
             (:rewrite subsetp-of-abs-addrs-of-put-assoc-lemma-1)
             abs-mkdir-correctness-lemma-69))
       :induct (mv (abs-place-file-helper fs1 path file)
                   (abs-place-file-helper fs2 path file)))
      ("subgoal *1/5"
       :use
       (abs-mkdir-correctness-lemma-69
        (:instance (:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-3)
                   (abs-file-alist2 fs1)
                   (abs-file-alist1 fs2)
                   (x (fat32-filename-fix (car path))))))
      ("subgoal *1/1"
       :use
       (abs-mkdir-correctness-lemma-69
        (:instance (:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-3)
                   (abs-file-alist2 fs1)
                   (abs-file-alist1 fs2)
                   (x (fat32-filename-fix (car path)))))))))

  (defthm
    abs-mkdir-correctness-lemma-70
    (implies (and (equal (mv-nth 1
                                 (abs-place-file-helper fs2 path file))
                         *enotdir*)
                  (absfat-equiv fs1 fs2))
             (equal (mv-nth 1
                            (abs-place-file-helper fs1 path file))
                    *enotdir*))
    :hints (("goal" :use (:instance lemma (fs1 (abs-fs-fix fs1))
                                    (fs2 (abs-fs-fix fs2)))))))

(encapsulate
  ()

  (local
   (defthmd
     lemma
     (implies (and (equal (mv-nth 1 (abs-place-file-helper fs2 path file))
                          *eexist*)
                   (abs-fs-p fs1)
                   (abs-fs-p fs2)
                   (absfat-equiv fs1 fs2))
              (equal (mv-nth 1 (abs-place-file-helper fs1 path file))
                     *eexist*))
     :hints
     (("goal" :in-theory
       (e/d (abs-place-file-helper abs-file-p-alt)
            ((:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-4)
             (:rewrite absfat-equiv-implies-set-equiv-addrs-at-1-lemma-2)
             (:definition put-assoc-equal)
             (:rewrite abs-file-alist-p-correctness-1)
             (:rewrite hifat-find-file-correctness-1-lemma-1)
             (:definition abs-complete)
             (:rewrite subsetp-of-abs-addrs-of-put-assoc-lemma-1)
             abs-mkdir-correctness-lemma-69))
       :induct (mv (abs-place-file-helper fs1 path file)
                   (abs-place-file-helper fs2 path file)))
      ("subgoal *1/5"
       :use
       (abs-mkdir-correctness-lemma-69
        (:instance (:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-3)
                   (abs-file-alist2 fs1)
                   (abs-file-alist1 fs2)
                   (x (fat32-filename-fix (car path))))))
      ("subgoal *1/2"
       :use
       (abs-mkdir-correctness-lemma-69
        (:instance (:rewrite absfat-equiv-implies-set-equiv-names-at-1-lemma-3)
                   (abs-file-alist2 fs1)
                   (abs-file-alist1 fs2)
                   (x (fat32-filename-fix (car path)))))))))

  (defthm
    abs-mkdir-correctness-lemma-51
    (implies (and (equal (mv-nth 1
                                 (abs-place-file-helper fs2 path file))
                         *eexist*)
                  (absfat-equiv fs1 fs2))
             (equal (mv-nth 1
                            (abs-place-file-helper fs1 path file))
                    *eexist*))
    :hints (("goal" :use (:instance lemma (fs1 (abs-fs-fix fs1))
                                    (fs2 (abs-fs-fix fs2)))))))

(defthm
  abs-mkdir-correctness-lemma-60
  (implies (absfat-equiv fs1 fs2)
           (and (absfat-equiv (mv-nth 0 (abs-place-file-helper fs1 path file))
                              (mv-nth 0
                                      (abs-place-file-helper fs2 path file)))
                (equal (mv-nth 1 (abs-place-file-helper fs1 path file))
                       (mv-nth 1
                               (abs-place-file-helper fs2 path file)))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d (absfat-equiv)
                    (abs-mkdir-correctness-lemma-57
                     (:rewrite abs-place-file-helper-correctness-2)))
    :use ((:instance abs-mkdir-correctness-lemma-57
                     (fs1 (abs-fs-fix fs1))
                     (fs2 (abs-fs-fix fs2)))
          (:instance abs-mkdir-correctness-lemma-57
                     (fs1 (abs-fs-fix fs2))
                     (fs2 (abs-fs-fix fs1)))
          (:instance (:rewrite abs-place-file-helper-correctness-2)
                     (file file)
                     (path path)
                     (fs fs1))
          (:instance (:rewrite abs-place-file-helper-correctness-2)
                     (file file)
                     (path path)
                     (fs fs2))
          (:instance (:rewrite abs-mkdir-correctness-lemma-61)
                     (file file)
                     (path path)
                     (fs fs1))
          (:instance (:rewrite abs-mkdir-correctness-lemma-61)
                     (file file)
                     (path path)
                     (fs fs2)))))
  :rule-classes
  ((:congruence
    :corollary
    (implies (absfat-equiv fs1 fs2)
             (absfat-equiv (mv-nth 0 (abs-place-file-helper fs1 path file))
                           (mv-nth 0
                                   (abs-place-file-helper fs2 path file)))))
   (:congruence
    :corollary
    (implies (absfat-equiv fs1 fs2)
             (equal (mv-nth 1 (abs-place-file-helper fs1 path file))
                    (mv-nth 1
                            (abs-place-file-helper fs2 path file)))))))

(defthm
  collapse-hifat-place-file-lemma-5
  (implies (and (consp x)
                (fat32-filename-list-prefixp x y)
                (equal (mv-nth 1 (abs-find-file-helper fs x))
                       *enoent*))
           (equal (addrs-at fs y) nil))
  :hints
  (("goal" :in-theory
    (e/d (abs-find-file-helper addrs-at fat32-filename-list-prefixp)
         (ctx-app-ok-when-abs-complete-lemma-4))
    :induct (mv (fat32-filename-list-prefixp x y)
                (mv-nth 0 (abs-find-file-helper fs x))))))

(defthm
  collapse-hifat-place-file-lemma-6
  (implies (and (consp x)
                (fat32-filename-list-prefixp x y)
                (equal (mv-nth 1 (abs-find-file-helper fs x))
                       *enoent*))
           (not (ctx-app-ok fs var y)))
  :hints
  (("goal" :in-theory (enable ctx-app-ok))))

(defthm
  collapse-hifat-place-file-lemma-9
  (implies
   (and
    (equal (mv-nth 1
                   (abs-find-file-helper (frame->root frame2)
                                         (dirname path)))
           0)
    (equal (mv-nth 1
                   (abs-find-file-helper (frame->root frame2)
                                         path))
           2)
    (prefixp
     (fat32-filename-list-fix path)
     (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame1))
                                        (frame->frame frame1))))))
   (not
    (ctx-app-ok
     (frame->root frame2)
     (1st-complete (frame->frame frame1))
     (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame1))
                                        (frame->frame frame1)))))))
  :hints
  (("goal"
    :in-theory (e/d (abs-find-file-helper dirname
                                          fat32-filename-list-prefixp-alt)
                    ((:rewrite collapse-hifat-place-file-lemma-6)))
    :use
    (:instance
     (:rewrite collapse-hifat-place-file-lemma-6)
     (y
      (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame1))
                                         (frame->frame frame1)))))
     (var (1st-complete (frame->frame frame1)))
     (fs (frame->root frame2))
     (x path)))))

(defthm
  collapse-hifat-place-file-lemma-10
  (implies (and (m1-file-p file)
                (hifat-no-dups-p (m1-file->contents file)))
           (abs-no-dups-p (m1-file->contents file)))
  :hints
  (("goal" :in-theory (e/d (m1-file-p m1-file->contents
                                      m1-file-contents-p abs-no-dups-p)
                           ((:rewrite abs-no-dups-p-when-m1-file-alist-p)))
    :use (:instance (:rewrite abs-no-dups-p-when-m1-file-alist-p)
                    (fs (abs-file->contents file))))))

(defthm
  collapse-hifat-place-file-lemma-12
  (implies
   (and (m1-file-p file)
        (hifat-no-dups-p (m1-file->contents file)))
   (not
    (ctx-app-ok
     (m1-file->contents file)
     (1st-complete (frame->frame frame1))
     (nthcdr
      (len path)
      (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame1))
                                         (frame->frame frame1))))))))
  :hints
  (("goal" :in-theory (disable (:rewrite m1-directory-file-p-when-m1-file-p))
    :use (:instance (:rewrite m1-directory-file-p-when-m1-file-p)
                    (x file)))))

(defthm
 collapse-hifat-place-file-lemma-11
 (implies
  (and
   (equal (frame->root frame1)
          (mv-nth 0
                  (abs-place-file-helper (frame->root frame2)
                                         path file)))
   (m1-file-p file)
   (hifat-no-dups-p (m1-file->contents file))
   (not
    (ctx-app-ok
      (frame->root frame2)
      (1st-complete (frame->frame frame1))
      (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame1))
                                         (frame->frame frame1)))))))
  (not
   (ctx-app-ok
      (frame->root frame1)
      (1st-complete (frame->frame frame1))
      (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame1))
                                         (frame->frame frame1)))))))
 :hints
 (("goal"
   :in-theory (e/d (abs-no-dups-file-fix)
                   ((:rewrite ctx-app-ok-of-abs-place-file-helper-1)))
   :use
   (:instance
    (:rewrite ctx-app-ok-of-abs-place-file-helper-1)
    (x-path
      (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame1))
                                         (frame->frame frame1)))))
    (x (1st-complete (frame->frame frame1)))
    (file file)
    (path path)
    (fs (frame->root frame2))))))

(defthm
  collapse-hifat-place-file-lemma-14
  (implies
   (and
    (equal (mv-nth 1
                   (abs-find-file-helper (frame->root frame2)
                                         path))
           2)
    (ctx-app-ok
     (frame->root frame2)
     (1st-complete (frame->frame frame1))
     (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame1))
                                        (frame->frame frame1)))))
    (prefixp
     (fat32-filename-list-fix path)
     (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame1))
                                        (frame->frame frame1))))))
   (not (equal (mv-nth 1
                       (abs-place-file-helper (frame->root frame2)
                                              path file))
               0)))
  :hints
  (("goal"
    :in-theory (e/d (abs-find-file-helper dirname
                                          fat32-filename-list-prefixp-alt))
    :expand ((abs-place-file-helper (frame->root frame1)
                                    path file)
             (abs-place-file-helper (frame->root frame2)
                                    path file)))))

(defthm
  path-clear-when-prefixp-lemma-1
  (implies
   (and
    (prefixp (frame-val->path (cdr (car frame)))
             (fat32-filename-list-fix y))
    (prefixp (fat32-filename-list-fix x)
             (fat32-filename-list-fix y))
    (not (prefixp (fat32-filename-list-fix x)
                  (frame-val->path (cdr (car frame)))))
    (not (consp (names-at (frame-val->dir (cdr (car frame)))
                          (nthcdr (len (frame-val->path (cdr (car frame))))
                                  x)))))
   (not (consp (names-at (frame-val->dir (cdr (car frame)))
                         (nthcdr (len (frame-val->path (cdr (car frame))))
                                 y)))))
  :hints
  (("goal"
    :in-theory (e/d nil
                    ((:rewrite prefixp-nthcdr-nthcdr)
                     (:rewrite names-at-when-prefixp)
                     len-when-prefixp))
    :use ((:instance (:rewrite names-at-when-prefixp)
                     (y (nthcdr (len (frame-val->path (cdr (car frame))))
                                y))
                     (fs (frame-val->dir (cdr (car frame))))
                     (x (nthcdr (len (frame-val->path (cdr (car frame))))
                                x)))
          (:instance (:rewrite prefixp-nthcdr-nthcdr)
                     (l2 (fat32-filename-list-fix y))
                     (l1 (fat32-filename-list-fix x))
                     (n (len (frame-val->path (cdr (car frame))))))
          (:instance len-when-prefixp
                     (x (frame-val->path (cdr (car frame))))
                     (y (fat32-filename-list-fix y)))))))

(defthm
  path-clear-when-prefixp-lemma-2
  (implies (not (consp (names-at (frame-val->dir (cdr (car frame)))
                                 nil)))
           (not (consp (names-at (frame-val->dir (cdr (car frame)))
                                 (nthcdr (len x) y)))))
  :hints
  (("goal" :in-theory (e/d (names-at)
                           ((:rewrite member-of-remove)))
    :do-not-induct t
    :expand (names-at (frame-val->dir (cdr (car frame)))
                      (nthcdr (len x) y))
    :use (:instance (:rewrite member-of-remove)
                    (x (strip-cars (frame-val->dir (cdr (car frame)))))
                    (b nil)
                    (a (fat32-filename-fix (nth (len x) y)))))))

(defthm
  path-clear-when-prefixp
  (implies (and (prefixp (fat32-filename-list-fix x)
                         (fat32-filename-list-fix y))
                (path-clear x frame))
           (path-clear y frame))
  :hints
  (("goal"
    :in-theory (e/d (path-clear)
                    (len-when-prefixp (:rewrite prefixp-when-equal-lengths))))
   ("subgoal *1/4'''" :use ((:instance (:rewrite prefixp-when-equal-lengths)
                                       (y (fat32-filename-list-fix y))
                                       (x (fat32-filename-list-fix x)))
                            (:instance len-when-prefixp
                                       (x (fat32-filename-list-fix x))
                                       (y (fat32-filename-list-fix y)))
                            (:instance len-when-prefixp
                                       (x (fat32-filename-list-fix y))
                                       (y (fat32-filename-list-fix x)))))))

(defthm
  abs-place-file-helper-of-ctx-app-2
  (implies
   (not (fat32-filename-list-prefixp x-path path))
   (equal
    (mv-nth 1 (abs-place-file-helper
               (ctx-app fs1 fs2 x x-path)
               path file))
    (mv-nth 1 (abs-place-file-helper
               fs1
               path file))))
  :hints (("Goal" :in-theory (enable abs-place-file-helper ctx-app)
           :induct (mv (fat32-filename-list-prefixp x-path path)
                       (ctx-app fs1 fs2 x x-path)))))

;; Here's the problem with this theorem: it doesn't work for the arbitrary
;; place-file because it can literally dump a number of names in different
;; directories while wiping out a bunch of others, making an utter mess of
;; dist-names and therefor abs-separate. In actual system calls, we create one
;; new name at a time, which is what makes it possible to ensure that we can
;; use path-clear and basically account for everything. But... how do we
;; pass on that kind of stipulation here? It would be nice to hang on to a
;; model where we just do put-assoc and we can tell what the names in each
;; directory are, but when in the middle of collapsing that assumption
;; disappears because wherever you did the put-assoc, that's going somewhere,
;; and then somewhere else, and at various points it sinks deeper and deeper
;; down into the directory tree. So how do we say that we are only introducing
;; this one name? Maybe the answer is simply to maintain path-clear...
(encapsulate
  ()

  (local
   (defun
       induction-scheme (frame1 frame2)
     (declare (xargs :verify-guards nil
                     :measure (len (frame->frame frame1))))
     (cond
      ((and
        (not (atom (frame->frame frame1)))
        (not (zp (1st-complete (frame->frame frame1))))
        (not
         (zp
          (frame-val->src
           (cdr (assoc-equal (1st-complete (frame->frame frame1))
                             (frame->frame frame1))))))
        (not
         (or
          (equal
           (frame-val->src
            (cdr
             (assoc-equal (1st-complete (frame->frame frame1))
                          (frame->frame frame1))))
           (1st-complete (frame->frame frame1)))
          (atom
           (assoc-equal
            (frame-val->src
             (cdr
              (assoc-equal (1st-complete (frame->frame frame1))
                           (frame->frame frame1))))
            (remove-assoc-equal
             (1st-complete (frame->frame frame1))
             (frame->frame frame1))))))
        (prefixp
         (frame-val->path
          (cdr
           (assoc-equal
            (frame-val->src
             (cdr
              (assoc-equal (1st-complete (frame->frame frame1))
                           (frame->frame frame1))))
            (remove-assoc-equal
             (1st-complete (frame->frame frame1))
             (frame->frame frame1)))))
         (frame-val->path
          (cdr (assoc-equal (1st-complete (frame->frame frame1))
                            (frame->frame frame1)))))
        (ctx-app-ok
         (frame-val->dir
          (cdr
           (assoc-equal
            (frame-val->src
             (cdr
              (assoc-equal (1st-complete (frame->frame frame1))
                           (frame->frame frame1))))
            (remove-assoc-equal
             (1st-complete (frame->frame frame1))
             (frame->frame frame1)))))
         (1st-complete (frame->frame frame1))
         (nthcdr
          (len
           (frame-val->path
            (cdr
             (assoc-equal
              (frame-val->src
               (cdr
                (assoc-equal (1st-complete (frame->frame frame1))
                             (frame->frame frame1))))
              (remove-assoc-equal
               (1st-complete (frame->frame frame1))
               (frame->frame frame1))))))
          (frame-val->path
           (cdr (assoc-equal (1st-complete (frame->frame frame1))
                             (frame->frame frame1)))))))
       (induction-scheme
        (collapse-this frame1
                       (1st-complete (frame->frame frame1)))
        (collapse-this frame2
                       (1st-complete (frame->frame frame2)))))
      ((and
        (not (atom (frame->frame frame1)))
        (not (zp (1st-complete (frame->frame frame1))))
        (zp
         (frame-val->src
          (cdr (assoc-equal (1st-complete (frame->frame frame1))
                            (frame->frame frame1)))))
        (ctx-app-ok
         (frame->root frame1)
         (1st-complete (frame->frame frame1))
         (frame-val->path
          (cdr (assoc-equal (1st-complete (frame->frame frame1))
                            (frame->frame frame1))))))
       (induction-scheme
        (collapse-this frame1
                       (1st-complete (frame->frame frame1)))
        (collapse-this frame2
                       (1st-complete (frame->frame frame2)))))
      (t (mv frame1 frame2)))))

  (skip-proofs
   (defthmd
     collapse-hifat-place-file-lemma-8
     (implies
      (and
       (equal (frame->frame frame1)
              (frame->frame frame2))
       (equal (frame->root frame1)
              (mv-nth 0
                      (abs-place-file-helper (frame->root frame2)
                                             path file)))
       ;; We're going to need to make some assumptions about
       ;; abs-place-file-helper and where it is called, because currently it has
       ;; the ability to come in and smoosh the directory structure by placing a file
       ;; at an arbitrary place. While it's all very well to think about
       ;; basenames and dirnames and what should and should not exist, perhaps
       ;; we can go for a property I suspect is provided by partial-collapse -
       ;; path-clear...
       (or
        (atom (dirname path))
        (path-clear (dirname path) (frame->frame frame2)))
       (m1-file-p file)
       (hifat-no-dups-p (m1-file->contents file))
       (dist-names (frame->root frame2)
                   nil (frame->frame frame2))
       (abs-separate (frame->frame frame2))
       (frame-p (frame->frame frame2))
       (no-duplicatesp-equal (strip-cars (frame->frame frame2))))
      (and
       (equal
        (mv-nth 0 (collapse frame1))
        (mv-nth
         0
         (abs-place-file-helper (mv-nth 0 (collapse frame2))
                                path file)))
       (equal (mv-nth 1 (collapse frame1))
              (mv-nth 1 (collapse frame2)))))
     :hints
     (("goal"
       :in-theory
       (e/d
        (collapse)
        ((:definition no-duplicatesp-equal)
         (:definition assoc-equal)
         (:rewrite
          abs-separate-of-frame->frame-of-collapse-this-lemma-8
          . 2)
         (:rewrite nthcdr-when->=-n-len-l)
         (:rewrite strip-cars-of-frame->frame-of-collapse-this)
         (:definition len)
         (:definition remove-equal)
         (:rewrite remove-when-absent)))
       :induct (induction-scheme frame1 frame2)
       :expand (collapse frame2))))))

;; This theorem asserts some things about applying abs-place-file-helper to
;; filesystem instances with holes...
(defthm
  collapse-hifat-place-file-1
  (implies
   (and (or (not (consp (dirname path)))
            (path-clear (dirname path) frame))
        (m1-file-p file)
        (hifat-no-dups-p (m1-file->contents file))
        (dist-names (frame->root (frame-with-root root frame))
                    nil
                    (frame->frame (frame-with-root root frame)))
        (abs-separate (frame->frame (frame-with-root root frame)))
        (frame-p (frame->frame (frame-with-root root frame)))
        (no-duplicatesp-equal
         (strip-cars (frame->frame (frame-with-root root frame)))))
   (and
    (equal
     (mv-nth
      1
      (collapse
       (frame-with-root (mv-nth 0
                                (abs-place-file-helper root path file))
                        frame)))
     (mv-nth 1
             (collapse (frame-with-root root frame))))
    (equal
     (mv-nth
      0
      (collapse
       (frame-with-root (mv-nth 0
                                (abs-place-file-helper root path file))
                        frame)))
     (mv-nth
      0
      (abs-place-file-helper (mv-nth 0
                                     (collapse (frame-with-root root frame)))
                             path file)))))
  :otf-flg t
  :hints
  (("goal"
    :do-not-induct t
    :use
    (:instance
     (:rewrite collapse-hifat-place-file-lemma-8)
     (frame1
      (frame-with-root (mv-nth 0
                               (abs-place-file-helper root path file))
                       frame))
     (frame2 (frame-with-root root frame))))))

(defthmd abs-find-file-after-abs-mkdir-lemma-1
  (implies (case-split (consp path))
           (fat32-filename-list-equiv (nthcdr (- (len path) 1) path)
                                      (list (basename path))))
  :hints (("goal" :in-theory (enable fat32-filename-list-equiv basename))))

(defthm fat32-filename-list-fix-when-zp-len
  (implies (zp (len x))
           (equal (fat32-filename-list-fix x) nil))
  :rule-classes :type-prescription)

(defthm prefixp-of-dirname
  (prefixp (dirname path)
           (fat32-filename-list-fix path))
  :hints (("goal" :in-theory (enable dirname)))
  :rule-classes
  ((:rewrite
    :corollary
    (fat32-filename-list-prefixp (dirname path) path)
    :hints (("Goal" :in-theory (enable fat32-filename-list-prefixp-alt))))
   :rewrite))

(defthmd
  abs-find-file-after-abs-mkdir-lemma-4
  (implies (fat32-filename-list-equiv (list (basename path))
                                      path)
           (fat32-filename-equiv$inline (basename path)
                                        (car path)))
  :hints
  (("goal" :in-theory (e/d (abs-mkdir abs-find-file abs-find-file-helper
                                      abs-find-file-after-abs-mkdir-lemma-1
                                      len-when-consp
                                      fat32-filename-list-fix
                                      fat32-filename-list-equiv
                                      fat32-filename-equiv)
                           ((:definition nth)
                            (:definition true-listp)
                            (:definition string-listp)
                            (:rewrite true-listp-when-string-list)
                            (:rewrite fat32-filename-p-correctness-1)))
    :do-not-induct t)))

(defthm
  abs-find-file-after-abs-mkdir-lemma-2
  (implies (equal (list (basename path))
                  (fat32-filename-list-fix path))
           (consp path))
  :hints
  (("goal" :in-theory (e/d (abs-mkdir abs-find-file abs-find-file-helper
                                      abs-find-file-after-abs-mkdir-lemma-1
                                      abs-find-file-after-abs-mkdir-lemma-4
                                      len-when-consp
                                      fat32-filename-list-fix abs-alloc)
                           ((:definition nth)
                            (:definition true-listp)
                            (:definition string-listp)
                            (:rewrite true-listp-when-string-list)
                            (:rewrite fat32-filename-p-correctness-1)))
    :do-not-induct t))
  :rule-classes :forward-chaining)

(defthmd abs-find-file-after-abs-mkdir-lemma-3
  (implies (and (consp x)
                (fat32-filename-list-prefixp x y)
                (not (equal (mv-nth 1 (abs-find-file-helper fs y))
                            *enoent*)))
           (not (equal (mv-nth 1 (abs-find-file-helper fs x))
                       *enoent*)))
  :hints (("goal" :in-theory (enable abs-find-file-helper))))

(defthm
  abs-find-file-after-abs-mkdir-lemma-7
  (implies
   (and
    (prefixp
     (frame-val->path
      (cdr
       (assoc-equal
        (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path))
        frame)))
     (dirname path))
    (equal
     (abs-find-file
      (frame->frame (partial-collapse frame (dirname path)))
      (dirname path))
     '(((d-e 0 0 0 0 0 0 0 0 0 0 0 0
                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
        (contents))
       2))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (not
     (equal
      0
      (abs-find-file-src (partial-collapse frame (dirname path))
                         (dirname path)))))
   (equal
    (abs-find-file-helper
     (frame-val->dir
      (cdr
       (assoc-equal
        (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path))
        (partial-collapse frame (dirname path)))))
     (nthcdr
      (len
       (frame-val->path
        (cdr
         (assoc-equal
          (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path))
          frame))))
      (dirname path)))
    (mv (abs-file-fix nil) *enoent*)))
  :hints
  (("goal"
    :in-theory (e/d (frame->frame)
                    (abs-find-file-correctness-lemma-14))
    :use
    ((:instance
      (:rewrite abs-find-file-helper-of-ctx-app-lemma-4)
      (path
       (nthcdr
        (len
         (frame-val->path
          (cdr
           (assoc-equal (abs-find-file-src
                         (partial-collapse frame (dirname path))
                         (dirname path))
                        frame))))
        (dirname path)))
      (fs
       (frame-val->dir
        (cdr
         (assoc-equal
          (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path))
          (partial-collapse frame (dirname path)))))))
     (:instance
      abs-find-file-correctness-lemma-14
      (x (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path)))
      (frame (frame->frame (partial-collapse frame (dirname path))))
      (path (dirname path)))))))

(defthm
  abs-find-file-after-abs-mkdir-lemma-8
  (implies
   (and (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (consp (assoc-equal 0
                            (partial-collapse frame (dirname path))))
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (mv-nth '1 (collapse frame))
        (not (equal 0
                    (abs-find-file-src (partial-collapse frame (dirname path))
                                       (dirname path))))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame))))
   (equal (abs-find-file-helper
           (frame->root (partial-collapse frame (dirname path)))
           path)
          (mv (abs-file-fix nil) *enoent*)))
  :hints
  (("goal"
    :in-theory (e/d (abs-mkdir abs-find-file abs-find-file-helper
                               abs-find-file-after-abs-mkdir-lemma-1
                               abs-find-file-after-abs-mkdir-lemma-4
                               len-when-consp fat32-filename-list-fix
                               abs-alloc abs-fs-fix)
                    (abs-find-file-after-abs-mkdir-lemma-3
                     (:definition nth)
                     (:definition true-listp)
                     (:definition string-listp)
                     (:rewrite true-listp-when-string-list)
                     (:rewrite fat32-filename-p-correctness-1)))
    :use
    ((:instance abs-find-file-after-abs-mkdir-lemma-3
                (fs (frame->root (partial-collapse frame (dirname path))))
                (x (dirname path))
                (y (fat32-filename-list-fix path)))
     (:instance abs-find-file-src-correctness-2
                (frame (partial-collapse frame (dirname path)))
                (path (dirname path)))
     (:instance (:rewrite abs-find-file-helper-of-ctx-app-lemma-4)
                (path path)
                (fs (frame->root (partial-collapse frame (dirname path))))))
    :do-not-induct t)))

;; Inductive, so probably not worth disabling.
(defthm
  abs-find-file-after-abs-mkdir-lemma-9
  (implies
   (and (fat32-filename-list-prefixp x y)
        (not (fat32-filename-list-equiv x y))
        (not (equal (mv-nth 1 (abs-alloc fs x new-index))
                    (abs-fs-fix fs))))
   (equal (abs-find-file-helper (mv-nth 1 (abs-alloc fs x new-index))
                                y)
          (mv (abs-file-fix nil) *enoent*)))
  :hints (("goal" :in-theory (enable abs-find-file-helper
                                     abs-alloc fat32-filename-list-fix
                                     fat32-filename-list-equiv
                                     fat32-filename-list-prefixp abs-fs-fix)
           :induct (mv (abs-alloc fs x new-index)
                       (fat32-filename-list-prefixp x y)))))

(defthm
  abs-find-file-after-abs-mkdir-lemma-11
  (implies
   (and
    (equal
     (mv-nth 1
             (abs-find-file (partial-collapse frame (dirname path))
                            (dirname path)))
     0)
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-directory-file-p
     (mv-nth 0
             (abs-find-file (partial-collapse frame (dirname path))
                            (dirname path))))
    (equal
     0
     (abs-find-file-src (partial-collapse frame (dirname path))
                        (dirname path)))
    (not
     (member-equal
      (find-new-index
       (strip-cars (partial-collapse frame (dirname path))))
      (abs-addrs
       (frame-val->dir
        (cdr
         (assoc-equal 0
                      (partial-collapse frame (dirname path)))))))))
   (not
    (equal
     (mv-nth
      1
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path))))))
     (frame-val->dir
      (cdr
       (assoc-equal 0
                    (partial-collapse frame (dirname path))))))))
  :hints
  (("goal"
    :use
    ((:instance (:rewrite abs-find-file-src-correctness-2)
                (path (dirname path))
                (frame (partial-collapse frame (dirname path))))))))

(defthm
  abs-find-file-after-abs-mkdir-lemma-10
  (implies
   (and
    (equal
     (mv-nth 1
             (abs-find-file (partial-collapse frame (dirname path))
                            (dirname path)))
     0)
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-directory-file-p
     (mv-nth 0
             (abs-find-file (partial-collapse frame (dirname path))
                            (dirname path))))
    (equal
     0
     (abs-find-file-src (partial-collapse frame (dirname path))
                        (dirname path)))
    (not
     (member-equal
      (find-new-index
       (strip-cars (partial-collapse frame (dirname path))))
      (abs-addrs
       (frame-val->dir
        (cdr
         (assoc-equal 0
                      (partial-collapse frame (dirname path)))))))))
   (equal
    (abs-find-file-helper
     (mv-nth
      1
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal 0
                      (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path))))))
     path)
    (mv (abs-file-fix nil) *enoent*)))
  :hints
  (("goal"
    :in-theory (disable (:rewrite abs-find-file-after-abs-mkdir-lemma-9))
    :use
    ((:instance
      (:rewrite abs-find-file-after-abs-mkdir-lemma-9)
      (y path)
      (new-index
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))
      (x (dirname path))
      (fs
       (frame-val->dir
        (cdr
         (assoc-equal 0
                      (partial-collapse frame (dirname path)))))))
     (:instance
      (:rewrite abs-find-file-helper-of-ctx-app-lemma-4)
      (path path)
      (fs
       (mv-nth
        1
        (abs-alloc
         (frame-val->dir
          (cdr
           (assoc-equal
            0
            (partial-collapse frame (dirname path)))))
         (dirname path)
         (find-new-index
          (strip-cars
           (partial-collapse frame (dirname path))))))))))))

(defthm
  abs-find-file-after-abs-mkdir-lemma-13
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0
                        (partial-collapse frame (dirname path))))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (abs-directory-file-p
     (mv-nth 0
             (abs-find-file (partial-collapse frame (dirname path))
                            (dirname path))))
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame))))
   (not
    (member-equal
     (find-new-index
      (strip-cars (partial-collapse frame (dirname path))))
     (abs-addrs
      (frame-val->dir$inline
       (cdr
        (assoc-equal '0
                     (partial-collapse frame (dirname path)))))))))
  :instructions
  (:promote
   (:dive 1)
   (:rewrite
    (:rewrite subsetp-member . 4)
    ((y (strip-cars (partial-collapse frame (dirname path))))))
   (:change-goal nil t)
   :bash
   (:=
    (frame-val->dir
     (cdr (assoc-equal 0
                       (partial-collapse frame (dirname path)))))
    (frame->root (partial-collapse frame (dirname path)))
    :hints (("goal" :in-theory (enable frame->root))))
   (:rewrite
    subsetp-trans2
    ((y
      (frame-addrs-root
       (frame->frame (partial-collapse frame (dirname path)))))))
   (:change-goal nil t)
   :bash
   :bash
   (:rewrite
    subsetp-trans
    ((y
      (strip-cars
       (frame->frame (partial-collapse frame (dirname path)))))))
   :bash (:bash ("goal" :in-theory (enable frame->frame)))))

(defthm
  abs-find-file-after-abs-mkdir-lemma-16
  (implies (equal (list (basename path))
                  (fat32-filename-list-fix path))
           (not (consp (cdr path))))
  :hints (("goal" :in-theory (enable fat32-filename-list-fix basename))))

(defthm
  abs-find-file-after-abs-mkdir-1
  (implies
   (and
    (mv-nth '1 (collapse frame))
    (equal (frame-val->path (cdr (assoc-equal 0 frame)))
           nil)
    (consp (assoc-equal 0
                        (partial-collapse frame (dirname path))))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame))))
   (b*
       (((mv frame & mkdir-error-code)
         (abs-mkdir frame path)))
     (implies
      (equal mkdir-error-code 0)
      (b*
          (((mv file error-code)
            (abs-find-file frame path)))
        (and (equal error-code 0)
             (m1-file-equiv
              file
              (make-m1-file
               :d-e (d-e-install-directory-bit (d-e-fix nil)
                                                       t))))))))
  :hints
  (("goal" :in-theory (e/d (abs-mkdir abs-find-file abs-find-file-helper
                                      abs-find-file-after-abs-mkdir-lemma-1
                                      abs-find-file-after-abs-mkdir-lemma-4
                                      len-when-consp fat32-filename-list-fix
                                      abs-alloc abs-fs-fix)
                           (append-nthcdr-dirname-basename-lemma-1
                            (:definition nth)
                            (:definition true-listp)
                            (:definition string-listp)
                            (:rewrite true-listp-when-string-list)
                            (:rewrite fat32-filename-p-correctness-1)
                            (:rewrite abs-find-file-correctness-lemma-2)
                            (:rewrite
                             abs-find-file-helper-when-m1-file-alist-p)
                            (:rewrite abs-alloc-correctness-1)
                            (:rewrite abs-fs-p-when-hifat-no-dups-p)
                            (:rewrite abs-file-alist-p-correctness-1)
                            (:rewrite consp-of-nthcdr)
                            (:rewrite
                             abs-find-file-correctness-1-lemma-18)
                            (:definition no-duplicatesp-equal)
                            (:rewrite abs-fs-p-correctness-1)
                            (:definition len)))
    :use append-nthcdr-dirname-basename-lemma-1
    :do-not-induct t)))

;; Taking this together with abs-mkdir-correctness-lemma-47, it can be
;; determined how the abs-alloc is going to turn out...
(defthm
  abs-mkdir-correctness-lemma-73
  (implies
   (and
    (not (atom path))
    (not
     (and
      (zp (mv-nth 1 (abs-find-file-helper fs path)))
      (abs-directory-file-p (mv-nth 0
                                    (abs-find-file-helper fs path))))))
   (equal (mv-nth 1 (abs-alloc fs path new-index))
          (abs-fs-fix fs)))
  :hints
  (("goal"
    :in-theory
    (e/d (abs-find-file-helper abs-alloc fat32-filename-list-fix)
         (ctx-app-ok-when-abs-complete-lemma-2 nfix))
    :expand
    ((:with
      put-assoc-equal-without-change
      (equal
       (put-assoc-equal
        (car path)
        (abs-file (abs-file->d-e (cdr (assoc-equal (car path) fs)))
                  (list (nfix new-index)))
        fs)
       fs))
     (abs-alloc fs path new-index)
     (abs-file-contents-fix (list (nfix new-index))))
    :induct (abs-find-file-helper fs path))))

(defthm
  abs-mkdir-correctness-lemma-82
  (implies
   (and
    (equal (list (basename path))
           (fat32-filename-list-fix path))
    (abs-complete (frame-val->dir (cdr (assoc-equal 0 frame))))
    (not (consp (assoc-equal (basename path)
                             (frame-val->dir (cdr (assoc-equal 0 frame)))))))
   (hifat-equiv
    (mv-nth
     0
     (hifat-place-file (frame->root frame)
                       path
                       '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                         (contents))))
    (put-assoc-equal (basename path)
                     '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                       (contents))
                     (frame-val->dir (cdr (assoc-equal 0 frame))))))
  :instructions
  (:promote
   (:dive 1)
   (:= path
       (list (basename path))
       :equiv fat32-filename-list-equiv$inline)
   (:dive 2)
   :x
   :top
   (:bash ("goal" :in-theory (enable hifat-place-file
                                     fat32-filename-list-fix frame->root)))))

(defthm abs-mkdir-correctness-lemma-83
  (implies (fat32-filename-list-equiv (list (basename path))
                                      path)
           (consp path))
  :hints (("goal" :in-theory (enable fat32-filename-list-equiv)
           :do-not-induct t))
  :rule-classes :forward-chaining)

;; This is nice and general.
(defthm
  abs-mkdir-correctness-lemma-85
  (implies
   (and
    (fat32-filename-list-equiv
     x-path
     (nthcdr
      (len (frame-val->path (cdr (assoc-equal (abs-find-file-src frame path)
                                              frame))))
      path))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (prefixp (frame-val->path (cdr (assoc-equal (abs-find-file-src frame path)
                                                frame)))
             (fat32-filename-list-fix path)))
   (equal (abs-find-file-helper (frame-val->dir (cdr (assoc-equal
                                                      (abs-find-file-src frame path) frame)))
                                x-path)
          (abs-find-file frame path)))
  :hints
  (("goal" :in-theory (e/d nil
                           (nfix nat-equiv))
    :use abs-find-file-src-correctness-2
    :do-not-induct t)))

(defthmd
  abs-mkdir-correctness-lemma-43
  (implies
   (fat32-filename-p x)
   (iff (member-equal x (names-at fs relpath))
        (zp (mv-nth 1
                    (abs-find-file-helper fs (append relpath (list x)))))))
  :hints (("goal" :in-theory (enable names-at abs-find-file-helper (:DEFINITION
                                                                    BINARY-APPEND)))))

(defthm abs-mkdir-correctness-lemma-90
  (implies (fat32-filename-list-equiv (list (basename path))
                                      path)
           (not (consp (cdr path))))
  :hints (("goal" :in-theory (enable fat32-filename-list-equiv)))
  :rule-classes :forward-chaining)

(defthm
  abs-mkdir-correctness-lemma-92
  (implies (consp (assoc-equal (basename path)
                               (frame-val->dir (cdr (assoc-equal 0 frame)))))
           (consp (assoc-equal (basename path)
                               (frame->root frame))))
  :hints (("goal" :in-theory (enable frame->root))))

(defthm
  abs-mkdir-correctness-lemma-93
  (implies
   (and
    (not
     (equal
      (mv-nth
       1
       (abs-alloc
        (frame-val->dir
         (cdr
          (assoc-equal 0
                       (partial-collapse frame (dirname path)))))
        (dirname path)
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))
      (frame-val->dir
       (cdr
        (assoc-equal 0
                     (partial-collapse frame (dirname path)))))))
    (consp (dirname path)))
   (and
    (zp
     (mv-nth
      1
      (abs-find-file-helper
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path))))
    (abs-directory-file-p
     (mv-nth
      0
      (abs-find-file-helper
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path))))))
  :instructions (:promote (:contrapose 1)
                          (:dive 1)
                          (:rewrite abs-mkdir-correctness-lemma-73)
                          :top :bash)
  :rule-classes :forward-chaining)

(defthm
  abs-mkdir-correctness-lemma-94
  (implies
   (and
    (prefixp
     (frame-val->path
      (cdr
       (assoc-equal
        (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path))
        frame)))
     (dirname path))
    (<= 0 (+ -1 (len path)))
    (<=
     (+ -1 (len path))
     (len
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         frame))))))
   (ctx-app-ok
    (list
     (find-new-index
      (strip-cars (partial-collapse frame (dirname path)))))
    (find-new-index
     (strip-cars (partial-collapse frame (dirname path))))
    (nthcdr
     (len
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         frame))))
     (dirname path))))
  :hints (("goal" :in-theory (disable (:rewrite nthcdr-when->=-n-len-l))
           :use (:instance (:rewrite nthcdr-when->=-n-len-l)
                           (l (dirname path))
                           (n (+ -1 (len path)))))))

(defthm abs-mkdir-correctness-lemma-97
  (implies (not (consp path))
           (equal (dirname path) nil))
  :hints (("goal" :in-theory (enable dirname)))
  :rule-classes :type-prescription)

(defthm
  abs-mkdir-correctness-lemma-98
  (implies
   (and (hifat-equiv (mv-nth 0 (collapse frame))
                     fs)
        (no-duplicatesp-equal (strip-cars frame))
        (frame-p frame)
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
        (mv-nth 1 (collapse frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (m1-directory-file-p
         (mv-nth 0
                 (hifat-find-file fs (dirname path)))))
   (m1-directory-file-p
    (mv-nth
     '0
     (hifat-find-file
      (mv-nth '0
              (collapse (partial-collapse frame (dirname path))))
      (dirname path))))))

(defthmd abs-mkdir-correctness-lemma-99
  (implies (and (hifat-equiv fs1 fs2)
                (syntaxp (not (term-order fs1 fs2)))
                (fat32-filename-p name)
                (m1-file-alist-p fs1)
                (m1-file-alist-p fs2)
                (hifat-no-dups-p fs1)
                (hifat-no-dups-p fs2))
           (iff (consp (assoc-equal name fs1))
                (consp (assoc-equal name fs2))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable hifat-equiv))))

(defthm
  abs-mkdir-correctness-lemma-102
  (implies
   (and (hifat-equiv (mv-nth 0 (collapse frame))
                     fs)
        (m1-directory-file-p
         (mv-nth 0
                 (hifat-find-file fs (dirname path)))))
   (m1-directory-file-p (mv-nth 0
                                (hifat-find-file (mv-nth 0 (collapse frame))
                                                 (dirname path))))))

(defthm
  abs-mkdir-correctness-lemma-33
  (implies
   (and
    (no-duplicatesp-equal (strip-cars frame))
    (frame-p frame)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
    (mv-nth 1 (collapse frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path)))))
   (abs-directory-file-p
    (mv-nth
     0
     (hifat-find-file
      (mv-nth 0
              (collapse (partial-collapse frame (dirname path))))
      (dirname path)))))
  :hints
  (("goal"
    :in-theory (e/d (hifat-place-file)
                    ((:rewrite partial-collapse-correctness-1 . 1)))
    :use ((:instance (:rewrite partial-collapse-correctness-1 . 1)
                     (path (dirname path))
                     (frame frame)))
    :expand
    (:with
     (:rewrite hifat-equiv-when-absfat-equiv)
     (absfat-equiv
      (mv-nth 0
              (collapse (partial-collapse frame (dirname path))))
      fs))
    :do-not-induct t)))

(defthm abs-mkdir-correctness-lemma-71
  (equal (nthcdr (+ -1 (len path))
                 (dirname path))
         nil)
  :hints (("goal" :in-theory (e/d nil (len-of-dirname))
           :use len-of-dirname)))

(defthmd
  abs-mkdir-correctness-lemma-35
  (implies
   (and (m1-directory-file-p
         (mv-nth 0
                 (hifat-find-file fs (dirname path))))
        (consp path)
        (equal (mv-nth 1
                       (hifat-find-file fs (dirname path)))
               0))
   (equal (hifat-find-file fs path)
          (hifat-find-file
           (m1-file->contents
            (mv-nth 0
                    (hifat-find-file fs (dirname path))))
           (list (basename path)))))
  :hints
  (("goal" :in-theory (disable (:rewrite hifat-find-file-of-append-1))
    :use (:instance (:rewrite hifat-find-file-of-append-1)
                    (y (list (basename path)))
                    (x (dirname path))
                    (fs fs)))))

(defthm
  abs-mkdir-correctness-lemma-123
  (implies
   (and (no-duplicatesp-equal (strip-cars frame))
        (frame-p frame)
        (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
        (m1-file-alist-p fs)
        (mv-nth 1 (collapse frame))
        (hifat-equiv (mv-nth 0 (collapse frame))
                     fs)
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (equal (mv-nth 1
                       (hifat-find-file fs (dirname path)))
               0)
        (m1-directory-file-p
         (mv-nth 0
                 (hifat-find-file fs (dirname path)))))
   (iff
    (consp
     (assoc-equal (basename path)
                  (m1-file->contents
                   (mv-nth 0
                           (hifat-find-file (mv-nth 0 (collapse frame))
                                            (dirname path))))))
    (consp
     (assoc-equal
      (basename path)
      (m1-file->contents
       (mv-nth 0
               (hifat-find-file fs (dirname path))))))))
  :hints
  (("goal"
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-99)
     (fs1
      (m1-file->contents (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path)))))
     (name (basename path))
     (fs2 (m1-file->contents
           (mv-nth 0
                   (hifat-find-file fs (dirname path)))))))))

(encapsulate
  ()

  (local
   (defthmd
     lemma
     (implies
      (and (absfat-equiv fs1 fs2)
           (abs-fs-p fs1)
           (abs-fs-p fs2))
      (and (absfat-equiv
            (abs-file->contents (mv-nth 0 (abs-find-file-helper fs1 path)))
            (abs-file->contents (mv-nth 0 (abs-find-file-helper fs2 path))))
           (equal
            (abs-directory-file-p (mv-nth 0 (abs-find-file-helper fs1 path)))
            (abs-directory-file-p (mv-nth 0 (abs-find-file-helper fs2 path))))
           (equal (mv-nth 1 (abs-find-file-helper fs1 path))
                  (mv-nth 1 (abs-find-file-helper fs2 path)))))
     :hints (("goal" :in-theory (enable abs-find-file-helper)))))

  (defthm
    abs-mkdir-correctness-lemma-128
    (implies
     (absfat-equiv fs1 fs2)
     (and (absfat-equiv
           (abs-file->contents (mv-nth 0 (abs-find-file-helper fs1 path)))
           (abs-file->contents (mv-nth 0 (abs-find-file-helper fs2 path))))
          (equal
           (abs-directory-file-p (mv-nth 0 (abs-find-file-helper fs1 path)))
           (abs-directory-file-p (mv-nth 0 (abs-find-file-helper fs2 path))))
          (equal (mv-nth 1 (abs-find-file-helper fs1 path))
                 (mv-nth 1 (abs-find-file-helper fs2 path)))))
    :hints
    (("goal"
      :in-theory (e/d (abs-file-p-alt abs-fs-fix m1-regular-file-p)
                      ((:rewrite abs-file-p-of-abs-find-file-helper)))
      :do-not-induct t
      :use ((:instance lemma (fs1 (abs-fs-fix fs1))
                       (fs2 (abs-fs-fix fs2)))
            (:instance lemma (fs1 (abs-fs-fix fs2))
                       (fs2 (abs-fs-fix fs1)))
            (:instance (:rewrite abs-file-p-of-abs-find-file-helper)
                       (path path)
                       (fs fs2))
            (:instance (:rewrite abs-file-p-of-abs-find-file-helper)
                       (path path)
                       (fs fs1)))))
    :rule-classes
    ((:congruence
      :corollary
      (implies
       (absfat-equiv fs1 fs2)
       (absfat-equiv
        (abs-file->contents (mv-nth 0 (abs-find-file-helper fs1 path)))
        (abs-file->contents (mv-nth 0 (abs-find-file-helper fs2 path))))))
     (:congruence
      :corollary
      (implies
       (absfat-equiv fs1 fs2)
       (equal
        (abs-directory-file-p (mv-nth 0 (abs-find-file-helper fs1 path)))
        (abs-directory-file-p (mv-nth 0 (abs-find-file-helper fs2 path))))))
     (:congruence
      :corollary
      (implies
       (absfat-equiv fs1 fs2)
       (equal
        (mv-nth 1 (abs-find-file-helper fs1 path))
        (mv-nth 1 (abs-find-file-helper fs2 path))))))))

(defthmd
  abs-mkdir-correctness-lemma-36
  (implies
   (and
    (zp (abs-find-file-src frame path))
    (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
    (mv-nth 1 (collapse frame))
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (abs-separate frame)
    (abs-complete (abs-file->contents (mv-nth 0 (abs-find-file frame path))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (consp (assoc-equal '0 frame)))
   (and
    (equal (abs-find-file-helper (frame-val->dir (cdr (assoc-equal 0 frame)))
                                 path)
           (hifat-find-file (mv-nth 0 (collapse frame))
                            path))
    (equal (abs-find-file-helper (frame->root frame)
                                 path)
           (hifat-find-file (mv-nth 0 (collapse frame))
                            path))))
  :hints (("goal" :in-theory (e/d (frame->root)
                                  (abs-mkdir-correctness-lemma-85))
           :do-not-induct t
           :use (:instance abs-mkdir-correctness-lemma-85
                           (x-path path)))))

(defthm
  hifat-equiv-of-put-assoc-lemma-1
  (implies (and (m1-file-alist-p fs1)
                (hifat-no-dups-p fs1)
                (hifat-subsetp fs1 fs2)
                (hifat-no-dups-p (m1-file->contents val)))
           (hifat-subsetp (put-assoc-equal key val fs1)
                          (put-assoc-equal key val fs2)))
  :hints (("goal" :in-theory (enable hifat-subsetp)
           :induct (mv (hifat-subsetp fs1 fs2)
                       (put-assoc-equal key val fs1)))))

(defthm hifat-equiv-of-put-assoc-2
  (implies (and (hifat-equiv fs1 fs2)
                (syntaxp (not (term-order fs1 fs2)))
                (m1-file-alist-p fs1)
                (hifat-no-dups-p fs1)
                (m1-file-alist-p fs2)
                (hifat-no-dups-p fs2)
                (m1-file-p val)
                (fat32-filename-p key)
                (hifat-no-dups-p (m1-file->contents val)))
           (hifat-equiv (put-assoc-equal key val fs1)
                        (put-assoc-equal key val fs2)))
  :hints (("goal" :in-theory (enable hifat-equiv)
           :do-not-induct t)))

;; Kinda general.
(defthmd
  abs-mkdir-correctness-lemma-30
  (implies
   (zp (mv-nth 1 (abs-find-file-helper fs path)))
   (equal (mv-nth 0 (abs-alloc fs path new-index))
          (if (abs-directory-file-p (mv-nth 0 (abs-find-file-helper fs path)))
              (abs-file->contents (mv-nth 0 (abs-find-file-helper fs path)))
              nil)))
  :hints (("goal" :in-theory (enable abs-alloc abs-find-file-helper))))

(defthm
  abs-mkdir-correctness-lemma-197
  (subsetp-equal (abs-addrs (mv-nth 0 (abs-alloc fs path new-index)))
                 (abs-addrs (abs-fs-fix fs)))
  :hints (("goal" :in-theory (enable abs-alloc abs-fs-fix abs-addrs))))

(defthm
  abs-mkdir-correctness-lemma-157
  (implies
   (and (abs-file-alist-p fs)
        (not (consp (abs-addrs fs))))
   (not (consp (abs-addrs (abs-file->contents (cdr (assoc-equal name fs)))))))
  :hints (("goal" :in-theory (enable abs-addrs
                                     abs-file-alist-p abs-directory-file-p
                                     abs-file-p abs-file->contents)
           :induct (abs-file-alist-p fs))))

(defthmd
  abs-mkdir-correctness-lemma-76
  (implies (not (consp (abs-addrs (abs-fs-fix fs))))
           (not (consp (abs-addrs (mv-nth 0 (abs-alloc fs path new-index))))))
  :hints (("goal" :in-theory (enable abs-alloc))))

(defthmd
  abs-pwrite-correctness-lemma-1
  (implies
   (consp path)
   (equal
    (hifat-place-file fs path file)
    (cond
     ((and (< 0
              (mv-nth 1 (hifat-find-file fs (dirname path))))
           (not (equal (mv-nth 1 (hifat-find-file fs (dirname path)))
                       2)))
      (cons (hifat-file-alist-fix fs) '(20)))
     ((atom (dirname path))
      (hifat-place-file fs (list (basename path))
                        file))
     ((atom (list (basename path)))
      (hifat-place-file fs (dirname path)
                        file))
     ((equal (mv-nth 1 (hifat-find-file fs (dirname path)))
             2)
      (cons (hifat-file-alist-fix fs) '(2)))
     ((not
       (m1-directory-file-p (mv-nth 0 (hifat-find-file fs (dirname path)))))
      (cons (hifat-file-alist-fix fs) '(20)))
     (t
      (list
       (mv-nth
        0
        (hifat-place-file
         fs (dirname path)
         (m1-file
          (m1-file->d-e (mv-nth 0 (hifat-find-file fs (dirname path))))
          (mv-nth
           0
           (hifat-place-file
            (m1-file->contents (mv-nth 0 (hifat-find-file fs (dirname path))))
            (list (basename path))
            file)))))
       (mv-nth
        1
        (hifat-place-file
         (m1-file->contents (mv-nth 0 (hifat-find-file fs (dirname path))))
         (list (basename path))
         file)))))))
  :hints (("goal" :in-theory (disable (:rewrite hifat-place-file-of-append-1))
           :use (:instance (:rewrite hifat-place-file-of-append-1)
                           (file file)
                           (y (list (basename path)))
                           (x (dirname path))
                           (fs fs))))
  :rule-classes
  ((:rewrite
    :corollary
    (equal
     (hifat-place-file fs path file)
     (cond
      ((atom path)
       (mv (hifat-file-alist-fix fs) *enoent*))
      ((and (< 0
               (mv-nth 1 (hifat-find-file fs (dirname path))))
            (not (equal (mv-nth 1 (hifat-find-file fs (dirname path)))
                        2)))
       (cons (hifat-file-alist-fix fs) '(20)))
      ((atom (dirname path))
       (hifat-place-file fs (list (basename path))
                         file))
      ((atom (list (basename path)))
       (hifat-place-file fs (dirname path)
                         file))
      ((equal (mv-nth 1 (hifat-find-file fs (dirname path)))
              2)
       (cons (hifat-file-alist-fix fs) '(2)))
      ((not
        (m1-directory-file-p (mv-nth 0 (hifat-find-file fs (dirname path)))))
       (cons (hifat-file-alist-fix fs) '(20)))
      (t
       (list
        (mv-nth
         0
         (hifat-place-file
          fs (dirname path)
          (m1-file
           (m1-file->d-e (mv-nth 0 (hifat-find-file fs (dirname path))))
           (mv-nth 0
                   (hifat-place-file
                    (m1-file->contents
                     (mv-nth 0 (hifat-find-file fs (dirname path))))
                    (list (basename path))
                    file)))))
        (mv-nth
         1
         (hifat-place-file
          (m1-file->contents (mv-nth 0 (hifat-find-file fs (dirname path))))
          (list (basename path))
          file))))))
    :hints (("goal" :do-not-induct t
             :in-theory (enable hifat-place-file))))))

(encapsulate
  ()

  (local
   (in-theory
    (e/d (collapse ctx-app 1st-complete
                   collapse-this hifat-place-file
                   hifat-find-file
                   abs-alloc
                   abs-mkdir-correctness-lemma-16
                   assoc-equal-of-frame-with-root
                   abs-separate dist-names abs-fs-fix
                   abs-addrs frame-addrs-root
                   frame->root-of-put-assoc
                   frame->frame-of-put-assoc
                   abs-mkdir-correctness-lemma-43
                   abs-find-file-helper
                   abs-place-file-helper)
         ((:rewrite put-assoc-equal-without-change . 2)
          (:rewrite
           abs-separate-of-frame->frame-of-collapse-this-lemma-8
           . 2)
          (:rewrite abs-addrs-of-ctx-app-2)
          (:rewrite remove-when-absent)
          (:rewrite
           subsetp-of-abs-addrs-of-put-assoc-lemma-1)
          (:linear count-free-clusters-correctness-1)
          (:rewrite m1-file-p-when-m1-regular-file-p)
          (:definition len)
          (:rewrite nthcdr-when->=-n-len-l)
          (:rewrite abs-file-fix-when-abs-file-p)
          (:rewrite abs-find-file-correctness-lemma-2)
          (:rewrite assoc-after-remove-assoc)
          (:definition acl2-number-listp)
          (:rewrite 1st-complete-correctness-1)
          (:rewrite abs-addrs-when-m1-file-contents-p)
          (:rewrite
           abs-separate-of-frame->frame-of-collapse-this-lemma-11)
          (:rewrite
           absfat-equiv-implies-set-equiv-addrs-at-1-lemma-1)
          (:rewrite
           abs-fs-fix-of-put-assoc-equal-lemma-2)
          (:rewrite abs-fs-p-of-ctx-app)
          (:type-prescription
           abs-addrs-of-remove-assoc-lemma-1)
          (:definition binary-append)
          (:definition true-listp)
          (:rewrite
           partial-collapse-correctness-lemma-2)
          (:definition rational-listp)
          (:rewrite list-equiv-when-true-listp)
          (:rewrite ctx-app-when-not-ctx-app-ok)
          (:rewrite ctx-app-ok-when-abs-complete)
          (:rewrite nth-when->=-n-len-l)
          (:rewrite
           no-duplicatesp-of-abs-addrs-of-remove-assoc-lemma-3)
          (:rewrite
           abs-separate-of-frame->frame-of-collapse-this-lemma-15)
          (:rewrite m1-file-alist-p-when-subsetp-equal)
          (:type-prescription
           abs-find-file-correctness-1-lemma-17)
          (:rewrite collapse-hifat-place-file-lemma-6)
          (:definition nth)
          (:rewrite
           abs-find-file-after-abs-mkdir-lemma-11)
          (:rewrite
           hifat-find-file-correctness-1-lemma-1)
          abs-separate-of-frame->frame-of-collapse-this-lemma-8
          (:rewrite
           abs-find-file-after-abs-mkdir-lemma-13)
          (:rewrite
           abs-file-alist-p-of-abs-file->contents)
          (:rewrite member-of-abs-addrs-when-natp . 2)
          (:type-prescription assoc-when-zp-len)
          (:rewrite abs-addrs-of-ctx-app-2)
          (:definition put-assoc-equal)
          (:rewrite
           abs-file-contents-fix-when-abs-file-contents-p)
          (:rewrite
           abs-file-contents-p-when-m1-file-contents-p)
          (:rewrite
           hifat-find-file-correctness-1-lemma-1)
          (:rewrite abs-fs-p-of-ctx-app)
          (:definition binary-append)
          (:rewrite absfat-subsetp-transitivity-lemma-7)
          (:rewrite assoc-after-remove-assoc)
          (:rewrite abs-find-file-correctness-lemma-2)
          (:rewrite len-when-prefixp)
          (:rewrite m1-directory-file-p-when-m1-file-p)
          (:rewrite consp-of-assoc-of-abs-fs-fix)
          (:rewrite
           abs-find-file-correctness-1-lemma-18)
          (:rewrite
           abs-find-file-correctness-1-lemma-40)
          (:rewrite
           abs-separate-of-frame->frame-of-collapse-this-lemma-7)
          (:rewrite nth-when-prefixp)
          (:rewrite abs-addrs-of-ctx-app-1-lemma-2)
          (:rewrite member-of-abs-top-addrs)
          (:rewrite abs-find-file-correctness-lemma-12)
          (:linear position-when-member)
          (:linear position-equal-ac-when-member)
          (:rewrite prefixp-one-way-or-another . 1)
          (:rewrite member-of-abs-addrs-when-natp . 1)
          (:rewrite hifat-subsetp-transitive-lemma-1)
          abs-separate-of-frame->frame-of-collapse-this-lemma-13
          (:rewrite append-atom-under-list-equiv)
          (:rewrite
           absfat-equiv-implies-set-equiv-names-at-1-lemma-1)
          (:rewrite member-of-abs-fs-fix-when-natp)
          (:type-prescription
           abs-separate-of-frame->frame-of-collapse-this-lemma-7)
          (:rewrite
           m1-file-alist-p-of-cdr-when-m1-file-alist-p)
          (:rewrite
           fat32-filename-p-of-nth-when-fat32-filename-list-p)
          (:rewrite m1-file-alist-p-when-not-consp)
          (:rewrite
           abs-addrs-of-remove-assoc-lemma-1)
          (:rewrite
           abs-no-dups-p-of-abs-file->contents-of-cdr-of-assoc)
          (:rewrite subsetp-member . 2)
          (:rewrite subsetp-member . 1)
          (:rewrite
           fat32-filename-p-when-member-equal-of-fat32-filename-list-p)
          (:rewrite path-clear-when-prefixp-lemma-1)
          (:rewrite
           absfat-equiv-implies-set-equiv-names-at-1-lemma-2)
          (:rewrite abs-mkdir-correctness-lemma-58)
          (:rewrite subsetp-member . 4)
          (:rewrite ctx-app-ok-when-not-natp)
          (:rewrite ctx-app-when-not-natp)
          (:rewrite
           ctx-app-ok-when-absfat-equiv-lemma-3)
          (:rewrite
           abs-separate-of-frame->frame-of-collapse-this-lemma-14)
          (:rewrite collapse-hifat-place-file-lemma-9)
          (:rewrite collapse-hifat-place-file-lemma-11)
          (:rewrite
           absfat-equiv-implies-set-equiv-names-at-1-lemma-4)
          (:rewrite
           abs-find-file-after-abs-mkdir-lemma-7)
          (:rewrite consp-of-remove-assoc-1)
          (:rewrite abs-find-file-correctness-lemma-6)
          (:rewrite
           abs-find-file-of-put-assoc-lemma-7 . 1)
          (:rewrite
           abs-find-file-helper-of-collapse-lemma-2)
          (:rewrite abs-find-file-correctness-lemma-3)
          (:rewrite
           fat32-filename-p-of-caar-when-m1-file-alist-p)
          (:rewrite subsetp-car-member)
          (:rewrite abs-mkdir-correctness-lemma-59)
          (:rewrite m1-file-alist-p-of-cons)
          (:rewrite abs-mkdir-correctness-lemma-102)
          (:linear
           abs-separate-of-frame->frame-of-collapse-this-lemma-11)
          (:rewrite abs-find-file-correctness-lemma-14)
          (:rewrite subsetp-trans)
          prefixp-when-not-consp-right
          1st-complete-of-put-assoc-2
          cdr-of-append-when-consp
          abs-no-dups-p-when-m1-file-alist-p
          fat32-filename-list-fix-when-zp-len
          (:rewrite m1-regular-file-p-correctness-1)
          abs-file-alist-p-when-m1-file-alist-p
          abs-alloc-when-not-natp
          (:rewrite prefixp-transitive . 1)
          absfat-equiv-implies-set-equiv-addrs-at-1-lemma-2
          (:rewrite
           m1-file-alist-p-of-abs-place-file-helper)
          path-clear-when-prefixp-lemma-2
          car-of-append
          names-at-when-prefixp
          list-fix-when-true-listp
          ctx-app-ok-of-abs-place-file-helper-1
          true-listp-when-string-list
          m1-regular-file-p-of-m1-file
          d-e-p-when-member-equal-of-d-e-list-p
          abs-mkdir-correctness-lemma-64
          (:rewrite hifat-place-file-of-append-1)
          (:type-prescription
           1st-complete-correctness-1)
          (:rewrite
           names-at-of-abs-place-file-helper-1)
          (:rewrite abs-place-file-helper-correctness-2)
          (:rewrite
           hifat-file-alist-fix-when-hifat-no-dups-p)
          (:rewrite fat32-filename-list-p-of-append)
          (:rewrite
           absfat-place-file-correctness-lemma-6)
          (:rewrite 1st-complete-of-put-assoc-lemma-1)
          (:rewrite list-fix-when-len-zero)
          (:rewrite len-of-nthcdr)
          (:rewrite list-fix-when-not-consp)
          (:rewrite collapse-congruence-lemma-5)
          (:rewrite len-of-append)
          (:rewrite
           fat32-filename-list-p-when-subsetp-equal)
          (:rewrite abs-addrs-of-put-assoc-lemma-1)
          (:rewrite
           member-equal-of-strip-cars-when-m1-file-alist-p)
          (:rewrite hifat-file-alist-fix-guard-lemma-1)
          (:rewrite abs-addrs-of-put-assoc-lemma-2)
          (:rewrite true-listp-when-d-e-p)))))

  (defthm
    abs-mkdir-correctness-lemma-162
    (implies
     (and
      (mv-nth
       1
       (collapse
        (frame-with-root
         (frame->root (partial-collapse frame (dirname path)))
         (put-assoc-equal
          (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path))
          (frame-val
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame))))
           (mv-nth
            0
            (abs-place-file-helper
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                (frame->frame (partial-collapse frame (dirname path))))))
             (append
              (nthcdr
               (len
                (frame-val->path
                 (cdr
                  (assoc-equal
                   (abs-find-file-src (partial-collapse frame (dirname path))
                                      (dirname path))
                   frame))))
               (dirname path))
              (list (basename path)))
             '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
               (contents))))
           (frame-val->src
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame)))))
          (frame->frame (partial-collapse frame (dirname path)))))))
      (not (equal 0
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path)))))
     (mv-nth
      1
      (collapse
       (frame-with-root
        (frame->root (partial-collapse frame (dirname path)))
        (put-assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         (frame-val
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src (partial-collapse frame (dirname path))
                                (dirname path))
             frame)))
          (mv-nth
           0
           (abs-place-file-helper
            (frame-val->dir
             (cdr
              (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               (partial-collapse frame (dirname path)))))
            (append
             (nthcdr
              (len
               (frame-val->path
                (cdr
                 (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  frame))))
              (dirname path))
             (list (basename path)))
            '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
              (contents))))
          (frame-val->src
           (cdr
            (assoc-equal
             (abs-find-file-src (partial-collapse frame (dirname path))
                                (dirname path))
             frame))))
         (remove-assoc-equal
          (find-new-index
           (strip-cars (partial-collapse frame (dirname path))))
          (frame->frame (partial-collapse frame (dirname path)))))))))
    :hints (("goal" :do-not-induct t
             :in-theory (enable assoc-of-frame->frame))))

  (defthm
    abs-mkdir-correctness-lemma-166
    (equal
     (remove-assoc-equal
      (find-new-index (strip-cars frame))
      (frame->frame frame))
     (frame->frame frame))
    :hints (("goal" :in-theory (enable assoc-of-frame->frame)
             :do-not-induct t)))

  (defthm
    abs-mkdir-correctness-lemma-167
    (implies
     (and (no-duplicatesp-equal (strip-cars frame))
          (frame-p frame)
          (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
          (mv-nth 1 (collapse frame))
          (abs-separate frame)
          (subsetp-equal (abs-addrs (frame->root frame))
                         (frame-addrs-root (frame->frame frame))))
     (mv-nth
      1
      (collapse
       (frame-with-root
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (frame->frame (partial-collapse frame (dirname path)))))))
    :instructions
    (:promote
     (:= (frame-val->dir
          (cdr (assoc-equal 0
                            (partial-collapse frame (dirname path)))))
         (frame->root (partial-collapse frame (dirname path)))
         :hints (("goal" :in-theory (enable frame->root))))
     :bash))

  (defthm
    abs-mkdir-correctness-lemma-169
    (implies
     (and (hifat-equiv (mv-nth 0 (collapse frame))
                       fs)
          (m1-directory-file-p (mv-nth 0 (hifat-find-file fs (dirname path)))))
     (m1-directory-file-p (mv-nth '0
                                  (hifat-find-file (mv-nth '0 (collapse frame))
                                                   (dirname path)))))
    :hints (("goal" :do-not-induct t)))

  (defthm
    abs-mkdir-correctness-lemma-170
    (abs-no-dups-p
     (remove1-assoc-equal
      (basename path)
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir$inline
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (dirname path)
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path)))))))))

  (defthm
    abs-mkdir-correctness-lemma-171
    (implies
     (and (no-duplicatesp-equal (strip-cars frame))
          (frame-p frame)
          (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
          (mv-nth 1 (collapse frame))
          (abs-separate frame)
          (subsetp-equal (abs-addrs (frame->root frame))
                         (frame-addrs-root (frame->frame frame))))
     (absfat-equiv
      (mv-nth
       0
       (collapse
        (frame-with-root
         (frame-val->dir
          (cdr (assoc-equal 0
                            (partial-collapse frame (dirname path)))))
         (frame->frame (partial-collapse frame (dirname path))))))
      (mv-nth 0 (collapse frame))))
    :instructions
    (:promote
     (:= (frame-val->dir
          (cdr (assoc-equal 0
                            (partial-collapse frame (dirname path)))))
         (frame->root (partial-collapse frame (dirname path)))
         :hints (("goal" :in-theory (enable frame->root))))
     :bash))

  (defthm
    abs-mkdir-correctness-lemma-19
    (implies
     (and (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
          (abs-separate frame)
          (frame-p frame)
          (no-duplicatesp-equal (strip-cars frame))
          (subsetp-equal (abs-addrs (frame->root frame))
                         (frame-addrs-root (frame->frame frame)))
          (mv-nth 1 (collapse frame))
          (hifat-no-dups-p (m1-file->contents file)))
     (hifat-equiv
      (mv-nth
       0
       (hifat-place-file (mv-nth 0
                                 (collapse (partial-collapse frame path1)))
                         path2 file))
      (mv-nth 0
              (hifat-place-file (mv-nth 0 (collapse frame))
                                path2 file))))
    :hints
    (("goal"
      :do-not-induct t
      :in-theory (disable partial-collapse-correctness-1)
      :use
      ((:instance
        hifat-place-file-correctness-4 (path path2)
        (m1-file-alist1 (mv-nth 0
                                (collapse (partial-collapse frame path1))))
        (m1-file-alist2 (mv-nth 0 (collapse frame))))
       (:instance partial-collapse-correctness-1 (path path1))))))

  (defthm
    abs-mkdir-correctness-lemma-174
    (implies
     (and
      (mv-nth
       1
       (collapse
        (frame-with-root
         (frame->root (partial-collapse frame (dirname path)))
         (put-assoc-equal
          (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path))
          (frame-val
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame))))
           (mv-nth
            0
            (abs-place-file-helper
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                (frame->frame (partial-collapse frame (dirname path))))))
             (nthcdr
              (len
               (frame-val->path
                (cdr
                 (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  frame))))
              path)
             '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
               (contents))))
           (frame-val->src
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame)))))
          (frame->frame (partial-collapse frame (dirname path)))))))
      (not (equal 0
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path)))))
     (mv-nth
      1
      (collapse
       (frame-with-root
        (frame->root (partial-collapse frame (dirname path)))
        (put-assoc-equal
         (abs-find-file-src (partial-collapse frame (dirname path))
                            (dirname path))
         (frame-val
          (frame-val->path
           (cdr (assoc-equal
                 (abs-find-file-src (partial-collapse frame (dirname path))
                                    (dirname path))
                 frame)))
          (mv-nth
           0
           (abs-place-file-helper
            (frame-val->dir
             (cdr
              (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               (partial-collapse frame (dirname path)))))
            (nthcdr
             (len
              (frame-val->path
               (cdr
                (assoc-equal
                 (abs-find-file-src (partial-collapse frame (dirname path))
                                    (dirname path))
                 frame))))
             path)
            '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
              (contents))))
          (frame-val->src
           (cdr (assoc-equal
                 (abs-find-file-src (partial-collapse frame (dirname path))
                                    (dirname path))
                 frame))))
         (frame->frame (partial-collapse frame (dirname path))))))))
    :hints (("goal" :in-theory (enable assoc-of-frame->frame))))

  (defthm
    abs-mkdir-correctness-lemma-175
    (implies (and (not (consp (cdr path))))
             (not (consp (dirname path))))
    :hints (("goal" :in-theory (enable dirname len hifat-find-file)))
    :rule-classes :type-prescription)

  (defthm
    abs-mkdir-correctness-lemma-182
    (implies
     (not (equal (abs-find-file-src (partial-collapse frame (dirname path))
                                    (dirname path))
                 0))
     (equal
      (mv-nth
       0
       (collapse
        (frame-with-root
         (frame->root (partial-collapse frame (dirname path)))
         (put-assoc-equal
          (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path))
          (frame-val
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame))))
           (mv-nth
            0
            (abs-place-file-helper
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                (frame->frame (partial-collapse frame (dirname path))))))
             (append
              (nthcdr
               (len
                (frame-val->path
                 (cdr
                  (assoc-equal
                   (abs-find-file-src (partial-collapse frame (dirname path))
                                      (dirname path))
                   frame))))
               (dirname path))
              (list (basename path)))
             '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
               (contents))))
           (frame-val->src
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame)))))
          (frame->frame (partial-collapse frame (dirname path)))))))
      (mv-nth
       0
       (collapse
        (frame-with-root
         (frame->root (partial-collapse frame (dirname path)))
         (put-assoc-equal
          (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path))
          (frame-val
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  frame)))
           (mv-nth
            0
            (abs-place-file-helper
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                (partial-collapse frame (dirname path)))))
             (append
              (nthcdr
               (len
                (frame-val->path
                 (cdr
                  (assoc-equal
                   (abs-find-file-src (partial-collapse frame (dirname path))
                                      (dirname path))
                   frame))))
               (dirname path))
              (list (basename path)))
             '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
               (contents))))
           (frame-val->src
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  frame))))
          (frame->frame (partial-collapse frame (dirname path)))))))))
    :hints (("goal" :in-theory (enable assoc-of-frame->frame))))

  (defthm
    abs-mkdir-correctness-lemma-183
    (implies
     (and (hifat-no-dups-p (m1-file->contents file))
          (no-duplicatesp-equal (strip-cars frame))
          (frame-p frame)
          (equal (frame-val->src (cdr (assoc-equal 0 frame)))
                 0)
          (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
          (mv-nth 1 (collapse frame))
          (abs-separate frame)
          (subsetp-equal (abs-addrs (frame->root frame))
                         (frame-addrs-root (frame->frame frame))))
     (absfat-equiv
      (mv-nth 0
              (hifat-place-file
               (mv-nth 0
                       (collapse (partial-collapse frame (dirname path))))
               path2 file))
      (mv-nth 0
              (hifat-place-file (mv-nth 0 (collapse frame))
                                path2 file))))
    :hints
    (("goal"
      :do-not-induct t
      :in-theory (disable (:rewrite hifat-place-file-correctness-4))
      :use
      (:instance
       (:rewrite hifat-place-file-correctness-4)
       (file file)
       (path path2)
       (m1-file-alist2
        (mv-nth 0
                (collapse (partial-collapse frame (dirname path)))))
       (m1-file-alist1 (mv-nth 0 (collapse frame)))))))

  (defthm
    abs-mkdir-correctness-lemma-127
    (implies
     (and (no-duplicatesp-equal (strip-cars frame))
          (frame-p frame)
          (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
          (abs-separate frame)
          (subsetp-equal (abs-addrs (frame->root frame))
                         (frame-addrs-root (frame->frame frame))))
     (not
      (member-equal
       (find-new-index (strip-cars (partial-collapse frame (dirname path))))
       (abs-addrs
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))))))
    :hints
    (("goal"
      :in-theory (e/d (frame->root)
                      ((:rewrite subsetp-member . 3)
                       (:rewrite path-clear-partial-collapse-when-zp-src-lemma-3)))
      :use
      (:instance
       (:rewrite subsetp-member . 3)
       (y (frame-addrs-root
           (frame->frame (partial-collapse frame (dirname path)))))
       (x
        (abs-addrs
         (frame-val->dir
          (cdr (assoc-equal 0
                            (partial-collapse frame (dirname path)))))))
       (a (find-new-index
           (strip-cars (partial-collapse frame (dirname path)))))))))

  (defthm
    abs-mkdir-correctness-lemma-130
    (implies
     (and (no-duplicatesp-equal (strip-cars frame))
          (frame-p frame)
          (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
          (mv-nth 1 (collapse frame))
          (abs-separate frame)
          (subsetp-equal (abs-addrs (frame->root frame))
                         (frame-addrs-root (frame->frame frame)))
          (not (equal (abs-find-file-src (partial-collapse frame (dirname path))
                                         (dirname path))
                      0)))
     (not
      (member-equal
       (find-new-index (strip-cars (partial-collapse frame (dirname path))))
       (abs-addrs
        (frame-val->dir
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               (partial-collapse frame (dirname path)))))))))
    :instructions
    ((in-theory (disable
                 (:rewrite path-clear-partial-collapse-when-zp-src-lemma-3))) :promote
                 (:dive 1)
                 (:= (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                                     (dirname path))
                                  (partial-collapse frame (dirname path)))
                     (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                                     (dirname path))
                                  (frame->frame (partial-collapse frame (dirname path))))
                     :hints :none)
                 (:change-goal nil t)
                 (:dive 2)
                 (:rewrite assoc-of-frame->frame)
                 :top :bash
                 :top :bash))

  (defthm
    abs-mkdir-correctness-lemma-38
    (implies
     (and
      (hifat-equiv
       (mv-nth
        0
        (collapse
         (frame-with-root
          (frame-val->dir
           (cdr (assoc-equal 0
                             (partial-collapse frame (dirname path)))))
          (frame->frame (partial-collapse frame (dirname path))))))
       (mv-nth 0 (collapse frame)))
      (hifat-no-dups-p (m1-file->contents file)))
     (and
      (equal
       (mv-nth
        1
        (hifat-place-file
         (mv-nth
          0
          (collapse
           (frame-with-root
            (frame-val->dir
             (cdr (assoc-equal 0
                               (partial-collapse frame (dirname path)))))
            (frame->frame (partial-collapse frame (dirname path))))))
         path2 file))
       (mv-nth 1
               (hifat-place-file (mv-nth 0 (collapse frame))
                                 path2 file)))
      (hifat-equiv
       (mv-nth
        0
        (hifat-place-file
         (mv-nth
          0
          (collapse
           (frame-with-root
            (frame-val->dir
             (cdr (assoc-equal 0
                               (partial-collapse frame (dirname path)))))
            (frame->frame (partial-collapse frame (dirname path))))))
         path2 file))
       (mv-nth 0
               (hifat-place-file (mv-nth 0 (collapse frame))
                                 path2 file)))))
    :hints
    (("goal"
      :in-theory (disable hifat-place-file-correctness-4)
      :use
      (:instance
       hifat-place-file-correctness-4
       (m1-file-alist1 (mv-nth 0 (collapse frame)))
       (m1-file-alist2
        (mv-nth
         0
         (collapse
          (frame-with-root
           (frame-val->dir
            (cdr (assoc-equal 0
                              (partial-collapse frame (dirname path)))))
           (frame->frame (partial-collapse frame (dirname path)))))))
       (path path2)))))

  (defthm
    abs-mkdir-correctness-lemma-160
    (implies
     (and (no-duplicatesp-equal (strip-cars frame))
          (frame-p frame)
          (equal (frame-val->src (cdr (assoc-equal 0 frame)))
                 0)
          (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
          (mv-nth 1 (collapse frame))
          (abs-separate frame)
          (subsetp-equal (abs-addrs (frame->root frame))
                         (frame-addrs-root (frame->frame frame))))
     (hifat-equiv
      (mv-nth
       0
       (collapse
        (frame-with-root
         (frame-val->dir$inline
          (cdr (assoc-equal 0
                            (partial-collapse frame (dirname path)))))
         (frame->frame (partial-collapse frame (dirname path))))))
      (mv-nth 0 (collapse frame))))
    :instructions
    (:promote
     (:= (frame-val->dir$inline
          (cdr (assoc-equal '0
                            (partial-collapse frame (dirname path)))))
         (frame->root (partial-collapse frame (dirname path)))
         :hints (("goal" :in-theory (enable frame->root))))
     :bash))

  (defthm
    abs-mkdir-correctness-lemma-168
    (implies
     (and (no-duplicatesp-equal (strip-cars frame))
          (frame-p frame)
          (equal (frame-val->src (cdr (assoc-equal 0 frame)))
                 0)
          (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
          (mv-nth 1 (collapse frame))
          (hifat-equiv (mv-nth 0 (collapse frame))
                       fs)
          (abs-separate frame)
          (subsetp-equal (abs-addrs (frame->root frame))
                         (frame-addrs-root (frame->frame frame)))
          (m1-directory-file-p (mv-nth 0 (hifat-find-file fs (dirname path)))))
     (hifat-equiv
      (put-assoc-equal
       (basename path)
       '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
         (contents))
       (m1-file->contents
        (mv-nth 0
                (hifat-find-file
                 (mv-nth 0
                         (collapse (partial-collapse frame (dirname path))))
                 (dirname path)))))
      (put-assoc-equal
       (basename path)
       '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
         (contents))
       (m1-file->contents (mv-nth 0
                                  (hifat-find-file (mv-nth 0 (collapse frame))
                                                   (dirname path)))))))
    :hints
    (("goal"
      :in-theory (disable (:rewrite hifat-equiv-of-put-assoc-2))
      :use
      (:instance
       (:rewrite hifat-equiv-of-put-assoc-2)
       (fs1
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0
                   (collapse (partial-collapse frame (dirname path))))
           (dirname path)))))
       (val '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
              (contents)))
       (key (basename path))
       (fs2 (m1-file->contents$inline
             (mv-nth '0
                     (hifat-find-file (mv-nth '0 (collapse frame))
                                      (dirname path)))))))))

  (defthm
    abs-mkdir-correctness-lemma-165
    (implies
     (and (no-duplicatesp-equal (strip-cars frame))
          (frame-p frame)
          (equal (frame-val->src (cdr (assoc-equal 0 frame)))
                 0)
          (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
          (mv-nth 1 (collapse frame))
          (hifat-equiv (mv-nth 0 (collapse frame))
                       fs)
          (abs-separate frame)
          (subsetp-equal (abs-addrs (frame->root frame))
                         (frame-addrs-root (frame->frame frame)))
          (m1-directory-file-p (mv-nth 0 (hifat-find-file fs (dirname path)))))
     (hifat-equiv
      (mv-nth
       0
       (hifat-place-file
        (mv-nth 0 (collapse frame))
        (dirname path)
        (m1-file
         (m1-file->d-e
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0
                    (collapse (partial-collapse frame (dirname path))))
            (dirname path))))
         (put-assoc-equal
          (basename path)
          '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
            (contents))
          (m1-file->contents
           (mv-nth
            0
            (hifat-find-file
             (mv-nth 0
                     (collapse (partial-collapse frame (dirname path))))
             (dirname path))))))))
      (mv-nth
       0
       (hifat-place-file
        (mv-nth 0 (collapse frame))
        (dirname path)
        (m1-file
         (m1-file->d-e (mv-nth 0
                                   (hifat-find-file (mv-nth 0 (collapse frame))
                                                    (dirname path))))
         (put-assoc-equal
          (basename path)
          '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
            (contents))
          (m1-file->contents
           (mv-nth 0
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path))))))))))
    :hints
    (("goal"
      :do-not-induct t
      :in-theory (disable hifat-place-file-when-hifat-equiv-1)
      :use
      (:instance
       hifat-place-file-when-hifat-equiv-1
       (file1
        (m1-file
         (m1-file->d-e
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0
                    (collapse (partial-collapse frame (dirname path))))
            (dirname path))))
         (put-assoc-equal
          (basename path)
          '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
            (contents))
          (m1-file->contents
           (mv-nth
            0
            (hifat-find-file
             (mv-nth 0
                     (collapse (partial-collapse frame (dirname path))))
             (dirname path)))))))
       (path (dirname path))
       (fs (mv-nth 0 (collapse frame)))
       (file2
        (m1-file (m1-file->d-e$inline
                  (mv-nth '0
                          (hifat-find-file (mv-nth '0 (collapse frame))
                                           (dirname path))))
                 (put-assoc-equal
                  (basename path)
                  '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                             0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                    (contents))
                  (m1-file->contents$inline
                   (mv-nth '0
                           (hifat-find-file (mv-nth '0 (collapse frame))
                                            (dirname path)))))))))))

  (defthm
    abs-mkdir-correctness-lemma-176
    (implies
     (and
      (mv-nth 1 (collapse frame))
      (frame-p frame)
      (abs-separate frame)
      (subsetp-equal (abs-addrs (frame->root frame))
                     (frame-addrs-root (frame->frame frame)))
      (no-duplicatesp-equal (strip-cars frame))
      (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
      (m1-directory-file-p (mv-nth 0
                                   (hifat-find-file (mv-nth 0 (collapse frame))
                                                    (dirname path)))))
     (m1-directory-file-p
      (mv-nth '0
              (hifat-find-file
               (mv-nth '0
                       (collapse (partial-collapse frame (dirname path))))
               (dirname path)))))
    :instructions
    (:promote (:dive 1 2 1)
              (:rewrite (:rewrite partial-collapse-correctness-1 . 2))
              :top :bash))

  (defthm
    abs-mkdir-correctness-lemma-74
    (implies (and (abs-no-dups-file-p file)
                  (fat32-filename-list-equiv (list (basename path))
                                             path)
                  (absfat-equiv (mv-nth 0 (collapse frame))
                                fs)
                  (not (consp (assoc-equal (basename path)
                                           (mv-nth 0 (collapse frame))))))
             (absfat-equiv (put-assoc-equal (basename path)
                                            file (mv-nth 0 (collapse frame)))
                           (mv-nth 0
                                   (abs-place-file-helper fs path file))))
    :instructions
    (:promote
     (:dive 2 2 1)
     (:= fs (mv-nth 0 (collapse frame))
         :equiv absfat-equiv)
     :top (:bash ("goal" :in-theory (enable basename fat32-filename-list-equiv
                                            fat32-filename-list-fix
                                            abs-place-file-helper)))))

  (defthm
    abs-mkdir-correctness-lemma-32
    (implies
     (and
      (fat32-filename-list-equiv (append (dirname path)
                                         (list (basename path)))
                                 path)
      (frame-reps-fs frame fs)
      (abs-fs-p fs)
      (m1-file-alist-p fs)
      (not (consp (dirname path)))
      (not (equal (mv-nth 1
                          (hifat-find-file (mv-nth 0 (collapse frame))
                                           path))
                  0)))
     (not
      (consp
       (abs-addrs
        (remove-assoc-equal
         (basename path)
         (mv-nth
          '0
          (abs-alloc
           (frame-val->dir$inline
            (cdr (assoc-equal '0
                              (partial-collapse frame (dirname path)))))
           (nthcdr '0 (dirname path))
           (find-new-index
            (strip-cars (partial-collapse frame (dirname path)))))))))))
    :hints (("goal" :do-not-induct t
             :in-theory (e/d (abs-mkdir-correctness-lemma-30
                              frame-reps-fs abs-mkdir frame->root)
                             ()))))

  (defthm
    abs-mkdir-correctness-lemma-44
    (implies
     (frame-p frame)
     (frame-p (partial-collapse frame (dirname path))))
    :hints (("goal" :do-not-induct t)))

  (defthm
    abs-mkdir-correctness-lemma-81
    (abs-fs-p
     (ctx-app
      (mv-nth
       1
       (abs-alloc
        (frame-val->dir
         (cdr
          (assoc-equal (abs-find-file-src
                        (partial-collapse frame (dirname path))
                        (dirname path))
                       (partial-collapse frame (dirname path)))))
        (nthcdr
         (len
          (frame-val->path
           (cdr (assoc-equal
                 (abs-find-file-src
                  (partial-collapse frame (dirname path))
                  (dirname path))
                 frame))))
         (dirname path))
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr
          (assoc-equal (abs-find-file-src
                        (partial-collapse frame (dirname path))
                        (dirname path))
                       (partial-collapse frame (dirname path)))))
        (nthcdr
         (len
          (frame-val->path
           (cdr (assoc-equal
                 (abs-find-file-src
                  (partial-collapse frame (dirname path))
                  (dirname path))
                 frame))))
         (dirname path))
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))
      (find-new-index
       (strip-cars (partial-collapse frame (dirname path))))
      (nthcdr
       (len
        (frame-val->path
         (cdr
          (assoc-equal (abs-find-file-src
                        (partial-collapse frame (dirname path))
                        (dirname path))
                       frame))))
       (dirname path)))))

  (defthm
    abs-mkdir-correctness-lemma-84
    (abs-fs-p
     (mv-nth
      0
      (abs-place-file-helper
       (mv-nth
        0
        (abs-alloc
         (frame-val->dir
          (cdr
           (assoc-equal (abs-find-file-src
                         (partial-collapse frame (dirname path))
                         (dirname path))
                        (partial-collapse frame (dirname path)))))
         (nthcdr
          (len
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src
                   (partial-collapse frame (dirname path))
                   (dirname path))
                  frame))))
          (dirname path))
         (find-new-index
          (strip-cars (partial-collapse frame (dirname path))))))
       (list (basename path)) file))) :hints (("Goal" :do-not-induct t)))

  (defthm
    abs-mkdir-correctness-lemma-91
    (implies
     (and
      (consp (assoc-equal 0 frame)))
     (consp
      (assoc-equal
       (abs-find-file-src (partial-collapse frame (dirname path))
                          (dirname path))
       (partial-collapse frame (dirname path)))))
    :hints (("goal" :do-not-induct t)))

  (defthm
    abs-mkdir-correctness-lemma-95
    (implies
     (and
      (no-duplicatesp-equal (strip-cars frame)))
     (no-duplicatesp-equal
      (strip-cars (partial-collapse frame (dirname path)))))
    :hints (("goal" :do-not-induct t)))

  (defthm
    abs-mkdir-correctness-lemma-100
    (implies
     (and
      (not
       (member-equal
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))
        (abs-addrs
         (frame-val->dir
          (cdr
           (assoc-equal
            (abs-find-file-src (partial-collapse frame (dirname path))
                               (dirname path))
            (partial-collapse frame (dirname path)))))))))
     (not
      (member-equal
       (fat32-filename-fix (car (list (basename path))))
       (names-at
        (mv-nth
         1
         (abs-alloc
          (frame-val->dir
           (cdr
            (assoc-equal (abs-find-file-src
                          (partial-collapse frame (dirname path))
                          (dirname path))
                         (partial-collapse frame (dirname path)))))
          (nthcdr
           (len
            (frame-val->path
             (cdr (assoc-equal
                   (abs-find-file-src
                    (partial-collapse frame (dirname path))
                    (dirname path))
                   frame))))
           (dirname path))
          (find-new-index
           (strip-cars (partial-collapse frame (dirname path))))))
        (nthcdr
         (len
          (frame-val->path
           (cdr
            (assoc-equal (abs-find-file-src
                          (partial-collapse frame (dirname path))
                          (dirname path))
                         frame))))
         (dirname path))))))
    :hints (("goal" :do-not-induct t)))

  (defthm
    abs-mkdir-correctness-lemma-103
    (implies
     (not (equal (abs-find-file-src (partial-collapse frame (dirname path))
                                    (dirname path))
                 0))
     (consp
      (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                      (dirname path))
                   (frame->frame (partial-collapse frame (dirname path))))))
    :hints (("goal" :do-not-induct t))
    :rule-classes :type-prescription)

  (defthm
    abs-mkdir-correctness-lemma-104
    (implies
     (and
      (fat32-filename-list-equiv (append (dirname path)
                                         (list (basename path)))
                                 path)
      (no-duplicatesp-equal (strip-cars frame))
      (frame-p frame)
      (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
      (hifat-equiv (mv-nth 0 (collapse frame))
                   fs)
      (m1-file-alist-p fs)
      (mv-nth 1 (collapse frame))
      (abs-separate frame)
      (subsetp-equal (abs-addrs (frame->root frame))
                     (frame-addrs-root (frame->frame frame)))
      (prefixp
       (frame-val->path
        (cdr
         (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                         (dirname path))
                      frame)))
       (dirname path))
      (equal (mv-nth 1 (hifat-find-file fs (dirname path)))
             0)
      (m1-directory-file-p (mv-nth 0 (hifat-find-file fs (dirname path))))
      (not
       (consp
        (assoc-equal
         (basename path)
         (m1-file->contents (mv-nth 0
                                    (hifat-find-file fs (dirname path)))))))
      (consp path))
     (absfat-equiv
      (mv-nth
       0
       (hifat-place-file
        (mv-nth 0 (collapse frame))
        (append
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                (frame->frame frame))))
         (nthcdr
          (len
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  frame))))
          (dirname path))
         (list (basename path)))
        '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
               0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
          (contents))))
      (mv-nth
       0
       (hifat-place-file
        (mv-nth 0 (collapse frame))
        (dirname path)
        (m1-file
         (m1-file->d-e (mv-nth 0
                               (hifat-find-file (mv-nth 0 (collapse frame))
                                                (dirname path))))
         (put-assoc-equal
          (basename path)
          '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
            (contents))
          (m1-file->contents
           (mv-nth 0
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path))))))))))
    :rule-classes
    (:rewrite
     (:rewrite
      :corollary
      (implies
       (and
        (fat32-filename-list-equiv (append (dirname path)
                                           (list (basename path)))
                                   path)
        (no-duplicatesp-equal (strip-cars frame))
        (frame-p frame)
        (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
        (hifat-equiv (mv-nth 0 (collapse frame))
                     fs)
        (m1-file-alist-p fs)
        (mv-nth 1 (collapse frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (prefixp
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame)))
         (dirname path))
        (equal (mv-nth 1 (hifat-find-file fs (dirname path)))
               0)
        (m1-directory-file-p (mv-nth 0 (hifat-find-file fs (dirname path))))
        (not
         (consp
          (assoc-equal
           (basename path)
           (m1-file->contents (mv-nth 0
                                      (hifat-find-file fs (dirname path)))))))
        (consp path))
       (hifat-equiv
        (mv-nth
         0
         (hifat-place-file
          (mv-nth 0 (collapse frame))
          (append
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame))))
           (nthcdr
            (len
             (frame-val->path
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
            (dirname path))
           (list (basename path)))
          '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
            (contents))))
        (mv-nth
         0
         (hifat-place-file
          (mv-nth 0 (collapse frame))
          (dirname path)
          (m1-file
           (m1-file->d-e (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
           (put-assoc-equal
            (basename path)
            '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
              (contents))
            (m1-file->contents
             (mv-nth 0
                     (hifat-find-file (mv-nth 0 (collapse frame))
                                      (dirname path))))))))))))
    :instructions
    (:promote
     (:dive 1 2 2 1)
     (:=
      (frame-val->path
       (cdr
        (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                        (dirname path))
                     (frame->frame frame))))
      (take
       (len
        (frame-val->path$inline
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame))))
       (dirname path))
      :hints :none)
     (:change-goal nil t)
     (:dive 2)
     (:rewrite take-when-prefixp)
     :top
     (:bash ("goal" :in-theory (enable assoc-of-frame->frame)))
     :up
     (:=
      (append
       (append
        (take
         (len
          (frame-val->path
           (cdr (assoc-equal
                 (abs-find-file-src (partial-collapse frame (dirname path))
                                    (dirname path))
                 frame))))
         (dirname path))
        (nthcdr
         (len
          (frame-val->path
           (cdr (assoc-equal
                 (abs-find-file-src (partial-collapse frame (dirname path))
                                    (dirname path))
                 frame))))
         (dirname path)))
       (list (basename path))))
     (:dive 1)
     (:claim
      (and
       (<=
        (len
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (len (dirname path)))))
     (:rewrite binary-append-take-nthcdr)
     :top :bash
     (:bash
      ("goal"
       :expand
       (:with (:rewrite abs-pwrite-correctness-lemma-1)
              (hifat-place-file fs path
                                '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                                       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                  (contents))))))
     (:dive 2)
     (:rewrite
      hifat-place-file-when-hifat-equiv-1
      ((file2
        (m1-file
         (m1-file->d-e (mv-nth 0 (hifat-find-file fs (dirname path))))
         (put-assoc-equal
          (basename path)
          '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
            (contents))
          (m1-file->contents (mv-nth 0
                                     (hifat-find-file fs (dirname path)))))))))
     :top :bash (:change-goal nil t)
     :bash :bash :bash (:dive 1)
     (:rewrite hifat-equiv-of-put-assoc-2
               ((fs2 (m1-file->contents$inline
                      (mv-nth '0
                              (hifat-find-file fs (dirname path)))))))
     :top :bash
     :bash :bash
     :bash :bash
     :bash :bash
     :bash :bash))

  (defthm
    abs-mkdir-correctness-lemma-106
    (implies
     (consp (assoc-equal 0 frame))
     (consp (assoc-equal 0
                         (partial-collapse frame (dirname path)))))
    :hints (("goal" :do-not-induct t)))

  (defthm
    abs-mkdir-correctness-lemma-107
    (implies (and (mv-nth 1 (collapse frame))
                  (absfat-equiv (mv-nth 0 (collapse frame))
                                fs)
                  (frame-p frame)
                  (abs-separate frame)
                  (subsetp-equal (abs-addrs (frame->root frame))
                                 (frame-addrs-root (frame->frame frame)))
                  (no-duplicatesp-equal (strip-cars frame))
                  (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
                  (abs-fs-p fs))
             (hifat-equiv (mv-nth 0 (collapse frame))
                          fs))
    :hints
    (("goal"
      :do-not-induct t
      :in-theory (e/d (frame-reps-fs abs-mkdir)
                      (collapse collapse-this
                                (:rewrite hifat-equiv-when-absfat-equiv)))
      :use (:instance (:rewrite hifat-equiv-when-absfat-equiv)
                      (abs-file-alist2 fs)
                      (abs-file-alist1 (mv-nth 0 (collapse frame))))))
    :rule-classes (:rewrite :forward-chaining))

  (defthm
    abs-mkdir-correctness-lemma-109
    (implies
     (and
      (equal
       (abs-find-file-helper
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (nthcdr 0 (dirname path)))
       (abs-find-file (partial-collapse frame (dirname path))
                      (dirname path)))
      (equal (frame-val->src (cdr (assoc-equal 0 frame)))
             0)
      (frame-reps-fs frame fs)
      (abs-fs-p fs)
      (m1-file-alist-p fs)
      (consp (assoc-equal 0 frame))
      (abs-complete
       (abs-file->contents
        (mv-nth 0
                (abs-find-file (partial-collapse frame (dirname path))
                               (dirname path)))))
      (equal (mv-nth 1
                     (hifat-find-file (mv-nth 0 (collapse frame))
                                      (dirname path)))
             0)
      (m1-directory-file-p (mv-nth 0
                                   (hifat-find-file (mv-nth 0 (collapse frame))
                                                    (dirname path)))))
     (ctx-app-ok
      (mv-nth
       1
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (nthcdr (len (frame-val->path (cdr (assoc-equal 0 frame))))
                (dirname path))
        (find-new-index (strip-cars (partial-collapse frame (dirname path))))))
      (find-new-index (strip-cars (partial-collapse frame (dirname path))))
      (nthcdr (len (frame-val->path (cdr (assoc-equal 0 frame))))
              (dirname path))))
    :hints (("goal" :do-not-induct t
             :in-theory (e/d (abs-mkdir frame-reps-fs)
                             ()))))

  (defthm abs-mkdir-correctness-lemma-3
    (abs-fs-p
     (ctx-app
      (mv-nth
       1
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (nthcdr (len (frame-val->path (cdr (assoc-equal 0 frame))))
                (dirname path))
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (nthcdr (len (frame-val->path (cdr (assoc-equal 0 frame))))
                (dirname path))
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))
      (find-new-index (strip-cars (partial-collapse frame (dirname path))))
      (nthcdr (len (frame-val->path (cdr (assoc-equal 0 frame))))
              (dirname path)))))

  (defthm
    abs-mkdir-correctness-lemma-31
    (implies
     (not (consp (dirname path)))
     (ctx-app-ok
      (mv-nth
       1
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (nthcdr (len (frame-val->path (cdr (assoc-equal 0 frame))))
                (dirname path))
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))
      (find-new-index (strip-cars (partial-collapse frame (dirname path))))
      (nthcdr (len (frame-val->path (cdr (assoc-equal 0 frame))))
              (dirname path)))))

  (defthm
    abs-mkdir-correctness-lemma-21
    (implies
     (and
      (mv-nth 1 (collapse frame))
      (absfat-equiv (mv-nth 0 (collapse frame))
                    fs)
      (frame-p frame)
      (abs-separate frame)
      (subsetp-equal (abs-addrs (frame-val->dir (cdr (assoc-equal 0 frame))))
                     (frame-addrs-root (frame->frame frame)))
      (no-duplicatesp-equal (strip-cars frame))
      (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
      (abs-fs-p fs))
     (hifat-equiv
      (put-assoc-equal (basename path)
                       '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                         (contents))
                       (mv-nth 0 (collapse frame)))
      (put-assoc-equal (basename path)
                       '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                         (contents))
                       fs)))
    :hints
    (("goal" :in-theory (e/d (frame->root)
                             ((:rewrite hifat-equiv-when-absfat-equiv)))
      :use (:instance (:rewrite hifat-equiv-when-absfat-equiv)
                      (abs-file-alist2 fs)
                      (abs-file-alist1 (mv-nth 0 (collapse frame)))))))

  (defthm
    abs-mkdir-correctness-lemma-96
    (implies
     (and
      (frame-p frame)
      (no-duplicatesp-equal (strip-cars frame))
      (abs-separate frame)
      (mv-nth '1 (collapse frame))
      (not (consp (frame-val->path$inline (cdr (assoc-equal '0 frame)))))
      (subsetp-equal (abs-addrs (frame->root frame))
                     (frame-addrs-root (frame->frame frame)))
      (m1-directory-file-p (mv-nth '0
                                   (hifat-find-file (mv-nth '0 (collapse frame))
                                                    path)))
      (fat32-filename-p name))
     (equal
      (consp
       (assoc-equal
        name
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file (mv-nth '0
                                   (collapse (partial-collapse frame path)))
                           path)))))
      (consp
       (assoc-equal name
                    (m1-file->contents
                     (mv-nth 0
                             (hifat-find-file (mv-nth '0 (collapse frame))
                                              path)))))))
    :hints
    (("goal"
      :in-theory (e/d (hifat-file-alist-fix-when-hifat-no-dups-p)
                      (consp-of-assoc-when-hifat-equiv))
      :expand
      ((:with
        hifat-file-alist-fix-when-hifat-no-dups-p
        (hifat-file-alist-fix
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file (mv-nth 0
                                    (collapse (partial-collapse frame path)))
                            path)))))
       (:with
        m1-file-alist-p-of-m1-file->contents
        (m1-file-alist-p
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file (mv-nth 0
                                    (collapse (partial-collapse frame path)))
                            path))))))
      :use
      ((:instance
        consp-of-assoc-when-hifat-equiv
        (x
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file (mv-nth '0
                                    (collapse (partial-collapse frame path)))
                            path))))
        (y
         (m1-file->contents (mv-nth 0
                                    (hifat-find-file (mv-nth '0 (collapse frame))
                                                     path))))))
      :do-not-induct t)))

  (defthm abs-mkdir-correctness-lemma-110
    (implies (and (consp x)
                  (equal (mv-nth 1 (hifat-find-file fs y))
                         0)
                  (fat32-filename-list-prefixp x y))
             (equal (mv-nth 1 (hifat-find-file fs x))
                    0))
    :hints (("goal" :in-theory (enable fat32-filename-list-prefixp
                                       hifat-find-file)
             :induct (mv (fat32-filename-list-prefixp x y)
                         (hifat-find-file fs x)))))

  (defthm
    abs-mkdir-correctness-lemma-50
    (implies
     (and
      (equal
       (collapse
        (frame-with-root
         (frame->root (partial-collapse frame (dirname path)))
         (put-assoc-equal
          (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path))
          (frame-val
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame))))
           (mv-nth
            0
            (abs-place-file-helper
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                (frame->frame (partial-collapse frame (dirname path))))))
             (append
              (nthcdr
               (len
                (frame-val->path
                 (cdr
                  (assoc-equal
                   (abs-find-file-src (partial-collapse frame (dirname path))
                                      (dirname path))
                   frame))))
               (dirname path))
              (list (basename path)))
             '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
               (contents))))
           (frame-val->src
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame)))))
          (frame->frame (partial-collapse frame (dirname path))))))
       (cons
        (mv-nth
         0
         (hifat-place-file
          (mv-nth 0
                  (collapse (partial-collapse frame (dirname path))))
          (append
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  (frame->frame frame))))
           (nthcdr
            (len
             (frame-val->path
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
            (dirname path))
           (list (basename path)))
          '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
            (contents))))
        '(t)))
      (fat32-filename-list-equiv (append (dirname path)
                                         (list (basename path)))
                                 path)
      (frame-p frame)
      (no-duplicatesp-equal (strip-cars frame))
      (equal (frame-val->src (cdr (assoc-equal 0 frame)))
             0)
      (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
      (mv-nth 1 (collapse frame))
      (absfat-equiv (mv-nth 0 (collapse frame))
                    fs)
      (abs-separate frame)
      (subsetp-equal (abs-addrs (frame->root frame))
                     (frame-addrs-root (frame->frame frame)))
      (abs-fs-p fs)
      (not (equal (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  0))
      (equal (mv-nth 1 (hifat-find-file fs (dirname path)))
             0)
      (m1-directory-file-p (mv-nth 0 (hifat-find-file fs (dirname path))))
      (not
       (consp
        (assoc-equal
         (basename path)
         (m1-file->contents (mv-nth 0
                                    (hifat-find-file fs (dirname path)))))))
      (consp path))
     (absfat-equiv
      (mv-nth
       0
       (collapse
        (frame-with-root
         (frame->root (partial-collapse frame (dirname path)))
         (put-assoc-equal
          (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path))
          (frame-val
           (frame-val->path
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  frame)))
           (mv-nth
            0
            (abs-place-file-helper
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                (partial-collapse frame (dirname path)))))
             (append
              (nthcdr
               (len
                (frame-val->path
                 (cdr
                  (assoc-equal
                   (abs-find-file-src (partial-collapse frame (dirname path))
                                      (dirname path))
                   frame))))
               (dirname path))
              (list (basename path)))
             '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
               (contents))))
           (frame-val->src
            (cdr (assoc-equal
                  (abs-find-file-src (partial-collapse frame (dirname path))
                                     (dirname path))
                  frame))))
          (frame->frame (partial-collapse frame (dirname path)))))))
      (mv-nth
       0
       (hifat-place-file fs path
                         '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                           (contents))))))
    :instructions
    (:promote
     (:dive 1 2 1 2 2 2 2 2)
     (:claim
      (<=
       (nfix
        (len
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame)))))
       (len (dirname path))))
     (:rewrite append-nthcdr-dirname-basename)
     :top (:claim (m1-file-alist-p fs))
     (:claim (hifat-equiv (mv-nth 0 (collapse frame))
                          fs))
     (:bash ("goal" :in-theory (enable assoc-of-frame->frame)))
     (:dive 1 2 2 2 2)
     (:= path (fat32-filename-list-fix path)
         :equiv fat32-filename-list-equiv$inline)
     :top (:dive 1 2 2)
     (:rewrite append-when-prefixp)
     (:= (fat32-filename-list-fix path)
         (append (dirname path)
                 (list (basename path)))
         :equiv fat32-filename-list-equiv$inline)
     :top (:dive 1 2)
     (:rewrite hifat-place-file-of-append-1)
     :top :bash (:dive 2 2 2)
     (:= path
         (append (dirname path)
                 (list (basename path)))
         :equiv fat32-filename-list-equiv$inline)
     :up
     (:rewrite hifat-place-file-of-append-1)
     :top :bash
     (:rewrite (:rewrite prefixp-transitive . 2)
               ((y (fat32-filename-list-fix (dirname path)))))
     :bash (:dive 1)
     (:=
      (frame-val->path
       (cdr
        (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                        (dirname path))
                     (partial-collapse frame (dirname path))))))
     :top
     (:claim
      (and
       (no-duplicatesp-equal
        (strip-cars (partial-collapse frame (dirname path))))
       (not
        (consp
         (frame-val->path
          (cdr (assoc-equal 0
                            (partial-collapse frame (dirname path)))))))))
     (:rewrite (:rewrite path-clear-partial-collapse-when-zp-src-lemma-9 . 1)))))

(defthm abs-mkdir-correctness-lemma-75
  (implies (and (zp (mv-nth 1 (hifat-find-file fs y)))
                (m1-directory-file-p (mv-nth 0 (hifat-find-file fs y)))
                (fat32-filename-list-prefixp x y))
           (m1-directory-file-p (mv-nth 0 (hifat-find-file fs x))))
  :hints (("goal" :in-theory (enable fat32-filename-list-prefixp
                                     hifat-find-file)
           :induct (mv (fat32-filename-list-prefixp x y)
                       (hifat-find-file fs x)))))

(defthm
  abs-find-file-after-abs-mkdir-lemma-15
  (implies
   (and (fat32-filename-p name)
        (abs-fs-p fs))
   (equal
    (abs-find-file-helper (put-assoc-equal name file fs)
                          (cons name nil))
    (if
        (abs-directory-file-p (abs-file-fix file))
        (mv (abs-file (abs-file->d-e file)
                      (abs-fs-fix (abs-file->contents file)))
            0)
      (mv (abs-file-fix file) 0))))
  :hints (("goal" :in-theory (enable abs-mkdir partial-collapse
                                     1st-complete-under-path abs-find-file
                                     abs-find-file-src abs-find-file-helper
                                     assoc-equal-of-frame-with-root)
           :do-not-induct t)))

(defthm
  abs-find-file-after-abs-mkdir-lemma-17
  (implies
   (and (fat32-filename-p name) (natp n2))
   (equal
    (abs-find-file-helper
     (mv-nth
      1
      (abs-alloc (put-assoc-equal name file
                                     (mv-nth 0 (abs-alloc fs nil n1)))
                    (cons name nil)
                    n2))
     (cons name nil))
    (if (not (abs-directory-file-p (abs-file-fix file)))
        (mv (abs-file-fix file) 0)
      (mv (abs-file (abs-file->d-e file)
                    (list n2))
          0))))
  :hints (("goal" :in-theory (enable abs-mkdir partial-collapse
                                     abs-alloc abs-find-file-helper
                                     1st-complete-under-path
                                     abs-find-file abs-find-file-src
                                     assoc-equal-of-frame-with-root
                                     put-assoc-equal-of-frame-with-root
                                     abs-directory-file-p abs-file-alist-p
                                     abs-fs-fix)
           :do-not-induct t)))

(defthm
  abs-find-file-after-abs-mkdir-lemma-18
  (implies
   (and (abs-fs-p fs)
        (natp n)
        (fat32-filename-p name))
   (equal
    (abs-find-file-helper (mv-nth 1
                                  (abs-alloc (put-assoc-equal name file fs)
                                                (cons name nil)
                                                n))
                          (cons name nil))
    (if (not (abs-directory-file-p (abs-file-fix file)))
        (mv (abs-file-fix file) 0)
        (mv (abs-file (abs-file->d-e file)
                      (list n))
            0))))
  :hints (("goal" :in-theory (enable abs-fs-fix
                                     abs-mkdir abs-file-contents-fix
                                     abs-alloc abs-find-file-helper
                                     assoc-equal-of-frame-with-root
                                     put-assoc-equal-of-frame-with-root)
           :do-not-induct t))
  :otf-flg t)

(encapsulate
  ()

  (local
   (defthm
     lemma
     (implies
      (and
       (prefixp (frame-val->path (cdr (assoc-equal (abs-find-file-src frame path)
                                                   (frame->frame frame))))
                (fat32-filename-list-fix path))
       (no-duplicatesp-equal (strip-cars frame))
       (mv-nth 1 (collapse frame))
       (frame-p frame)
       (dist-names (frame->root frame)
                   nil (frame->frame frame))
       (abs-separate (frame->frame frame))
       (not (equal (mv-nth 1
                           (abs-find-file-helper (frame->root frame)
                                                 path))
                   2)))
      (equal (abs-find-file-src frame path)
             0))
     :instructions
     ((:casesplit
       (not
        (equal
         (abs-find-file-helper
          (frame-val->dir (cdr (assoc-equal (abs-find-file-src frame path)
                                            (frame->frame frame))))
          (nthcdr
           (len (frame-val->path (cdr (assoc-equal (abs-find-file-src frame path)
                                                   (frame->frame frame)))))
           path))
         (abs-find-file (frame->frame frame)
                        path))))
      :bash :promote (:contrapose 1)
      (:claim
       (not
        (equal
         (mv-nth
          1
          (abs-find-file-helper
           (frame-val->dir (cdr (assoc-equal (abs-find-file-src frame path)
                                             frame)))
           (nthcdr
            (len
             (frame-val->path (cdr (assoc-equal (abs-find-file-src frame path)
                                                frame))))
            path)))
         *enoent*))
       :hints :none)
      (:change-goal nil t)
      (:dive 1)
      (:rewrite path-clear-partial-collapse-when-not-zp-src-lemma-3)
      (:bash
       ("goal" :in-theory (enable (:rewrite assoc-of-frame->frame)))))))

  (defthm
    abs-find-file-after-abs-mkdir-lemma-21
    (implies (and (no-duplicatesp-equal (strip-cars frame))
                  (mv-nth 1 (collapse frame))
                  (frame-p frame)
                  (dist-names (frame->root frame)
                              nil (frame->frame frame))
                  (abs-separate (frame->frame frame))
                  (not (equal (mv-nth 1
                                      (abs-find-file-helper (frame->root frame)
                                                            path))
                              2)))
             (equal (abs-find-file-src frame path)
                    0))
    :instructions
    (:promote
     (:dive 1)
     (:claim
      (prefixp (frame-val->path (cdr (assoc-equal (abs-find-file-src frame path)
                                                  (frame->frame frame))))
               (fat32-filename-list-fix path))
      :hints :none)
     (:rewrite lemma)
     (:dive 1 1 1)
     (:rewrite assoc-of-frame->frame)
     :top :bash)))

(defthm
  abs-find-file-after-abs-mkdir-lemma-23
  (implies
   (not
    (equal (mv-nth 1
                   (abs-find-file-helper
                    (frame->root (partial-collapse frame (cons name nil)))
                    (cons name path)))
           *enoent*))
   (not
    (equal (mv-nth '1
                   (abs-find-file-helper
                    (frame->root (partial-collapse frame (cons name nil)))
                    (cons name nil)))
           *enoent*)))
  :hints (("goal" :do-not-induct t
           :in-theory (enable abs-find-file-helper)))
  :rule-classes :forward-chaining)

(defthm abs-find-file-after-abs-mkdir-lemma-5
  (implies (and (frame-p frame)
                (atom (assoc-equal 0 frame))
                (equal (1st-complete-under-path frame path1)
                       0)
                (prefixp path1 path2))
           (equal (1st-complete-under-path frame path2)
                  0))
  :hints (("goal" :in-theory (enable 1st-complete-under-path))))

(defthmd
  abs-find-file-after-abs-mkdir-lemma-6
  (implies
   (and (zp (abs-find-file-src frame (list basename)))
        (fat32-filename-p basename)
        (not (consp (frame-val->path (cdr (assoc-equal 0 frame)))))
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (zp (mv-nth 1
                    (abs-find-file frame (list basename)))))
   (and
    (consp (assoc-equal basename (frame->root frame)))
    (equal (cdr (assoc-equal basename (frame->root frame)))
           (mv-nth 0
                   (abs-find-file frame (list basename))))
    (consp (assoc-equal basename
                        (frame-val->dir (cdr (assoc-equal 0 frame)))))
    (equal (cdr (assoc-equal basename
                             (frame-val->dir (cdr (assoc-equal 0 frame)))))
           (mv-nth 0
                   (abs-find-file frame (list basename))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d
     (basename abs-find-file-helper frame->root)
     (abs-mkdir-correctness-lemma-85))
    :use
    (:instance
     abs-mkdir-correctness-lemma-85
     (path (list basename))
     (x-path
      (nthcdr
       (len (frame-val->path
             (cdr (assoc-equal (abs-find-file-src frame (list basename))
                               frame))))
       (list basename)))))))

;; This theorem shows that abs-find-file, without the benefit of
;; partial-collapse, can't really get the contents of a directory.
(DEFTHM
  ABS-FIND-FILE-AFTER-ABS-MKDIR-2
  (IMPLIES
   (AND
    (FRAME-P FRAME)
    (NO-DUPLICATESP-EQUAL (STRIP-CARS FRAME))
    (ABS-SEPARATE FRAME)
    (MV-NTH '1 (COLLAPSE FRAME))
    (SUBSETP-EQUAL (ABS-ADDRS (FRAME->ROOT FRAME))
                   (FRAME-ADDRS-ROOT (FRAME->FRAME FRAME)))
    (CONSP (ASSOC-EQUAL 0 FRAME))
    (EQUAL (FRAME-VAL->PATH$INLINE (CDR (ASSOC-EQUAL 0 FRAME)))
           NIL)
    (EQUAL (FRAME-VAL->SRC$INLINE (CDR (ASSOC-EQUAL 0 FRAME)))
           0)
    (EQUAL
     (1ST-COMPLETE-UNDER-PATH
      (FRAME->FRAME
       (PUT-ASSOC-EQUAL
        (ABS-FIND-FILE-SRC
         (PARTIAL-COLLAPSE FRAME '("TMP        "))
         '("TMP        "))
        (FRAME-VAL
         (FRAME-VAL->PATH$INLINE
          (CDR
           (ASSOC-EQUAL
            (ABS-FIND-FILE-SRC
             (PARTIAL-COLLAPSE FRAME '("TMP        "))
             '("TMP        "))
            FRAME)))
         (MV-NTH
          1
          (ABS-ALLOC
           (FRAME-VAL->DIR$INLINE
            (CDR
             (ASSOC-EQUAL
              (ABS-FIND-FILE-SRC
               (PARTIAL-COLLAPSE FRAME '("TMP        "))
               '("TMP        "))
              (PARTIAL-COLLAPSE FRAME '("TMP        ")))))
           (NTHCDR
            (LEN
             (FRAME-VAL->PATH$INLINE
              (CDR
               (ASSOC-EQUAL
                (ABS-FIND-FILE-SRC
                 (PARTIAL-COLLAPSE FRAME '("TMP        "))
                 '("TMP        "))
                FRAME))))
            '("TMP        "))
           (FIND-NEW-INDEX
            (STRIP-CARS
             (PARTIAL-COLLAPSE FRAME '("TMP        "))))))
         (FRAME-VAL->SRC$INLINE
          (CDR
           (ASSOC-EQUAL
            (ABS-FIND-FILE-SRC
             (PARTIAL-COLLAPSE FRAME '("TMP        "))
             '("TMP        "))
            FRAME))))
        (PARTIAL-COLLAPSE FRAME '("TMP        "))))
      '("TMP        " "DOCS       "))
     0))
   (B*
       (((MV FRAME & MKDIR-ERROR-CODE)
         (ABS-MKDIR FRAME
                    (PATH-TO-FAT32-PATH (EXPLODE "/tmp/docs")))))
     (IMPLIES
      (EQUAL MKDIR-ERROR-CODE 0)
      (B*
          (((MV FRAME & &)
            (ABS-MKDIR
             FRAME
             (PATH-TO-FAT32-PATH (EXPLODE "/tmp/docs/pdf-docs"))))
           ((MV & ERROR-CODE)
            (ABS-FIND-FILE
             FRAME
             (PATH-TO-FAT32-PATH (EXPLODE "/tmp/docs")))))
        (AND (EQUAL ERROR-CODE 0))))))
  :HINTS
  (("goal"
    :IN-THEORY
    (E/D
     (ABS-MKDIR PARTIAL-COLLAPSE 1ST-COMPLETE-UNDER-PATH
                ABS-FIND-FILE ABS-FIND-FILE-SRC
                ASSOC-EQUAL-OF-FRAME-WITH-ROOT
                PUT-ASSOC-EQUAL-OF-FRAME-WITH-ROOT
                ABS-FIND-FILE-AFTER-ABS-MKDIR-LEMMA-6)
     ((:REWRITE FRAME-P-OF-CDR-WHEN-FRAME-P)
      (:REWRITE COLLAPSE-HIFAT-PLACE-FILE-LEMMA-6)
      (:DEFINITION FAT32-FILENAME-LIST-PREFIXP)
      (:REWRITE LEN-WHEN-PREFIXP)
      (:REWRITE CAR-OF-NTHCDR)
      ABS-SEPARATE-OF-FRAME->FRAME-OF-COLLAPSE-THIS-LEMMA-8))
    :DO-NOT-INDUCT T
    :EXPAND
    (ABS-DIRECTORY-FILE-P
     (ABS-FILE
      (ABS-FILE->D-E
       (CDR
        (ASSOC-EQUAL
         "TMP        "
         (FRAME-VAL->DIR
          (CDR
           (ASSOC-EQUAL
            0
            (PARTIAL-COLLAPSE FRAME '("TMP        "))))))))
      (LIST
       (FIND-NEW-INDEX
        (STRIP-CARS
         (PARTIAL-COLLAPSE FRAME '("TMP        "))))))))
   ("Subgoal 2.1"
    :IN-THEORY (ENABLE ABS-FIND-FILE-HELPER
                       ABS-ALLOC ABS-FILE-ALIST-P
                       ABS-FIND-FILE-AFTER-ABS-MKDIR-LEMMA-6)))
  :OTF-FLG T)

(defthm
  abs-lstat-after-abs-mkdir-1
  (implies (good-frame-p frame)
           (b* (((mv frame & mkdir-error-code)
                 (abs-mkdir frame path)))
             (implies (equal mkdir-error-code 0)
                      (b* (((mv & lstat-error-code &)
                            (abs-lstat frame path)))
                        (equal lstat-error-code 0)))))
  :hints
  (("goal"
    :in-theory (enable abs-mkdir abs-lstat abs-alloc abs-fs-fix
                       abs-find-file-helper abs-find-file good-frame-p))))

(defthm
  abs-lstat-after-abs-mkdir-2
  (implies (good-frame-p init-frame)
           (b* (((mv final-frame & mkdir-error-code)
                 (abs-mkdir init-frame path)))
             (implies (not (equal mkdir-error-code 0))
                      (collapse-equiv final-frame init-frame))))
  :hints
  (("goal"
    :in-theory (enable collapse-equiv abs-mkdir abs-lstat abs-alloc abs-fs-fix
                       abs-find-file-helper abs-find-file good-frame-p) :expand
                       (:free (root) (collapse (frame-with-root root nil))))))

(defund abs-mknod (frame path)
  (declare (xargs :guard (and (frame-p frame)
                              (consp (assoc-equal 0 frame))
                              (fat32-filename-list-p path)
                              (no-duplicatesp-equal (strip-cars frame)))
                  :guard-debug t
                  :guard-hints
                  (("goal"
                    :in-theory (enable abs-find-file-helper abs-fs-p)))))
  (b*
      ((path (mbe :exec path :logic (fat32-filename-list-fix path)))
       (dirname (dirname path)) (frame (partial-collapse frame dirname))
       ;; After partial-collapse, either the parent directory is there in one
       ;; variable, or it isn't there at all.
       ((mv parent-dir error-code) (abs-find-file frame dirname))
       ((unless (or (atom dirname) (and (zp error-code) (abs-directory-file-p parent-dir))))
        (mv frame -1 *enoent*))
       (src (abs-find-file-src frame dirname))
       (new-index (find-new-index
                   ;; Using this, not (strip-cars (frame->frame frame)), to make
                   ;; sure we don't get a zero.
                   (strip-cars frame)))
       ;; It's not even a matter of removing that thing - we need to leave a
       ;; body address in its place...
       ((mv var new-src-dir)
        (abs-alloc (frame-val->dir (cdr (assoc-equal src frame)))
                   (nthcdr (len (frame-val->path (cdr (assoc-equal src frame)))) dirname)
                   new-index))
       ;; Check somewhere that (basename path) is not already present...
       ((unless (consp path)) (mv frame -1 *enoent*))
       ((when (consp (abs-assoc (basename path) var))) (mv frame -1 *eexist*))
       (frame (put-assoc-equal src (change-frame-val (cdr (assoc-equal src frame))
                                                     :dir new-src-dir)
                               frame))
       (new-var (abs-put-assoc (basename path)
                               (make-abs-file :contents ""
                                              :d-e (d-e-set-filename (d-e-fix nil)
                                                                             (basename path)))
                               var))
       (frame
        (frame-with-root (frame->root frame)
                         (cons (cons new-index
                                     (frame-val dirname
                                                new-var src))
                               (frame->frame frame)))))
    (mv frame 0 0)))

(defund abs-pwrite (fd buf offset frame fd-table file-table)
  (declare (xargs :guard (and (frame-p frame) (fd-table-p fd-table) (file-table-p file-table)
                              (natp fd) (stringp buf) (natp offset) (consp (assoc-equal 0 frame)))
                  :guard-hints
                  (("goal"
                    :do-not-induct t
                    :in-theory (e/d (len-of-insert-text abs-no-dups-file-p abs-no-dups-p)
                                    (unsigned-byte-p))
                    :expand (:with m1-file-contents-fix-when-m1-file-contents-p
                                   (:free (oldtext)
                                          (m1-file-contents-fix
                                           (implode (insert-text oldtext offset buf)))))))))
  (b*
      ((fd-table-entry (assoc-equal fd fd-table))
       ((unless (consp fd-table-entry)) (mv frame -1 *ebadf*))
       (file-table-entry (assoc-equal (cdr fd-table-entry) file-table))
       ((unless (consp file-table-entry)) (mv frame -1 *ebadf*))
       ((unless (unsigned-byte-p 32 (+ offset (length buf)))) (mv frame -1 *enospc*))
       (path (file-table-element->fid (cdr file-table-entry)))
       ((unless (consp path)) (mv frame -1 *enoent*))
       (dirname (dirname path))
       (frame (partial-collapse frame dirname))
       ;; After partial-collapse, either the parent directory is there in one
       ;; variable, or it isn't there at all.
       ((mv parent-dir error-code) (abs-find-file frame dirname))
       ((when (and (consp dirname) (not (zp error-code))
                   (not (equal error-code *enoent*))))
        (mv frame -1 *enotdir*))
       ((when (and (consp dirname) (not (zp error-code))))
        (mv frame -1 *enoent*))
       ((when (and (consp dirname) (m1-regular-file-p parent-dir)))
        (mv frame -1 *enotdir*))
       (src (abs-find-file-src frame dirname))
       (new-index (find-new-index (strip-cars frame)))
       ((mv var new-src-dir)
        (abs-alloc (frame-val->dir (cdr (assoc-equal src frame)))
                   (nthcdr (len (frame-val->path (cdr (assoc-equal src frame)))) dirname)
                   new-index))
       ((mv file error-code) (if (consp (abs-assoc (basename path) var))
                                 (mv (cdr (abs-assoc (basename path) var)) 0)
                               (mv (make-abs-file) *enoent*)))
       ((mv oldtext d-e) (if (and (equal error-code 0) (m1-regular-file-p file))
                                 (mv (coerce (m1-file->contents file) 'list)
                                     (m1-file->d-e file))
                               (mv nil (d-e-fix nil))))
       ((when (and (consp (abs-assoc (basename path) var)) (m1-directory-file-p file)))
        (mv frame -1 *enoent*))
       (frame (put-assoc-equal src (change-frame-val (cdr (assoc-equal src frame))
                                                     :dir new-src-dir)
                               frame))
       (file (make-m1-file :d-e d-e
                           :contents (coerce (insert-text oldtext offset buf) 'string)))
       (new-var (abs-put-assoc (basename path) file var))
       (frame (frame-with-root (frame->root frame)
                               (cons (cons new-index (frame-val dirname new-var src))
                                     (frame->frame frame)))))
    (mv frame 0 0)))

;; This is not the most ideal form of this theorem... let's see where we can go.
(defthm
  abs-mkdir-correctness-lemma-77
  (implies
   (and (abs-separate frame)
        (atom (frame-val->path (cdr (assoc-equal 0 frame))))
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars (frame->frame frame))))
   (subsetp-equal
    (abs-addrs
     (frame-val->dir
      (cdr (assoc-equal x
                        (frame->frame (partial-collapse frame path))))))
    (abs-addrs (frame-val->dir (cdr (assoc-equal x (frame->frame frame)))))))
  :hints
  (("goal"
    :in-theory (enable partial-collapse))))

(defthmd
  abs-mkdir-correctness-lemma-80
  (implies
   (and
    (abs-separate frame)
    (atom (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars (frame->frame frame)))
    (equal
     (mv-nth 1
             (abs-find-file-helper
              (frame-val->dir (cdr (assoc-equal x (frame->frame frame))))
              path2))
     0)
    (consp (assoc-equal x
                        (frame->frame (partial-collapse frame path1)))))
   (equal
    (mv-nth
     1
     (abs-find-file-helper
      (frame-val->dir
       (cdr (assoc-equal x
                         (frame->frame (partial-collapse frame path1)))))
      path2))
    0))
  :hints
  (("goal" :in-theory (e/d (partial-collapse abs-find-file-helper assoc-equal)
                           (abs-find-file-helper-when-m1-file-alist-p))
    :induct (partial-collapse frame path1))))

;; This inductive lemma is at the very top of a list of useless runes.
(defthmd
  abs-mkdir-correctness-lemma-86
  (implies
   (and
    (no-duplicatesp-equal (strip-cars (frame->frame frame)))
    (mv-nth 1 (collapse frame))
    (member-equal
     y
     (abs-addrs (frame-val->dir (cdr (assoc-equal x (frame->frame frame))))))
    (abs-separate (frame->frame frame))
    (frame-p (frame->frame frame)))
   (and
    (equal (frame-val->src (cdr (assoc-equal y (frame->frame frame))))
           x)
    (ctx-app-ok (frame-val->dir (cdr (assoc-equal x (frame->frame frame))))
                y
                (nthcdr
                 (len
                  (frame-val->path (cdr (assoc-equal x (frame->frame frame)))))
                 (frame-val->path (cdr (assoc-equal y (frame->frame frame))))))))
  :hints (("goal" :in-theory (enable collapse))))

;; Inductive, hence kept but disabled.
(defthmd abs-mkdir-correctness-lemma-87
  (implies (and (consp x)
                (consp (addrs-at fs y))
                (fat32-filename-list-prefixp x y))
           (equal (mv-nth 1 (abs-find-file-helper fs x))
                  0))
  :hints (("goal" :in-theory (enable abs-find-file-helper addrs-at))))

(defthm
  abs-mkdir-correctness-lemma-88
  (implies (and (frame-p frame)
                (no-duplicatesp-equal (strip-cars frame))
                (abs-separate frame)
                (mv-nth 1 (collapse frame))
                (atom (frame-val->path (cdr (assoc-equal 0 frame))))
                (subsetp-equal (abs-addrs (frame->root frame))
                               (frame-addrs-root (frame->frame frame)))
                (not (equal (abs-find-file-src (partial-collapse frame path)
                                               path)
                            0)))
           (equal (names-at (frame->root (partial-collapse frame path))
                            path)
                  nil))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d (assoc-of-frame->frame)
                    ((:rewrite path-clear-partial-collapse-when-zp-src-lemma-15)
                     (:rewrite abs-find-file-src-correctness-1)
                     (:rewrite path-clear-partial-collapse-when-zp-src-lemma-17)))
    :use ((:instance (:rewrite path-clear-partial-collapse-when-zp-src-lemma-15)
                     (path path)
                     (fs (frame->root (partial-collapse frame path))))
          (:instance abs-find-file-correctness-1-lemma-36
                     (x (abs-find-file-src (partial-collapse frame path)
                                           path)))
          (:instance (:rewrite abs-find-file-src-correctness-1)
                     (path path)
                     (frame (partial-collapse frame path)))
          (:instance (:rewrite path-clear-partial-collapse-when-zp-src-lemma-17)
                     (path path)
                     (frame frame)
                     (x (abs-find-file-src (partial-collapse frame path)
                                           path)))
          (:instance (:rewrite abs-find-file-src-correctness-2)
                     (frame (partial-collapse frame path)))))))

(defthm
  abs-mkdir-correctness-lemma-89
  (implies
   (and (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (mv-nth 1 (collapse frame))
        (atom (frame-val->path (cdr (assoc-equal 0 frame))))
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (prefixp (fat32-filename-list-fix path)
                 (fat32-filename-list-fix y))
        (equal (frame-val->src$inline (cdr (assoc-equal '0 frame)))
               '0))
   (path-clear
    y
    (remove-assoc-equal (abs-find-file-src (partial-collapse frame path)
                                           path)
                        (frame->frame (partial-collapse frame path)))))
  :hints (("goal" :in-theory (disable path-clear-partial-collapse-when-not-zp-src)
           :use path-clear-partial-collapse-when-not-zp-src
           :do-not-induct t)))

(defthm
  collapse-hifat-place-file-lemma-2
  (implies
   (and
    (prefixp
     (frame-val->path
      (cdr
       (assoc-equal
        (frame-val->src (cdr (assoc-equal (1st-complete (frame->frame frame))
                                          (frame->frame frame))))
        (frame->frame frame))))
     (frame-val->path (cdr (assoc-equal (1st-complete (frame->frame frame))
                                        (frame->frame frame)))))
    (dist-names root nil (frame->frame frame))
    (abs-separate (frame->frame frame))
    (frame-p (frame->frame frame))
    (no-duplicatesp-equal (strip-cars (frame->frame frame))))
   (dist-names
    root nil
    (frame->frame (collapse-this frame
                                 (1st-complete (frame->frame frame))))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable collapse-this))))

(defund abs-opendir (frame path dir-stream-table)
  (declare
   (xargs
    :guard (and (fat32-filename-list-p path)
                (frame-p frame)
                (consp (assoc-equal 0 frame))
                (dir-stream-table-p dir-stream-table))
    :guard-debug t
    :guard-hints
    (("Goal"
      :use
      (:theorem
       (implies
        (m1-directory-file-p (mv-nth 0
                                     (abs-find-file (partial-collapse frame path)
                                                    path)))
        (m1-file-alist-p
         (m1-file->contents (mv-nth 0
                                    (abs-find-file (partial-collapse frame path)
                                                   path))))))))))
  (b* ((dir-stream-table
        (mbe :exec dir-stream-table :logic (dir-stream-table-fix dir-stream-table)))
       (frame (partial-collapse frame path))
       ((mv file errno)
        (abs-find-file frame path))
       ((unless (equal errno 0))
        (mv 0 dir-stream-table *enoent* frame))
       ((unless (m1-directory-file-p file))
        (mv 0 dir-stream-table *enotdir* frame))
       (dir-stream-table-index
        (find-new-index (strip-cars dir-stream-table))))
    (mv
     dir-stream-table-index
     (cons
      (cons dir-stream-table-index
            (make-dir-stream
             :file-list
             (<<-sort
              (strip-cars (m1-file->contents file)))))
      dir-stream-table)
     0
     frame)))

(defthm
  abs-opendir-correctness-1
  (implies (good-frame-p frame)
           (collapse-equiv (mv-nth 3
                                   (abs-opendir frame path dir-stream-table))
                           frame))
  :hints (("goal" :do-not-induct t
           :in-theory (enable good-frame-p
                              abs-opendir collapse-equiv))))

(defthm
  abs-opendir-correctness-lemma-1
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  path))))
   (m1-directory-file-p
    (mv-nth '0
            (hifat-find-file (mv-nth '0
                                     (collapse (partial-collapse frame path)))
                             path))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable abs-opendir
                              hifat-opendir good-frame-p))))

(defthm
  abs-opendir-correctness-lemma-2
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  path))))
   (set-equiv
    (strip-cars
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file (mv-nth 0
                                (collapse (partial-collapse frame path)))
                        path))))
    (strip-cars
     (m1-file->contents (mv-nth 0
                                (hifat-find-file (mv-nth 0 (collapse frame))
                                                 path))))))
  :hints
  (("goal"
    :in-theory (disable hifat-equiv-implies-set-equiv-strip-cars-1)
    :do-not-induct t
    :use
    (:instance
     hifat-equiv-implies-set-equiv-strip-cars-1
     (fs1
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file (mv-nth 0
                                 (collapse (partial-collapse frame path)))
                         path))))
     (fs2
      (m1-file->contents (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  path))))))))

(defthm
  abs-opendir-correctness-lemma-3
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  path))))
   (equal
    (<<-sort
     (strip-cars
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file (mv-nth 0
                                 (collapse (partial-collapse frame path)))
                         path)))))
    (<<-sort
     (strip-cars
      (m1-file->contents (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  path)))))))
  :hints
  (("goal"
    :in-theory (disable common-<<-sort-for-perms)
    :do-not-induct t
    :use
    (:instance
     common-<<-sort-for-perms
     (x
      (strip-cars
       (m1-file->contents
        (mv-nth
         0
         (hifat-find-file (mv-nth 0
                                  (collapse (partial-collapse frame path)))
                          path)))))
     (y
      (strip-cars
       (m1-file->contents (mv-nth 0
                                  (hifat-find-file (mv-nth 0 (collapse frame))
                                                   path)))))))))

(defthmd
  abs-opendir-correctness-2
  (implies
   (good-frame-p frame)
   (b* (((mv fs &) (collapse frame)))
     (and (equal (mv-nth 0
                         (abs-opendir frame path dir-stream-table))
                 (mv-nth 0
                         (hifat-opendir fs path dir-stream-table)))
          (equal (mv-nth 1
                         (abs-opendir frame path dir-stream-table))
                 (mv-nth 1
                         (hifat-opendir fs path dir-stream-table)))
          (equal (mv-nth 2
                         (abs-opendir frame path dir-stream-table))
                 (mv-nth 2
                         (hifat-opendir fs path dir-stream-table))))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable abs-opendir
                              hifat-opendir good-frame-p))))

(defund abs-readdir (dirp dir-stream-table)
  (hifat-readdir dirp dir-stream-table))

(defund abs-closedir (dirp dir-stream-table)
  (hifat-closedir dirp dir-stream-table))

(defthm
  abs-pwrite-correctness-lemma-2
  (implies
   (and (equal (mv-nth 1
                       (hifat-find-file (mv-nth 0 (collapse frame))
                                        (dirname path)))
               0)
        (mv-nth 1 (collapse frame))
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (consp (assoc-equal 0 frame))
        (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
               0)
        (equal 0
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))))
   (abs-complete
    (put-assoc-equal
     (basename path)
     (m1-file
      (m1-file->d-e$inline
       (cdr
        (assoc-equal
         (basename path)
         (mv-nth
          0
          (abs-alloc
           (frame-val->dir$inline
            (cdr (assoc-equal 0
                              (partial-collapse frame (dirname path)))))
           (dirname path)
           (find-new-index
            (strip-cars (partial-collapse frame (dirname path)))))))))
      (implode$inline
       (insert-text
        (explode$inline
         (m1-file->contents$inline
          (cdr
           (assoc-equal
            (basename path)
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir$inline
               (cdr (assoc-equal 0
                                 (partial-collapse frame (dirname path)))))
              (dirname path)
              (find-new-index
               (strip-cars (partial-collapse frame (dirname path))))))))))
        offset buf)))
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir$inline
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))))
  :hints
  (("goal"
    :in-theory (e/d (abs-complete)
                    ())
    :do-not-induct t
    :use (:instance abs-find-file-src-correctness-2
                    (frame (partial-collapse frame (dirname path)))
                    (path (dirname path)))
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path))))))))))

(defthm
  abs-pwrite-correctness-lemma-7
  (implies (consp (assoc-equal 0 frame))
           (< 0
              (find-new-index (strip-cars (partial-collapse frame path)))))
  :hints (("goal" :do-not-induct t))
  :rule-classes :type-prescription)

(defthm
  abs-pwrite-correctness-lemma-10
  (implies
   (and
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (not
    (consp
     (abs-addrs
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (dirname path)
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))))))
  :instructions
  (:promote
   (:dive 1 1 1)
   (:claim
    (and
     (zp
      (mv-nth
       1
       (abs-find-file-helper
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (dirname path))))
     (abs-directory-file-p
      (mv-nth
       0
       (abs-find-file-helper
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (dirname path)))))
    :hints :none)
   (:rewrite abs-mkdir-correctness-lemma-30)
   :top :bash
   (:bash
    ("goal" :in-theory (disable (:rewrite abs-mkdir-correctness-lemma-85))
     :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                     (x-path (dirname path))
                     (path (dirname path))
                     (frame (partial-collapse frame (dirname path))))))
   (:bash
    ("goal"
     :in-theory (disable (:rewrite abs-mkdir-correctness-lemma-85))
     :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                     (x-path (dirname path))
                     (path (dirname path))
                     (frame (partial-collapse frame (dirname path))))))))

(defthm
  abs-pwrite-correctness-lemma-11
  (implies
   (and
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (abs-complete
    (put-assoc-equal
     (basename path)
     (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
              (implode$inline (insert-text nil offset buf)))
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir$inline
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable abs-complete))))

(defthm
  abs-pwrite-correctness-lemma-14
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (consp
     (assoc-equal
      (basename path)
      (m1-file->contents (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (not
     (consp
      (assoc-equal
       (basename path)
       (hifat-file-alist-fix
        (abs-file->contents
         (mv-nth
          0
          (abs-find-file-helper
           (frame-val->dir
            (cdr (assoc-equal 0
                              (partial-collapse frame (dirname path)))))
           (dirname path))))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (m1-directory-file-p
    (mv-nth
     0
     (hifat-find-file
      (frame-val->dir$inline
       (cdr (assoc-equal 0
                         (partial-collapse frame (dirname path)))))
      (dirname path)))))
  :hints
  (("goal" :in-theory (disable (:rewrite abs-mkdir-correctness-lemma-85))
    :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                    (x-path (dirname path))
                    (path (dirname path))
                    (frame (partial-collapse frame (dirname path)))))))

(defthm
  abs-pwrite-correctness-lemma-13
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (not
     (m1-regular-file-p
      (cdr
       (assoc-equal
        (basename path)
        (abs-file->contents
         (mv-nth
          0
          (abs-find-file-helper
           (frame-val->dir
            (cdr (assoc-equal 0
                              (partial-collapse frame (dirname path)))))
           (dirname path))))))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (consp
     (assoc-equal
      (basename path)
      (hifat-file-alist-fix
       (abs-file->contents
        (mv-nth
         0
         (abs-find-file-helper
          (frame-val->dir
           (cdr (assoc-equal 0
                             (partial-collapse frame (dirname path)))))
          (dirname path)))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename path)
        (hifat-file-alist-fix
         (abs-file->contents
          (mv-nth
           0
           (abs-find-file-helper
            (frame-val->dir
             (cdr (assoc-equal 0
                               (partial-collapse frame (dirname path)))))
            (dirname path)))))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (m1-directory-file-p
    (mv-nth
     '0
     (hifat-find-file
      (frame-val->dir$inline
       (cdr (assoc-equal '0
                         (partial-collapse frame (dirname path)))))
      (dirname path)))))
  :hints
  (("goal" :in-theory (e/d nil
                           ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                    (x-path (dirname path))
                    (path (dirname path))
                    (frame (partial-collapse frame (dirname path)))))))

(defthm
  abs-pwrite-correctness-lemma-16
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (dirname path))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (not
     (consp
      (assoc-equal
       (basename path)
       (hifat-file-alist-fix
        (mv-nth
         0
         (abs-alloc
          (frame-val->dir
           (cdr (assoc-equal 0
                             (partial-collapse frame (dirname path)))))
          (dirname path)
          (find-new-index
           (strip-cars (partial-collapse frame (dirname path))))))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (equal
    (hifat-file-alist-fix
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    (mv-nth
     0
     (abs-alloc
      (frame-val->dir
       (cdr (assoc-equal 0
                         (partial-collapse frame (dirname path)))))
      (dirname path)
      (find-new-index
       (strip-cars (partial-collapse frame (dirname path))))))))
  :hints
  (("goal"
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    :in-theory (e/d nil
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                    (x-path (dirname path))
                    (path (dirname path))
                    (frame (partial-collapse frame (dirname path)))))))

(defthm
  abs-pwrite-correctness-lemma-22
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (dirname path))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename path)
        (hifat-file-alist-fix
         (mv-nth
          0
          (abs-alloc
           (frame-val->dir
            (cdr (assoc-equal 0
                              (partial-collapse frame (dirname path)))))
           (dirname path)
           (find-new-index
            (strip-cars (partial-collapse frame (dirname path)))))))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (equal
    (hifat-file-alist-fix
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    (mv-nth
     0
     (abs-alloc
      (frame-val->dir
       (cdr (assoc-equal 0
                         (partial-collapse frame (dirname path)))))
      (dirname path)
      (find-new-index
       (strip-cars (partial-collapse frame (dirname path))))))))
  :hints
  (("goal"
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    :in-theory (e/d nil
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                    (x-path (dirname path))
                    (path (dirname path))
                    (frame (partial-collapse frame (dirname path)))))))

(defthmd
  abs-pwrite-correctness-lemma-23
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp (dirname path))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal (basename path)
                    (m1-file->contents
                     (mv-nth 0
                             (hifat-find-file (mv-nth 0 (collapse frame))
                                              (dirname path))))))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (consp
     (assoc-equal
      (basename path)
      (hifat-file-alist-fix
       (mv-nth
        0
        (abs-alloc
         (frame-val->dir
          (cdr (assoc-equal 0
                            (partial-collapse frame (dirname path)))))
         (dirname path)
         (find-new-index
          (strip-cars (partial-collapse frame (dirname path)))))))))
    (m1-directory-file-p
     (cdr
      (assoc-equal
       (basename path)
       (hifat-file-alist-fix
        (mv-nth
         0
         (abs-alloc
          (frame-val->dir
           (cdr (assoc-equal 0
                             (partial-collapse frame (dirname path)))))
          (dirname path)
          (find-new-index
           (strip-cars (partial-collapse frame (dirname path))))))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (m1-regular-file-p
    (cdr
     (assoc-equal
      (basename path)
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (dirname path)
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))))))
  :instructions
  ((:bash
    ("goal"
     :do-not-induct t
     :expand
     (:with
      abs-mkdir-correctness-lemma-30
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (dirname path)
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path)))))))
     :in-theory (e/d nil
                     ((:rewrite abs-mkdir-correctness-lemma-85)))
     :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                     (x-path (dirname path))
                     (path (dirname path))
                     (frame (partial-collapse frame (dirname path))))))
   (:dive 1 1 1)
   (:= (fat32-filename-fix (basename path)))
   :top (:dive 1 1 2)
   (:=
    (hifat-file-alist-fix
     (m1-file->contents$inline
      (mv-nth '0
              (hifat-find-file
               (mv-nth '0
                       (collapse (partial-collapse frame (dirname path))))
               (dirname path))))))
   :top (:dive 1 1 2 1 1 2 1)
   (:rewrite (:rewrite partial-collapse-correctness-1 . 2))
   :top :bash))

(defthm
  abs-pwrite-correctness-lemma-24
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp (dirname path))
    (not
     (m1-regular-file-p
      (cdr
       (assoc-equal
        (basename path)
        (mv-nth
         0
         (abs-alloc
          (frame-val->dir
           (cdr (assoc-equal 0
                             (partial-collapse frame (dirname path)))))
          (dirname path)
          (find-new-index
           (strip-cars (partial-collapse frame (dirname path))))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal (basename path)
                    (m1-file->contents
                     (mv-nth 0
                             (hifat-find-file (mv-nth 0 (collapse frame))
                                              (dirname path))))))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (equal
    (put-assoc-equal
     (basename path)
     (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
              (implode (insert-text nil offset buf)))
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (dirname path)
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))
      (list (basename path))
      (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
               (implode (insert-text nil offset buf)))))))
  :hints (("goal" :in-theory (enable hifat-place-file
                                     abs-pwrite-correctness-lemma-23)
           :do-not-induct t)))

(defthmd
  abs-pwrite-correctness-lemma-25
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (dirname path))
    (not
     (m1-regular-file-p
      (cdr
       (assoc-equal
        (basename path)
        (mv-nth
         0
         (abs-alloc
          (frame-val->dir
           (cdr (assoc-equal 0
                             (partial-collapse frame (dirname path)))))
          (dirname path)
          (find-new-index
           (strip-cars (partial-collapse frame (dirname path))))))))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (equal
    (hifat-file-alist-fix
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    (mv-nth
     0
     (abs-alloc
      (frame-val->dir
       (cdr (assoc-equal 0
                         (partial-collapse frame (dirname path)))))
      (dirname path)
      (find-new-index
       (strip-cars (partial-collapse frame (dirname path))))))))
  :hints
  (("goal"
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    :in-theory (disable (:rewrite abs-mkdir-correctness-lemma-85))
    :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                    (x-path (dirname path))
                    (path (dirname path))
                    (frame (partial-collapse frame (dirname path)))))))

(defthmd
  abs-pwrite-correctness-lemma-15
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (equal
     0
     (abs-find-file-src
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (mv-nth
         0
         (abs-alloc
          (frame-val->dir
           (cdr
            (assoc-equal
             0
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
          (find-new-index
           (strip-cars
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))))))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (abs-complete
    (mv-nth
     0
     (abs-alloc
      (frame-val->dir$inline
       (cdr
        (assoc-equal
         0
         (partial-collapse
          frame
          (dirname (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
      (dirname (file-table-element->fid$inline
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (find-new-index
       (strip-cars
        (partial-collapse
         frame
         (dirname (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))))
  :hints
  (("goal"
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          0
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    :in-theory (disable (:rewrite abs-mkdir-correctness-lemma-85))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-28
  (implies
   (and
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (not
     (m1-regular-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (mv-nth
         0
         (abs-alloc
          (frame-val->dir
           (cdr
            (assoc-equal
             0
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
          (find-new-index
           (strip-cars
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))))))))))
    (equal
     0
     (abs-find-file-src
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table)))))))
   (equal
    (put-assoc-equal
     (basename (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (mv-nth
          0
          (abs-alloc
           (frame-val->dir
            (cdr
             (assoc-equal
              0
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
           (find-new-index
            (strip-cars
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))))))))))
      (hifat-file-alist-fix
       (m1-file->contents
        (cdr
         (assoc-equal
          (basename (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
          (mv-nth
           0
           (abs-alloc
            (frame-val->dir
             (cdr
              (assoc-equal
               0
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
            (find-new-index
             (strip-cars
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))))))
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          0
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr
          (assoc-equal
           0
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
        (find-new-index
         (strip-cars
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))
      (list (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
      (m1-file
       (m1-file->d-e
        (cdr
         (assoc-equal
          (basename (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
          (mv-nth
           0
           (abs-alloc
            (frame-val->dir
             (cdr
              (assoc-equal
               0
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
            (find-new-index
             (strip-cars
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))))
       (hifat-file-alist-fix
        (m1-file->contents
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (mv-nth
            0
            (abs-alloc
             (frame-val->dir
              (cdr
               (assoc-equal
                0
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
             (find-new-index
              (strip-cars
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))))))))))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable hifat-place-file
                              abs-pwrite-correctness-lemma-15
                              (:rewrite abs-pwrite-correctness-lemma-25)))))

(defthm abs-pwrite-correctness-lemma-26
  (implies
   (and
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (no-duplicatesp-equal (strip-cars frame))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (prefixp
    (frame-val->path
     (cdr
      (assoc-equal
       (abs-find-file-src
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       frame)))
    (dirname (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d (abs-complete)
         (abs-mkdir-correctness-lemma-85 path-clear-partial-collapse-when-not-zp-src-lemma-2))
    :use
    (:instance
     (:rewrite path-clear-partial-collapse-when-not-zp-src-lemma-2)
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-17
  (implies
   (and (equal (mv-nth 1
                       (hifat-find-file (mv-nth 0 (collapse frame))
                                        (dirname path)))
               0)
        (mv-nth 1 (collapse frame))
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (consp (assoc-equal 0 frame))
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame))))
   (prefixp
    (frame-val->path$inline
     (cdr
      (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                      (dirname path))
                   frame)))
    (dirname path)))
  :hints
  (("goal" :do-not-induct t
    :use (:instance (:rewrite abs-find-file-src-correctness-2)
                    (path (dirname path))
                    (frame (partial-collapse frame (dirname path)))))))

(defthm
  abs-pwrite-correctness-lemma-30
  (implies
   (and (equal (mv-nth 1
                       (hifat-find-file (mv-nth 0 (collapse frame))
                                        (dirname path)))
               0)
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (mv-nth 1 (collapse frame))
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (consp (assoc-equal 0 frame))
        (m1-file-p file))
   (abs-complete
    (put-assoc-equal
     (basename path)
     file
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir$inline
        (cdr (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
       (nthcdr
        (len
         (frame-val->path$inline
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (dirname path))
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))))
  :hints
  (("goal"
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (dirname path))
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    :in-theory (e/d (abs-complete)
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path
      (nthcdr
       (len
        (frame-val->path
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame))))
       (dirname path)))
     (path (dirname path))
     (frame (partial-collapse frame (dirname path)))))))

(defthm
  abs-pwrite-correctness-lemma-20
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (equal
    (hifat-file-alist-fix
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir$inline
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (partial-collapse
           frame
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (nthcdr
        (len
         (frame-val->path$inline
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid$inline
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    (mv-nth
     0
     (abs-alloc
      (frame-val->dir$inline
       (cdr
        (assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (partial-collapse
          frame
          (dirname (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
      (nthcdr
       (len
        (frame-val->path$inline
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           frame))))
       (dirname (file-table-element->fid$inline
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))
      (find-new-index
       (strip-cars
        (partial-collapse
         frame
         (dirname (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))))
  :hints
  (("goal"
    :in-theory (e/d nil
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path
      (nthcdr
       (len
        (frame-val->path
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           frame))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (nthcdr
        (len
         (frame-val->path
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))))

(defthm
  abs-pwrite-correctness-lemma-36
  (implies
   (and (equal (mv-nth 1
                       (hifat-find-file (mv-nth 0 (collapse frame))
                                        (dirname path)))
               0)
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (mv-nth 1 (collapse frame))
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (consp (assoc-equal 0 frame)))
   (abs-complete
    (mv-nth
     0
     (abs-alloc
      (frame-val->dir$inline
       (cdr (assoc-equal
             (abs-find-file-src (partial-collapse frame (dirname path))
                                (dirname path))
             (partial-collapse frame (dirname path)))))
      (nthcdr
       (len
        (frame-val->path$inline
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame))))
       (dirname path))
      (find-new-index
       (strip-cars (partial-collapse frame (dirname path))))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d nil
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path
      (nthcdr
       (len
        (frame-val->path
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame))))
       (dirname path)))
     (path (dirname path))
     (frame (partial-collapse frame (dirname path))))
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (dirname path))
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path))))))))))

(defthm frame-val-of-the-dir-field
  (implies (and (equal (frame-val->path x) path)
                (equal (frame-val->src x) src))
           (equal (frame-val path (frame-val->dir x) src)
                  (frame-val-fix x)))
  :hints (("goal" :do-not-induct t
           :in-theory (disable frame-val-of-fields)
           :use frame-val-of-fields)))

(defthm
  abs-pwrite-correctness-lemma-39
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (m1-regular-file-p
     (cdr
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (mv-nth
        0
        (abs-alloc
         (frame-val->dir
          (cdr
           (assoc-equal
            0
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
         (find-new-index
          (strip-cars
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))))
    (equal
     0
     (abs-find-file-src
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (hifat-equiv
    (mv-nth
     0
     (abs-alloc
      (frame-val->dir
       (cdr
        (assoc-equal
         0
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (find-new-index
       (strip-cars
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (m1-file->contents
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))))
  :hints
  (("goal"
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          0
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    :in-theory (disable (:rewrite abs-mkdir-correctness-lemma-85))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-44
  (implies
   (and (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (no-duplicatesp-equal (strip-cars frame)))
   (fat32-filename-list-prefixp
    (frame-val->path$inline
     (cdr
      (assoc-equal
       (abs-find-file-src
        (partial-collapse
         frame
         (dirname (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (dirname (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (frame->frame frame))))
    (dirname (file-table-element->fid$inline
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))
  :hints
  (("goal"
    :in-theory
    (e/d (fat32-filename-list-prefixp-alt assoc-of-frame->frame) ())
    :use
    (:instance
     (:rewrite abs-find-file-src-correctness-2)
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-45
  (implies
   (and
    (not
     (consp
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (frame->frame frame))))))
    (not
     (consp
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (m1-file->contents
        (mv-nth
         0
         (hifat-find-file
          (mv-nth
           0
           (collapse
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))))
          (nthcdr
           (len
            (frame-val->path
             (cdr
              (assoc-equal
               (abs-find-file-src
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               frame))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))
   (< 0
      (mv-nth
       1
       (hifat-find-file
        (mv-nth 0 (collapse frame))
        (nthcdr
         (len
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d (frame-reps-fs good-frame-p
                        abs-pwrite frame->frame-of-put-assoc
                        1st-complete frame-addrs-root
                        dist-names abs-separate abs-fs-fix
                        assoc-equal-of-frame-with-root
                        hifat-no-dups-p
                        hifat-place-file hifat-find-file
                        assoc-of-frame->frame)
         ((:rewrite collapse-hifat-place-file-lemma-6)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 2)
          (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
          (:rewrite len-when-prefixp)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 3)
          (:rewrite abs-lstat-refinement-lemma-1)
          (:rewrite abs-fs-p-of-ctx-app)
          (:rewrite partial-collapse-correctness-lemma-2)
          (:type-prescription assoc-when-zp-len)
          (:rewrite abs-addrs-when-m1-file-contents-p)
          (:rewrite final-val-seq-of-collapse-this-lemma-2)
          (:rewrite ctx-app-when-not-ctx-app-ok)
          (:rewrite abs-mkdir-correctness-lemma-73)
          (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
          (:rewrite assoc-after-remove-assoc)
          (:definition nth)
          (:definition put-assoc-equal)
          (:rewrite insert-text-correctness-4)
          collapse-hifat-place-file-2
          (:rewrite absfat-subsetp-transitivity-lemma-7)
          (:rewrite nthcdr-when->=-n-len-l)))
    :use
    ((:instance
      collapse-hifat-place-file-2
      (root
       (frame->root
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))
      (frame
       (frame->frame
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))
      (x
       (abs-find-file-src
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))
      (path
       (append
        (nthcdr
         (len
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (list (basename (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))))
      (file
       (m1-file
        (m1-file->d-e
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (mv-nth
            0
            (abs-alloc
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
             (nthcdr
              (len
               (frame-val->path
                (cdr
                 (assoc-equal
                  (abs-find-file-src
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  frame))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (find-new-index
              (strip-cars
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))))))
        (implode
         (insert-text
          (explode
           (m1-file->contents
            (cdr
             (assoc-equal
              (basename (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))
              (mv-nth
               0
               (abs-alloc
                (frame-val->dir
                 (cdr
                  (assoc-equal
                   (abs-find-file-src
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
                (nthcdr
                 (len
                  (frame-val->path
                   (cdr
                    (assoc-equal
                     (abs-find-file-src
                      (partial-collapse
                       frame
                       (dirname
                        (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     frame))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (find-new-index
                 (strip-cars
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
          offset buf))))))))
  :rule-classes :linear)

(defthm
  abs-pwrite-correctness-lemma-46
  (implies
   (and
    (not
     (consp
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (frame->frame frame))))))
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (m1-regular-file-p
    (cdr
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth
          0
          (collapse
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))
         (nthcdr
          (len
           (frame-val->path
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              frame))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))))
  :instructions
  ((:bash
    ("goal"
     :in-theory
     (e/d (frame-reps-fs good-frame-p
                         abs-pwrite frame->frame-of-put-assoc
                         collapse collapse-this
                         1st-complete frame-addrs-root
                         dist-names abs-separate abs-fs-fix
                         assoc-equal-of-frame-with-root
                         hifat-no-dups-p
                         hifat-place-file hifat-find-file
                         assoc-of-frame->frame)
          ((:rewrite collapse-hifat-place-file-lemma-6)
           (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                     . 2)
           (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
           (:rewrite len-when-prefixp)
           (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                     . 3)
           (:rewrite abs-lstat-refinement-lemma-1)
           (:rewrite abs-fs-p-of-ctx-app)
           (:rewrite partial-collapse-correctness-lemma-2)
           (:type-prescription assoc-when-zp-len)
           (:rewrite abs-addrs-when-m1-file-contents-p)
           (:rewrite final-val-seq-of-collapse-this-lemma-2)
           (:rewrite ctx-app-when-not-ctx-app-ok)
           (:rewrite abs-mkdir-correctness-lemma-73)
           (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
           (:rewrite assoc-after-remove-assoc)
           (:definition nth)
           (:definition put-assoc-equal)
           (:rewrite insert-text-correctness-4)))))
   (:dive 1 1 1)
   (:= (fat32-filename-fix
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))
   :top (:dive 1 1 2)
   (:=
    (hifat-file-alist-fix
     (m1-file->contents$inline
      (mv-nth
       '0
       (hifat-find-file
        (mv-nth
         '0
         (collapse
          (partial-collapse
           frame
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))
        (dirname (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))))
   :top (:dive 1 1 2 1 1 2 1)
   (:rewrite (:rewrite partial-collapse-correctness-1 . 2))
   :top :bash))

(defthmd
  abs-pwrite-correctness-lemma-47
  (implies
   (and (hifat-equiv m1-file-alist1 m1-file-alist2)
        (syntaxp (not (term-order m1-file-alist1 m1-file-alist2)))
        (m1-regular-file-p (cdr (assoc-equal name m1-file-alist2)))
        (m1-file-alist-p m1-file-alist1)
        (hifat-no-dups-p m1-file-alist1)
        (m1-file-alist-p m1-file-alist2)
        (hifat-no-dups-p m1-file-alist2)
        (fat32-filename-p name))
   (equal (m1-file->contents (cdr (assoc-equal name m1-file-alist1)))
          (m1-file->contents (cdr (assoc-equal name m1-file-alist2)))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable hifat-equiv
                              (:rewrite hifat-find-file-correctness-lemma-6)))))

(defthm
  abs-pwrite-correctness-lemma-49
  (implies
   (and
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (no-duplicatesp-equal (strip-cars frame))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (fat32-filename-list-prefixp
    (frame-val->path$inline
     (cdr
      (assoc-equal
       (abs-find-file-src
        (partial-collapse
         frame
         (dirname (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (dirname (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       frame)))
    (dirname (file-table-element->fid$inline
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))
  :hints
  (("goal"
    :in-theory
    (e/d (fat32-filename-list-prefixp-alt assoc-of-frame->frame) ())
    :use
    (:instance
     (:rewrite abs-find-file-src-correctness-2)
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  hifat-place-file-when-hifat-equiv-3
  (implies
   (and (equal (m1-file->contents file1)
               (m1-file->contents file2))
        (syntaxp (not (term-order file1 file2)))
        (m1-regular-file-p (m1-file-fix file1))
        (m1-regular-file-p (m1-file-fix file2)))
   (hifat-equiv (mv-nth 0 (hifat-place-file fs path file1))
                (mv-nth 0 (hifat-place-file fs path file2))))
  :hints
  (("goal"
    :in-theory (enable hifat-place-file)
    :restrict
    ((put-assoc-under-hifat-equiv-3 ((file2 file2)))))))

(defthm
  abs-pwrite-correctness-lemma-43
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))
   (equal
    (m1-file-contents-fix
     (implode
      (insert-text
       (explode
        (m1-file->contents
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (m1-file->contents
            (mv-nth
             0
             (hifat-find-file
              (mv-nth
               0
               (collapse
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))))))
       offset buf)))
    (m1-file-contents-fix
     (implode
      (insert-text
       (explode
        (m1-file->contents
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (m1-file->contents
            (mv-nth
             0
             (hifat-find-file
              (mv-nth 0 (collapse frame))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))))))
       offset buf)))))
  :hints
  (("goal"
    :use
    (:instance
     (:rewrite abs-pwrite-correctness-lemma-47)
     (m1-file-alist1
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth
          0
          (collapse
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
     (name (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
     (m1-file-alist2
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))

(defthm
  abs-pwrite-correctness-lemma-52
  (implies
   (and
    (not
     (consp
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         frame)))))
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))
   (equal
    (m1-file-contents-fix
     (implode
      (insert-text
       (explode
        (m1-file->contents
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (mv-nth
            0
            (abs-alloc
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
             (find-new-index
              (strip-cars
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))))))))
       offset buf)))
    (m1-file-contents-fix
     (implode
      (insert-text
       (explode
        (m1-file->contents
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (m1-file->contents
            (mv-nth
             0
             (hifat-find-file
              (mv-nth 0 (collapse frame))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))))))
       offset buf)))))
  :hints
  (("goal"
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    :in-theory (disable (:rewrite abs-mkdir-correctness-lemma-85))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-53
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (hifat-equiv
    (put-assoc-equal
     (basename (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0 (collapse frame))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))))))))
        offset buf)))
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file
        (mv-nth
         0
         (collapse
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
    (put-assoc-equal
     (basename (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0 (collapse frame))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))))))))
        offset buf)))
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file
        (mv-nth 0 (collapse frame))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d (hifat-no-dups-p)
                    (hifat-equiv-of-put-assoc-2))
    :use
    (:instance
     (:rewrite hifat-equiv-of-put-assoc-2)
     (fs1
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth
          0
          (collapse
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
     (val
      (m1-file
       (m1-file->d-e
        (cdr
         (assoc-equal
          (basename (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
          (m1-file->contents
           (mv-nth
            0
            (hifat-find-file
             (mv-nth 0 (collapse frame))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))))
       (implode
        (insert-text
         (explode
          (m1-file->contents
           (cdr
            (assoc-equal
             (basename (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
             (m1-file->contents
              (mv-nth
               0
               (hifat-find-file
                (mv-nth 0 (collapse frame))
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))))))
         offset buf))))
     (key (basename (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (fs2
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))

(defthm
  abs-pwrite-correctness-lemma-54
  (implies
   (and
    (not
     (consp
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))
          (dirname
           (file-table-element->fid
            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table)))))
         frame)))))
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table))))))
     0)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table)))))))
    (consp
     (assoc-equal
      (basename
       (file-table-element->fid
        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                          file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))))))))))
   (hifat-equiv
    (put-assoc-equal
     (basename
      (file-table-element->fid
       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                         file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))
         (mv-nth
          0
          (abs-alloc
           (frame-val->dir
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr
                   (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table)))))
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))
              (partial-collapse
               frame
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))))))
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))
           (find-new-index
            (strip-cars
             (partial-collapse
              frame
              (dirname
               (file-table-element->fid
                (cdr
                 (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))))))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal
                           (cdr (assoc-equal fd fd-table))
                           file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table)))))
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table))))))))
              (dirname
               (file-table-element->fid
                (cdr
                 (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))))))))))
        offset buf)))
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file
        (mv-nth
         0
         (collapse
          (partial-collapse
           frame
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))))
        (dirname
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))))))
    (put-assoc-equal
     (basename
      (file-table-element->fid
       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                         file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0 (collapse frame))
            (dirname
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))))))))
        offset buf)))
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file
        (mv-nth 0 (collapse frame))
        (dirname
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))))))))
  :hints
  (("goal"
    :in-theory
    (disable (:rewrite put-assoc-under-hifat-equiv-3))
    :use
    ((:instance
      (:linear len-of-explode-when-m1-file-contents-p-1)
      (x
       (m1-file-contents-fix
        (implode
         (insert-text
          (explode
           (m1-file->contents
            (cdr
             (assoc-equal
              (basename
               (file-table-element->fid
                (cdr
                 (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
              (m1-file->contents
               (mv-nth
                0
                (hifat-find-file
                 (mv-nth 0 (collapse frame))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))))))))
          offset buf)))))
     (:instance
      (:rewrite put-assoc-under-hifat-equiv-3)
      (fs
       (m1-file->contents
        (mv-nth
         0
         (hifat-find-file
          (mv-nth
           0
           (collapse
            (partial-collapse
             frame
             (dirname
              (file-table-element->fid
               (cdr
                (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table)))))))
          (dirname
           (file-table-element->fid
            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))))))
      (file1
       (m1-file
        (m1-file->d-e
         (cdr
          (assoc-equal
           (basename
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))
           (mv-nth
            0
            (abs-alloc
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table)))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table))))))))
             (dirname
              (file-table-element->fid
               (cdr
                (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))
             (find-new-index
              (strip-cars
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr
                   (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))))))))
        (implode
         (insert-text
          (explode
           (m1-file->contents
            (cdr
             (assoc-equal
              (basename
               (file-table-element->fid
                (cdr
                 (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
              (mv-nth
               0
               (abs-alloc
                (frame-val->dir
                 (cdr
                  (assoc-equal
                   (abs-find-file-src
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr
                        (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal
                            (cdr (assoc-equal fd fd-table))
                            file-table)))))
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal
                            (cdr (assoc-equal fd fd-table))
                            file-table))))))))
                (dirname
                 (file-table-element->fid
                  (cdr
                   (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
                (find-new-index
                 (strip-cars
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal
                           (cdr (assoc-equal fd fd-table))
                           file-table)))))))))))))
          offset buf))))
      (name
       (basename
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table)))))
      (file2
       (m1-file
        (m1-file->d-e
         (cdr
          (assoc-equal
           (basename
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))
           (m1-file->contents
            (mv-nth
             0
             (hifat-find-file
              (mv-nth 0 (collapse frame))
              (dirname
               (file-table-element->fid
                (cdr
                 (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))))))))
        (implode
         (insert-text
          (explode
           (m1-file->contents
            (cdr
             (assoc-equal
              (basename
               (file-table-element->fid
                (cdr
                 (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
              (m1-file->contents
               (mv-nth
                0
                (hifat-find-file
                 (mv-nth 0 (collapse frame))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))))))))
          offset buf)))))))))

(defthm
  abs-pwrite-correctness-lemma-50
  (implies
   (and
    (not
     (consp
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         frame)))))
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))
   (hifat-equiv
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth
           0
           (collapse
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (mv-nth
                0
                (abs-alloc
                 (frame-val->dir
                  (cdr
                   (assoc-equal
                    (abs-find-file-src
                     (partial-collapse
                      frame
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
                 (find-new-index
                  (strip-cars
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth
            0
            (collapse
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
  :hints
  (("goal"
    :in-theory (disable hifat-place-file-when-hifat-equiv-1)
    :use
    (:instance
     hifat-place-file-when-hifat-equiv-1
     (file1
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth
           0
           (collapse
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (mv-nth
                0
                (abs-alloc
                 (frame-val->dir
                  (cdr
                   (assoc-equal
                    (abs-find-file-src
                     (partial-collapse
                      frame
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
                 (find-new-index
                  (strip-cars
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth
            0
            (collapse
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (fs (mv-nth 0 (collapse frame)))
     (file2
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))))

(defthm
  abs-pwrite-correctness-lemma-19
  (implies (fat32-filename-list-prefixp x y)
           (fat32-filename-list-equiv (append x (nthcdr (len x) y))
                                      y))
  :hints
  (("goal" :do-not-induct t
    :in-theory
    (e/d (fat32-filename-list-prefixp-alt fat32-filename-list-equiv)
         (append-when-prefixp))
    :use (:instance append-when-prefixp
                    (x (fat32-filename-list-fix x))
                    (y (fat32-filename-list-fix y))))))

(defthm
  abs-pwrite-correctness-lemma-57
  (implies
   (and (zp (mv-nth 1 (hifat-find-file fs x)))
        (m1-directory-file-p (mv-nth 0 (hifat-find-file fs x)))
        (fat32-filename-list-prefixp x y)
        (case-split (consp (nthcdr (len x) y))))
   (equal
    (hifat-find-file (m1-file->contents (mv-nth 0 (hifat-find-file fs x)))
                     (nthcdr (len x) y))
    (hifat-find-file fs y)))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (disable hifat-find-file-of-append-1)
    :use
    ((:instance hifat-find-file-of-append-1
                (y (nthcdr (len x) y)))))))

(defthm
  abs-pwrite-correctness-lemma-33
  (implies
   (and (prefixp x y)
        (zp (mv-nth 1 (hifat-find-file fs x)))
        (m1-directory-file-p (mv-nth 0 (hifat-find-file fs x)))
        (consp (nthcdr (len x) y)))
   (equal
    (mv-nth
     0
     (hifat-place-file
      fs x
      (m1-file
       (m1-file->d-e (mv-nth 0 (hifat-find-file fs x)))
       (mv-nth 0
               (hifat-place-file
                (m1-file->contents (mv-nth 0 (hifat-find-file fs x)))
                (nthcdr (len x) y)
                file)))))
    (mv-nth 0 (hifat-place-file fs y file))))
  :hints (("goal" :do-not-induct t
           :in-theory (e/d (hifat-find-file)
                           (hifat-place-file-of-append-1))
           :use (:instance hifat-place-file-of-append-1
                           (y (nthcdr (len x) y))))))

(defthm
  abs-pwrite-correctness-lemma-64
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))
   (equal
    (insert-text
     (explode
      (m1-file->contents
       (cdr
        (assoc-equal
         (basename (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file
            (mv-nth
             0
             (collapse
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))))))
     offset buf)
    (insert-text
     (explode
      (m1-file->contents
       (cdr
        (assoc-equal
         (basename (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0 (collapse frame))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))))))
     offset buf)))
  :hints
  (("goal"
    :use
    (:instance
     (:rewrite abs-pwrite-correctness-lemma-47)
     (m1-file-alist1
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth
          0
          (collapse
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
     (name (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
     (m1-file-alist2
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))

(defthm
  abs-pwrite-correctness-lemma-65
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table))))))
     0)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (stringp buf)
    (integerp offset)
    (<= 0 offset)
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table)))))))
    (< (+ offset (len (explode buf)))
       4294967296)
    (consp
     (assoc-equal
      (basename
       (file-table-element->fid
        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                          file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))))))))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table)))))
       (dirname
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table))))))))
   (hifat-equiv
    (put-assoc-equal
     (basename
      (file-table-element->fid
       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                         file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))
         (mv-nth
          0
          (abs-alloc
           (frame-val->dir
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr
                   (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table)))))
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))
              (partial-collapse
               frame
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))))))
           (nthcdr
            (len
             (frame-val->path
              (cdr
               (assoc-equal
                (abs-find-file-src
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table)))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))
                frame))))
            (dirname
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table)))))
           (find-new-index
            (strip-cars
             (partial-collapse
              frame
              (dirname
               (file-table-element->fid
                (cdr
                 (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))))))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal
                           (cdr (assoc-equal fd fd-table))
                           file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table)))))
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table))))))))
              (nthcdr
               (len
                (frame-val->path
                 (cdr
                  (assoc-equal
                   (abs-find-file-src
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr
                        (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal
                            (cdr (assoc-equal fd fd-table))
                            file-table)))))
                   frame))))
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))))))))))
        offset buf)))
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file
        (mv-nth
         0
         (collapse
          (partial-collapse
           frame
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))))
        (dirname
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))))))
    (put-assoc-equal
     (basename
      (file-table-element->fid
       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                         file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0 (collapse frame))
            (dirname
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))))))))
        offset buf)))
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file
        (mv-nth 0 (collapse frame))
        (dirname
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))))))))
  :hints
  (("goal"
    :in-theory
    (e/d (len-of-insert-text abs-mkdir-correctness-lemma-30)
         (put-assoc-under-hifat-equiv-3))
    :use
    (:instance
     (:rewrite put-assoc-under-hifat-equiv-3)
     (file2
      (m1-file
       (m1-file->d-e
        (cdr
         (assoc-equal
          (basename
           (file-table-element->fid
            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
          (m1-file->contents
           (mv-nth
            0
            (hifat-find-file
             (mv-nth 0 (collapse frame))
             (dirname
              (file-table-element->fid
               (cdr
                (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))))))))
       (implode
        (insert-text
         (explode
          (m1-file->contents
           (cdr
            (assoc-equal
             (basename
              (file-table-element->fid
               (cdr
                (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))
             (m1-file->contents
              (mv-nth
               0
               (hifat-find-file
                (mv-nth 0 (collapse frame))
                (dirname
                 (file-table-element->fid
                  (cdr
                   (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table)))))))))))
         offset buf))))
     (fs
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth
          0
          (collapse
           (partial-collapse
            frame
            (dirname
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table)))))))
         (dirname
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))))))
     (file1
      (m1-file
       (m1-file->d-e
        (cdr
         (assoc-equal
          (basename
           (file-table-element->fid
            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
          (mv-nth
           0
           (abs-alloc
            (frame-val->dir
             (cdr
              (assoc-equal
               (abs-find-file-src
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))
                (dirname
                 (file-table-element->fid
                  (cdr
                   (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table)))))
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr
                   (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))))
            (nthcdr
             (len
              (frame-val->path
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal
                           (cdr (assoc-equal fd fd-table))
                           file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table)))))
                 frame))))
             (dirname
              (file-table-element->fid
               (cdr
                (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table)))))
            (find-new-index
             (strip-cars
              (partial-collapse
               frame
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))))))))))
       (implode
        (insert-text
         (explode
          (m1-file->contents
           (cdr
            (assoc-equal
             (basename
              (file-table-element->fid
               (cdr
                (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))
             (mv-nth
              0
              (abs-alloc
               (frame-val->dir
                (cdr
                 (assoc-equal
                  (abs-find-file-src
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal
                            (cdr (assoc-equal fd fd-table))
                            file-table)))))
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal
                           (cdr (assoc-equal fd fd-table))
                           file-table)))))
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal
                           (cdr (assoc-equal fd fd-table))
                           file-table))))))))
               (nthcdr
                (len
                 (frame-val->path
                  (cdr
                   (assoc-equal
                    (abs-find-file-src
                     (partial-collapse
                      frame
                      (dirname
                       (file-table-element->fid
                        (cdr
                         (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table)))))
                     (dirname
                      (file-table-element->fid
                       (cdr
                        (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))
                    frame))))
                (dirname
                 (file-table-element->fid
                  (cdr
                   (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table)))))
               (find-new-index
                (strip-cars
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table)))))))))))))
         offset buf))))
     (name
      (basename
       (file-table-element->fid
        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                          file-table))))))
    :expand
    (:with
     m1-file-contents-fix-when-m1-file-contents-p
     (m1-file-contents-fix
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))))))))
        offset buf)))))))

(defthm
  abs-pwrite-correctness-lemma-63
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (stringp buf)
    (integerp offset)
    (<= 0 offset)
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (< (+ offset (len (explode buf)))
       4294967296)
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (hifat-equiv
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth
           0
           (collapse
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
              (nthcdr
               (len
                (frame-val->path
                 (cdr
                  (assoc-equal
                   (abs-find-file-src
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   frame))))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (mv-nth
                0
                (abs-alloc
                 (frame-val->dir
                  (cdr
                   (assoc-equal
                    (abs-find-file-src
                     (partial-collapse
                      frame
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
                 (nthcdr
                  (len
                   (frame-val->path
                    (cdr
                     (assoc-equal
                      (abs-find-file-src
                       (partial-collapse
                        frame
                        (dirname
                         (file-table-element->fid
                          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table)))))
                       (dirname
                        (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
                      frame))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (find-new-index
                  (strip-cars
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth
            0
            (collapse
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
  :hints
  (("goal"
    :in-theory (disable hifat-place-file-when-hifat-equiv-1)
    :use
    (:instance
     hifat-place-file-when-hifat-equiv-1
     (file1
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth
           0
           (collapse
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
              (nthcdr
               (len
                (frame-val->path
                 (cdr
                  (assoc-equal
                   (abs-find-file-src
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   frame))))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (mv-nth
                0
                (abs-alloc
                 (frame-val->dir
                  (cdr
                   (assoc-equal
                    (abs-find-file-src
                     (partial-collapse
                      frame
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
                 (nthcdr
                  (len
                   (frame-val->path
                    (cdr
                     (assoc-equal
                      (abs-find-file-src
                       (partial-collapse
                        frame
                        (dirname
                         (file-table-element->fid
                          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table)))))
                       (dirname
                        (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
                      frame))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (find-new-index
                  (strip-cars
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth
            0
            (collapse
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (fs (mv-nth 0 (collapse frame)))
     (file2
      (m1-file
       (m1-file->d-e$inline
        (mv-nth
         '0
         (hifat-find-file
          (mv-nth '0 (collapse frame))
          (dirname (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e$inline
          (cdr
           (assoc-equal
            (basename (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents$inline
             (mv-nth
              '0
              (hifat-find-file
               (mv-nth '0 (collapse frame))
               (dirname (file-table-element->fid$inline
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode$inline
          (insert-text
           (explode$inline
            (m1-file->contents$inline
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid$inline
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents$inline
                (mv-nth
                 '0
                 (hifat-find-file
                  (mv-nth '0 (collapse frame))
                  (dirname
                   (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents$inline
         (mv-nth
          '0
          (hifat-find-file
           (mv-nth '0 (collapse frame))
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))))

(defthmd
  abs-pwrite-correctness-lemma-21
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (equal
     (mv-nth
      1
      (hifat-find-file (mv-nth 0 (collapse frame))
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
     0)
    (m1-regular-file-p
     (cdr
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (mv-nth
        0
        (abs-alloc
         (frame-val->dir
          (cdr
           (assoc-equal
            0
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
         (find-new-index
          (strip-cars
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (equal
     0
     (abs-find-file-src
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (equal
    (implode
     (insert-text
      (explode
       (m1-file->contents
        (cdr
         (assoc-equal
          (basename (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
          (mv-nth
           0
           (abs-alloc
            (frame-val->dir
             (cdr
              (assoc-equal
               0
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
            (find-new-index
             (strip-cars
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))))))))))
      offset buf))
    (implode
     (insert-text
      (explode
       (m1-file->contents
        (cdr
         (assoc-equal
          (basename (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
          (m1-file->contents
           (mv-nth
            0
            (hifat-find-file
             (mv-nth 0 (collapse frame))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))))))))
      offset buf))))
  :hints
  (("goal"
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          0
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    :in-theory (e/d nil
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-69
  (hifat-equiv
   (put-assoc-equal
    (basename (file-table-element->fid
               (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                 file-table))))
    (m1-file
     (m1-file->d-e
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (mv-nth
         0
         (abs-alloc
          (frame-val->dir
           (cdr
            (assoc-equal
             0
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
          (find-new-index
           (strip-cars
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))))))
     (implode
      (insert-text
       (explode
        (m1-file->contents
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (m1-file->contents
            (mv-nth
             0
             (hifat-find-file
              (mv-nth 0 (collapse frame))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))))))
       offset buf)))
    (m1-file->contents
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (put-assoc-equal
    (basename (file-table-element->fid
               (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                 file-table))))
    (m1-file
     (m1-file->d-e
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))
     (implode
      (insert-text
       (explode
        (m1-file->contents
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (m1-file->contents
            (mv-nth
             0
             (hifat-find-file
              (mv-nth 0 (collapse frame))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))))))
       offset buf)))
    (m1-file->contents
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))))
  :hints
  (("goal"
    :in-theory (disable (:rewrite put-assoc-under-hifat-equiv-3))
    :use
    ((:instance
      (:linear len-of-explode-when-m1-file-contents-p-1)
      (x
       (m1-file-contents-fix
        (implode
         (insert-text
          (explode
           (m1-file->contents
            (cdr
             (assoc-equal
              (basename (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))
              (m1-file->contents
               (mv-nth
                0
                (hifat-find-file
                 (mv-nth 0 (collapse frame))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))))
          offset buf)))))
     (:instance
      (:rewrite put-assoc-under-hifat-equiv-3)
      (fs
       (m1-file->contents
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
      (file1
       (m1-file
        (m1-file->d-e
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (mv-nth
            0
            (abs-alloc
             (frame-val->dir
              (cdr
               (assoc-equal
                0
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
             (find-new-index
              (strip-cars
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))))))
        (implode
         (insert-text
          (explode
           (m1-file->contents
            (cdr
             (assoc-equal
              (basename (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))
              (m1-file->contents
               (mv-nth
                0
                (hifat-find-file
                 (mv-nth 0 (collapse frame))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))))
          offset buf))))
      (name (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
      (file2
       (m1-file
        (m1-file->d-e
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (m1-file->contents
            (mv-nth
             0
             (hifat-find-file
              (mv-nth 0 (collapse frame))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))))))))
        (implode
         (insert-text
          (explode
           (m1-file->contents
            (cdr
             (assoc-equal
              (basename (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))
              (m1-file->contents
               (mv-nth
                0
                (hifat-find-file
                 (mv-nth 0 (collapse frame))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))))
          offset buf)))))))))

(defthm
  abs-pwrite-correctness-lemma-72
  (hifat-equiv
   (put-assoc-equal
    (basename (file-table-element->fid
               (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                 file-table))))
    (m1-file
     (m1-file->d-e
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth
            0
            (collapse
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))
     (implode
      (insert-text
       (explode
        (m1-file->contents
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (m1-file->contents
            (mv-nth
             0
             (hifat-find-file
              (mv-nth 0 (collapse frame))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))))))
       offset buf)))
    (m1-file->contents
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (put-assoc-equal
    (basename (file-table-element->fid
               (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                 file-table))))
    (m1-file
     (m1-file->d-e
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))
     (implode
      (insert-text
       (explode
        (m1-file->contents
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (m1-file->contents
            (mv-nth
             0
             (hifat-find-file
              (mv-nth 0 (collapse frame))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))))))
       offset buf)))
    (m1-file->contents
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))))
  :hints
  (("goal"
    :in-theory (disable (:rewrite put-assoc-under-hifat-equiv-3))
    :use
    (:instance
     (:rewrite put-assoc-under-hifat-equiv-3)
     (fs
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
     (file1
      (m1-file
       (m1-file->d-e
        (cdr
         (assoc-equal
          (basename (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
          (m1-file->contents
           (mv-nth
            0
            (hifat-find-file
             (mv-nth
              0
              (collapse
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))))
       (implode
        (insert-text
         (explode
          (m1-file->contents
           (cdr
            (assoc-equal
             (basename (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
             (m1-file->contents
              (mv-nth
               0
               (hifat-find-file
                (mv-nth 0 (collapse frame))
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))))))
         offset buf))))
     (name (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
     (file2
      (m1-file
       (m1-file->d-e
        (cdr
         (assoc-equal
          (basename (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
          (m1-file->contents
           (mv-nth
            0
            (hifat-find-file
             (mv-nth 0 (collapse frame))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))))
       (implode
        (insert-text
         (explode
          (m1-file->contents
           (cdr
            (assoc-equal
             (basename (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
             (m1-file->contents
              (mv-nth
               0
               (hifat-find-file
                (mv-nth 0 (collapse frame))
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))))))
         offset buf))))))))

(defthm
  abs-pwrite-correctness-lemma-73
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp
     (dirname
      (file-table-element->fid
       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                         file-table)))))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table)))))))
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (file-table-element->fid
        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                          file-table)))))
     0)
    (consp
     (assoc-equal
      (basename
       (file-table-element->fid
        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                          file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))))))))
    (equal
     0
     (abs-find-file-src
      (partial-collapse
       frame
       (dirname
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table)))))
      (dirname
       (file-table-element->fid
        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                          file-table))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (hifat-equiv
    (put-assoc-equal
     (basename
      (file-table-element->fid
       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                         file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))
         (mv-nth
          0
          (abs-alloc
           (frame-val->dir
            (cdr
             (assoc-equal
              0
              (partial-collapse
               frame
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))))))
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))
           (find-new-index
            (strip-cars
             (partial-collapse
              frame
              (dirname
               (file-table-element->fid
                (cdr
                 (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))))))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 0
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal
                          (cdr (assoc-equal fd fd-table))
                          file-table))))))))
              (dirname
               (file-table-element->fid
                (cdr
                 (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal
                         (cdr (assoc-equal fd fd-table))
                         file-table)))))))))))))
        offset buf)))
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file
        (mv-nth 0 (collapse frame))
        (dirname
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))))))
    (put-assoc-equal
     (basename
      (file-table-element->fid
       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                         file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename
          (file-table-element->fid
           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                             file-table))))
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0 (collapse frame))
            (dirname
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table)))))))))))
        offset buf)))
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file
        (mv-nth 0 (collapse frame))
        (dirname
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))))))))
  :hints
  (("goal"
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          0
          (partial-collapse
           frame
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))))))
       (dirname
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname
           (file-table-element->fid
            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))))))))
    :in-theory
    (e/d nil
         ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path
      (dirname
       (file-table-element->fid
        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                          file-table)))))
     (path
      (dirname
       (file-table-element->fid
        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                          file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname
        (file-table-element->fid
         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                           file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-71
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (equal
     (mv-nth
      1
      (hifat-find-file (mv-nth 0 (collapse frame))
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
     0)
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (equal
     0
     (abs-find-file-src
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (hifat-equiv
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 0
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (mv-nth
                0
                (abs-alloc
                 (frame-val->dir
                  (cdr
                   (assoc-equal
                    0
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
                 (find-new-index
                  (strip-cars
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
  :hints
  (("goal"
    :in-theory (disable hifat-place-file-when-hifat-equiv-1)
    :use
    (:instance hifat-place-file-when-hifat-equiv-1
     (file1
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname
           (file-table-element->fid
            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table)))))))
       (put-assoc-equal
        (basename
         (file-table-element->fid
          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                            file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 0
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr
                     (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))))))
              (dirname
               (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr
                    (assoc-equal (cdr (assoc-equal fd fd-table))
                                 file-table))))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr
                  (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))
               (mv-nth
                0
                (abs-alloc
                 (frame-val->dir
                  (cdr
                   (assoc-equal
                    0
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal
                             (cdr (assoc-equal fd fd-table))
                             file-table))))))))
                 (dirname
                  (file-table-element->fid
                   (cdr
                    (assoc-equal (cdr (assoc-equal fd fd-table))
                                 file-table))))
                 (find-new-index
                  (strip-cars
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal
                            (cdr (assoc-equal fd fd-table))
                            file-table)))))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))))))))
     (path
      (dirname
       (file-table-element->fid
        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                          file-table)))))
     (fs (mv-nth 0 (collapse frame)))
     (file2
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))))

(defthm
  abs-pwrite-correctness-lemma-76
  (implies
   (and
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (equal
     (mv-nth
      1
      (hifat-find-file (mv-nth 0 (collapse frame))
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
     0)
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (hifat-equiv
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
              (nthcdr
               (len
                (frame-val->path
                 (cdr
                  (assoc-equal
                   (abs-find-file-src
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   frame))))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (mv-nth
                0
                (abs-alloc
                 (frame-val->dir
                  (cdr
                   (assoc-equal
                    (abs-find-file-src
                     (partial-collapse
                      frame
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
                 (nthcdr
                  (len
                   (frame-val->path
                    (cdr
                     (assoc-equal
                      (abs-find-file-src
                       (partial-collapse
                        frame
                        (dirname
                         (file-table-element->fid
                          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table)))))
                       (dirname
                        (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
                      frame))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (find-new-index
                  (strip-cars
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
  :instructions
  (:promote
   (:dive 1)
   (:rewrite
    hifat-place-file-when-hifat-equiv-1
    ((file2
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))
   :top :bash (:change-goal nil t)
   :bash
   :bash
   (:bash
    ("goal"
     :do-not-induct t
     :expand
     (:with
      abs-mkdir-correctness-lemma-30
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
        (nthcdr
         (len
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (find-new-index
         (strip-cars
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))
     :in-theory (e/d nil
                     ((:rewrite abs-mkdir-correctness-lemma-85)))
     :use
     (:instance
      (:rewrite abs-mkdir-correctness-lemma-85)
      (x-path
       (nthcdr
        (len
         (frame-val->path
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))
      (path (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
      (frame
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))))))

(defthm
  abs-pwrite-correctness-lemma-75
  (implies
   (and
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (equal
     (mv-nth
      1
      (hifat-find-file (mv-nth 0 (collapse frame))
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
     0)
    (consp (file-table-element->fid
            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-directory-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (and
    (mv-nth
     1
     (collapse
      (frame-with-root
       (frame->root
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))
       (put-assoc-equal
        (abs-find-file-src
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (frame-val
         (frame-val->path
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame)))
         (mv-nth
          0
          (abs-place-file-helper
           (frame-val->dir
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))
           (nthcdr
            (len
             (frame-val->path
              (cdr
               (assoc-equal
                (abs-find-file-src
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                frame))))
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))
           (m1-file
            (m1-file->d-e
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (mv-nth
                0
                (abs-alloc
                 (frame-val->dir
                  (cdr
                   (assoc-equal
                    (abs-find-file-src
                     (partial-collapse
                      frame
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
                 (nthcdr
                  (len
                   (frame-val->path
                    (cdr
                     (assoc-equal
                      (abs-find-file-src
                       (partial-collapse
                        frame
                        (dirname
                         (file-table-element->fid
                          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table)))))
                       (dirname
                        (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
                      frame))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (find-new-index
                  (strip-cars
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))))
            (implode
             (insert-text
              (explode
               (m1-file->contents
                (cdr
                 (assoc-equal
                  (basename
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
                  (mv-nth
                   0
                   (abs-alloc
                    (frame-val->dir
                     (cdr
                      (assoc-equal
                       (abs-find-file-src
                        (partial-collapse
                         frame
                         (dirname
                          (file-table-element->fid
                           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                             file-table)))))
                        (dirname
                         (file-table-element->fid
                          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table)))))
                       (partial-collapse
                        frame
                        (dirname
                         (file-table-element->fid
                          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table))))))))
                    (nthcdr
                     (len
                      (frame-val->path
                       (cdr
                        (assoc-equal
                         (abs-find-file-src
                          (partial-collapse
                           frame
                           (dirname
                            (file-table-element->fid
                             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                               file-table)))))
                          (dirname
                           (file-table-element->fid
                            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                              file-table)))))
                         frame))))
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (find-new-index
                     (strip-cars
                      (partial-collapse
                       frame
                       (dirname
                        (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))))))))))
              offset buf)))))
         (frame-val->src
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (frame->frame
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    (absfat-equiv
     (mv-nth
      0
      (collapse
       (frame-with-root
        (frame->root
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))
        (put-assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (frame-val
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame)))
          (mv-nth
           0
           (abs-place-file-helper
            (frame-val->dir
             (cdr
              (assoc-equal
               (abs-find-file-src
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
            (nthcdr
             (len
              (frame-val->path
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 frame))))
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (m1-file
             (m1-file->d-e
              (cdr
               (assoc-equal
                (basename
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
                (mv-nth
                 0
                 (abs-alloc
                  (frame-val->dir
                   (cdr
                    (assoc-equal
                     (abs-find-file-src
                      (partial-collapse
                       frame
                       (dirname
                        (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     (partial-collapse
                      frame
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))))))
                  (nthcdr
                   (len
                    (frame-val->path
                     (cdr
                      (assoc-equal
                       (abs-find-file-src
                        (partial-collapse
                         frame
                         (dirname
                          (file-table-element->fid
                           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                             file-table)))))
                        (dirname
                         (file-table-element->fid
                          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table)))))
                       frame))))
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (find-new-index
                   (strip-cars
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))))))
             (implode
              (insert-text
               (explode
                (m1-file->contents
                 (cdr
                  (assoc-equal
                   (basename
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
                   (mv-nth
                    0
                    (abs-alloc
                     (frame-val->dir
                      (cdr
                       (assoc-equal
                        (abs-find-file-src
                         (partial-collapse
                          frame
                          (dirname
                           (file-table-element->fid
                            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                              file-table)))))
                         (dirname
                          (file-table-element->fid
                           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                             file-table)))))
                        (partial-collapse
                         frame
                         (dirname
                          (file-table-element->fid
                           (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                             file-table))))))))
                     (nthcdr
                      (len
                       (frame-val->path
                        (cdr
                         (assoc-equal
                          (abs-find-file-src
                           (partial-collapse
                            frame
                            (dirname
                             (file-table-element->fid
                              (cdr
                               (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table)))))
                           (dirname
                            (file-table-element->fid
                             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                               file-table)))))
                          frame))))
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     (find-new-index
                      (strip-cars
                       (partial-collapse
                        frame
                        (dirname
                         (file-table-element->fid
                          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table)))))))))))))
               offset buf)))))
          (frame-val->src
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (frame->frame
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))
     (mv-nth
      0
      (hifat-place-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (m1-file
        (m1-file->d-e
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))
        (put-assoc-equal
         (basename (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (m1-file
          (m1-file->d-e
           (cdr
            (assoc-equal
             (basename (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
             (m1-file->contents
              (mv-nth
               0
               (hifat-find-file
                (mv-nth 0 (collapse frame))
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))))
          (implode
           (insert-text
            (explode
             (m1-file->contents
              (cdr
               (assoc-equal
                (basename
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
                (m1-file->contents
                 (mv-nth
                  0
                  (hifat-find-file
                   (mv-nth 0 (collapse frame))
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
            offset buf)))
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0 (collapse frame))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d (frame-reps-fs good-frame-p
                        abs-pwrite frame->frame-of-put-assoc
                        1st-complete frame-addrs-root
                        dist-names abs-separate abs-fs-fix
                        assoc-equal-of-frame-with-root
                        hifat-no-dups-p hifat-place-file
                        assoc-of-frame->frame)
         ((:rewrite collapse-hifat-place-file-lemma-6)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 2)
          (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
          (:rewrite len-when-prefixp)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 3)
          (:rewrite abs-lstat-refinement-lemma-1)
          (:rewrite abs-fs-p-of-ctx-app)
          (:rewrite partial-collapse-correctness-lemma-2)
          (:type-prescription assoc-when-zp-len)
          (:rewrite abs-addrs-when-m1-file-contents-p)
          (:rewrite final-val-seq-of-collapse-this-lemma-2)
          (:rewrite ctx-app-when-not-ctx-app-ok)
          (:rewrite abs-mkdir-correctness-lemma-73)
          (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
          (:rewrite assoc-after-remove-assoc)
          (:definition nth)
          (:definition put-assoc-equal)
          (:rewrite insert-text-correctness-4)
          collapse-hifat-place-file-2
          (:rewrite abs-file-alist-p-correctness-1)
          (:rewrite m1-directory-file-p-when-m1-file-p)))
    :use
    ((:instance
      collapse-hifat-place-file-2
      (root
       (frame->root
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))
      (frame
       (frame->frame
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))
      (x
       (abs-find-file-src
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))
      (path
       (append
        (nthcdr
         (len
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (list (basename (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))))
      (file
       (m1-file
        (m1-file->d-e
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (mv-nth
            0
            (abs-alloc
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
             (nthcdr
              (len
               (frame-val->path
                (cdr
                 (assoc-equal
                  (abs-find-file-src
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  frame))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (find-new-index
              (strip-cars
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))))))
        (implode
         (insert-text
          (explode
           (m1-file->contents
            (cdr
             (assoc-equal
              (basename (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))
              (mv-nth
               0
               (abs-alloc
                (frame-val->dir
                 (cdr
                  (assoc-equal
                   (abs-find-file-src
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
                (nthcdr
                 (len
                  (frame-val->path
                   (cdr
                    (assoc-equal
                     (abs-find-file-src
                      (partial-collapse
                       frame
                       (dirname
                        (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     frame))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (find-new-index
                 (strip-cars
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
          offset buf))))))
    :expand
    ((:with abs-pwrite-correctness-lemma-1
            (:free (file)
                   (hifat-place-file
                    (mv-nth 0 (collapse frame))
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))
                    file)))))))

(defthm
  abs-pwrite-correctness-lemma-38
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (m1-regular-file-p
     (cdr
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (mv-nth
        0
        (abs-alloc
         (frame-val->dir
          (cdr
           (assoc-equal
            0
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
         (find-new-index
          (strip-cars
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))))
    (equal
     0
     (abs-find-file-src
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (equal
    (put-assoc-equal
     (basename (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
     (m1-file
      (m1-file->d-e
       (cdr
        (assoc-equal
         (basename (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (mv-nth
          0
          (abs-alloc
           (frame-val->dir
            (cdr
             (assoc-equal
              0
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
           (find-new-index
            (strip-cars
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))))))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))))))))
        offset buf)))
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          0
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr
          (assoc-equal
           0
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
        (find-new-index
         (strip-cars
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))
      (list (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
      (m1-file
       (m1-file->d-e
        (cdr
         (assoc-equal
          (basename (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
          (mv-nth
           0
           (abs-alloc
            (frame-val->dir
             (cdr
              (assoc-equal
               0
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
            (find-new-index
             (strip-cars
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))))
       (implode
        (insert-text
         (explode
          (m1-file->contents
           (cdr
            (assoc-equal
             (basename (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
             (m1-file->contents
              (mv-nth
               0
               (hifat-find-file
                (mv-nth 0 (collapse frame))
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))))))
         offset buf)))))))
  :hints (("goal" :in-theory (enable hifat-place-file
                                     abs-pwrite-correctness-lemma-15))))

(defthm
  abs-pwrite-correctness-lemma-78
  (implies
   (m1-directory-file-p
    (mv-nth
     0
     (hifat-find-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table)))))))
   (hifat-equiv
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir
               (cdr
                (assoc-equal
                 0
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
  :instructions
  (:promote
   (:dive 1)
   (:rewrite
    hifat-place-file-when-hifat-equiv-1
    ((file2
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (put-assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file
         (m1-file->d-e
          (cdr
           (assoc-equal
            (basename (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (m1-file->contents
             (mv-nth
              0
              (hifat-find-file
               (mv-nth 0 (collapse frame))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))
         (implode
          (insert-text
           (explode
            (m1-file->contents
             (cdr
              (assoc-equal
               (basename
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
               (m1-file->contents
                (mv-nth
                 0
                 (hifat-find-file
                  (mv-nth 0 (collapse frame))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
           offset buf)))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))
   :top
   :bash :bash
   :bash :bash))

(defthm
  abs-pwrite-correctness-lemma-59
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (not
     (member-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (names-at
       (frame-val->dir
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (nthcdr
        (len
         (frame-val->path
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (equal
    (put-assoc-equal
     (basename (file-table-element->fid$inline
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
     (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
              (implode$inline (insert-text nil offset buf)))
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir$inline
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (partial-collapse
           frame
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (nthcdr
        (len
         (frame-val->path$inline
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid$inline
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir$inline
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (partial-collapse
            frame
            (dirname (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
        (nthcdr
         (len
          (frame-val->path$inline
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid$inline
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid$inline
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (dirname (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (find-new-index
         (strip-cars
          (partial-collapse
           frame
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))
      (list (basename (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
      (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
               (implode$inline (insert-text nil offset buf)))))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable hifat-place-file))))

(defthm
  abs-pwrite-correctness-lemma-51
  (implies
   (not (consp (abs-addrs (frame->root frame))))
   (subsetp-equal
    (abs-addrs
     (mv-nth
      1
      (abs-alloc
       (frame-val->dir (cdr (assoc-equal 0 frame)))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (find-new-index (strip-cars frame)))))
    (list (find-new-index (strip-cars frame)))))
  :hints (("goal" :in-theory (enable frame->root abs-complete))))

(defthm
  abs-pwrite-correctness-lemma-61
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp (dirname path))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (not
     (consp
      (assoc-equal
       (basename path)
       (m1-file->contents (mv-nth 0
                                  (hifat-find-file (mv-nth 0 (collapse frame))
                                                   (dirname path)))))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (not
    (member-equal
     (basename path)
     (names-at
      (frame-val->dir
       (cdr (assoc-equal 0
                         (partial-collapse frame (dirname path)))))
      (dirname path)))))
  :instructions
  ((:bash ("goal" :in-theory (enable member-of-names-at)))
   (:bash
    ("goal" :in-theory (disable (:rewrite abs-mkdir-correctness-lemma-85))
     :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                     (x-path (dirname path))
                     (path (dirname path))
                     (frame (partial-collapse frame (dirname path))))))
   (:dive 1 1 1)
   (:= (fat32-filename-fix (basename path)))
   :top (:dive 1 1 2)
   (:=
    (hifat-file-alist-fix
     (m1-file->contents$inline
      (mv-nth '0
              (hifat-find-file
               (mv-nth '0
                       (collapse (partial-collapse frame (dirname path))))
               (dirname path))))))
   :top (:dive 1 1 2 1 1 2 1)
   (:rewrite (:rewrite partial-collapse-correctness-1 . 2))
   :top :bash))

(defthm
  abs-pwrite-correctness-lemma-92
  (implies
   (and
    (m1-file-p file)
    (mv-nth 1 (collapse frame))
    (atom (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp (dirname path))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path)))
    (not
     (consp
      (assoc-equal
       (basename path)
       (m1-file->contents (mv-nth 0
                                  (hifat-find-file (mv-nth 0 (collapse frame))
                                                   (dirname path)))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (equal
    (put-assoc-equal
     (basename path)
     file
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (dirname path)
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))
      (list (basename path))
      file))))
  :hints (("goal" :do-not-induct t
           :in-theory (e/d (collapse collapse-this
                                     1st-complete frame-addrs-root
                                     dist-names abs-separate abs-fs-fix
                                     assoc-equal-of-frame-with-root
                                     hifat-no-dups-p
                                     hifat-place-file hifat-find-file
                                     (:rewrite abs-pwrite-correctness-lemma-25))
                           nil))))

(defthm
  abs-pwrite-correctness-lemma-70
  (implies
   (and
    (not
     (member-equal (find-new-index (strip-cars frame))
                   (abs-addrs (frame-val->dir (cdr (assoc-equal 0 frame))))))
    (m1-regular-file-p
     (cdr
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (mv-nth
        0
        (abs-alloc
         (frame-val->dir (cdr (assoc-equal 0 frame)))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
         (find-new-index (strip-cars frame))))))))
   (not
    (equal
     (mv-nth
      1
      (abs-alloc
       (frame-val->dir$inline (cdr (assoc-equal 0 frame)))
       (dirname (file-table-element->fid$inline
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (find-new-index (strip-cars frame))))
     (frame-val->dir$inline (cdr (assoc-equal 0 frame))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d (frame-reps-fs good-frame-p
                        abs-pwrite frame->frame-of-put-assoc
                        collapse collapse-this
                        1st-complete frame-addrs-root
                        dist-names abs-separate abs-fs-fix
                        assoc-equal-of-frame-with-root
                        hifat-no-dups-p
                        hifat-place-file hifat-find-file)
         ((:rewrite collapse-hifat-place-file-lemma-6)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 2)
          (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
          (:rewrite len-when-prefixp)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 3)
          (:rewrite abs-lstat-refinement-lemma-1)
          (:rewrite abs-fs-p-of-ctx-app)
          (:rewrite partial-collapse-correctness-lemma-2)
          (:type-prescription assoc-when-zp-len)
          (:rewrite abs-addrs-when-m1-file-contents-p)
          (:rewrite final-val-seq-of-collapse-this-lemma-2)
          (:rewrite ctx-app-when-not-ctx-app-ok)
          (:rewrite abs-mkdir-correctness-lemma-73)
          (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
          (:rewrite assoc-after-remove-assoc)
          (:definition nth)
          (:definition put-assoc-equal)
          (:rewrite insert-text-correctness-4))))))

(defthm
  abs-pwrite-correctness-lemma-48
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-regular-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))
   (equal
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
      (mv-nth
       0
       (hifat-find-file
        (mv-nth 0 (collapse frame))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
    (mv-nth 0 (collapse frame))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (enable hifat-place-file)
    :use
    ((:instance (:rewrite hifat-place-file-no-change-loser)
                (path (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
                (fs (mv-nth 0 (collapse frame)))
                (file (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                               (implode (insert-text nil offset buf)))))
     (:instance (:rewrite abs-pwrite-correctness-lemma-1)
                (path (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
                (fs (mv-nth 0 (collapse frame)))
                (file (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                               (implode (insert-text nil offset buf)))))))))

(defthm
  abs-pwrite-correctness-lemma-97
  (implies
   (and
    (equal
     '(((d-e 0 0 0 0 0 0 0 0 0 0 0 0
                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
        (contents))
       2)
     (hifat-find-file
      (mv-nth
       0
       (collapse
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))))
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame))))
   (not
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (frame-val->dir
       (cdr
        (assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))))
  :instructions
  ((:casesplit
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth
        0
        (collapse
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0))
   :bash :contrapose (:dive 1 2 1)
   (:rewrite (:rewrite partial-collapse-correctness-1 . 2))
   :top :bash))

(defthm
  abs-pwrite-correctness-lemma-98
  (implies
   (and
    (equal
     (len
      (frame-val->path
       (cdr
        (assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         frame))))
     (+ -1
        (len (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (no-duplicatesp-equal (strip-cars frame))
    (consp (assoc-equal 0 frame)))
   (list-equiv
    (frame-val->path
     (cdr
      (assoc-equal
       (abs-find-file-src
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       frame)))
    (dirname (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))
  :hints
  (("goal"
    :in-theory (disable (:rewrite path-clear-partial-collapse-when-zp-src-lemma-9 . 1))
    :use
    (:instance
     (:rewrite path-clear-partial-collapse-when-zp-src-lemma-9 . 1)
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-99
  (implies
   (and (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (no-duplicatesp-equal (strip-cars frame))
        (consp (assoc-equal 0 frame)))
   (prefixp
    (frame-val->path
     (cdr
      (assoc-equal
       (abs-find-file-src
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       frame)))
    (dirname (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))
  :hints
  (("goal"
    :in-theory (disable (:rewrite path-clear-partial-collapse-when-zp-src-lemma-9 . 1))
    :use
    (:instance
     (:rewrite path-clear-partial-collapse-when-zp-src-lemma-9 . 1)
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

;; This might be worth hanging on to.
(defthm
  abs-pwrite-correctness-lemma-27
  (implies
   (and
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (mv-nth '1 (collapse frame))
    (not (consp (frame-val->path$inline (cdr (assoc-equal '0 frame)))))
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth '0
                                 (hifat-find-file (mv-nth '0 (collapse frame))
                                                  path)))
    (fat32-filename-p name))
   (equal
    (m1-regular-file-p
     (cdr
      (assoc-equal
       name
       (m1-file->contents
        (mv-nth
         0
         (hifat-find-file (mv-nth '0
                                  (collapse (partial-collapse frame path)))
                          path))))))
    (m1-regular-file-p
     (cdr
      (assoc-equal name
                   (m1-file->contents
                    (mv-nth 0
                            (hifat-find-file (mv-nth '0 (collapse frame))
                                             path))))))))
  :hints
  (("goal"
    :in-theory (disable hifat-place-file-correctness-lemma-4)
    :use
    (:instance
     hifat-place-file-correctness-lemma-4
     (x
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file (mv-nth '0
                                 (collapse (partial-collapse frame path)))
                         path))))
     (y
      (m1-file->contents (mv-nth 0
                                 (hifat-find-file (mv-nth '0 (collapse frame))
                                                  path)))))
    :do-not-induct t)))

(defthm abs-pwrite-correctness-lemma-29
  (implies (and (fat32-filename-p name)
                (m1-directory-file-p (cdr (assoc-equal name y)))
                (hifat-subsetp y x))
           (m1-directory-file-p (cdr (assoc-equal name x))))
  :hints (("goal" :in-theory (enable hifat-subsetp))))

(defthm abs-pwrite-correctness-lemma-35
  (implies
   (hifat-equiv x y)
   (equal (m1-directory-file-p (cdr (assoc-equal (fat32-filename-fix name)
                                                 (hifat-file-alist-fix x))))
          (m1-directory-file-p (cdr (assoc-equal (fat32-filename-fix name)
                                                 (hifat-file-alist-fix y))))))
  :hints (("goal" :do-not-induct t
           :in-theory (e/d (hifat-equiv)
                           (abs-pwrite-correctness-lemma-29))
           :use ((:instance abs-pwrite-correctness-lemma-29
                            (name (fat32-filename-fix name))
                            (x (hifat-file-alist-fix x))
                            (y (hifat-file-alist-fix y)))
                 (:instance abs-pwrite-correctness-lemma-29
                            (name (fat32-filename-fix name))
                            (x (hifat-file-alist-fix y))
                            (y (hifat-file-alist-fix x))))))
  :rule-classes :congruence)

(defthm
  abs-pwrite-correctness-lemma-31
  (implies
   (and
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (mv-nth '1 (collapse frame))
    (not (consp (frame-val->path$inline (cdr (assoc-equal '0 frame)))))
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth '0
                                 (hifat-find-file (mv-nth '0 (collapse frame))
                                                  path)))
    (fat32-filename-p name))
   (equal
    (m1-directory-file-p
     (cdr
      (assoc-equal
       name
       (m1-file->contents
        (mv-nth
         0
         (hifat-find-file (mv-nth '0
                                  (collapse (partial-collapse frame path)))
                          path))))))
    (m1-directory-file-p
     (cdr
      (assoc-equal name
                   (m1-file->contents
                    (mv-nth 0
                            (hifat-find-file (mv-nth '0 (collapse frame))
                                             path))))))))
  :hints
  (("goal"
    :in-theory (disable abs-pwrite-correctness-lemma-35)
    :use
    (:instance
     abs-pwrite-correctness-lemma-35
     (x
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file (mv-nth '0
                                 (collapse (partial-collapse frame path)))
                         path))))
     (y
      (m1-file->contents (mv-nth 0
                                 (hifat-find-file (mv-nth '0 (collapse frame))
                                                  path)))))
    :do-not-induct t)))

(defthm abs-pwrite-correctness-lemma-34
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (equal
     0
     (abs-find-file-src
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (equal (frame-val->src$inline (cdr (assoc-equal 0 frame)))
           0))
   (member-equal
    (basename (file-table-element->fid
               (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                 file-table))))
    (names-at
     (frame-val->dir
      (cdr
       (assoc-equal
        0
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
     (dirname (file-table-element->fid
               (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                 file-table)))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d ((:rewrite member-of-names-at))
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm abs-pwrite-correctness-lemma-85
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (member-equal "           "
                  (names-at (mv-nth 0 (collapse frame))
                            nil))
    (not (m1-regular-file-p
          (cdr (assoc-equal "           "
                            (mv-nth 0
                                    (abs-alloc (mv-nth 0 (collapse frame))
                                               nil 1)))))))
   (m1-directory-file-p
    (cdr (assoc-equal "           "
                      (mv-nth 0
                              (abs-alloc (mv-nth 0 (collapse frame))
                                         nil 1))))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable abs-alloc names-at))))

(defthm
  abs-pwrite-correctness-lemma-60
  (ctx-app-ok (mv-nth 1
                      (abs-alloc (mv-nth 0 (collapse frame))
                                 nil 1))
              1 nil)
  :hints (("goal" :in-theory (enable ctx-app-ok abs-alloc))))

(defthm abs-pwrite-correctness-lemma-77
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not
     (consp (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))
   (ctx-app-ok
    '(1)
    1
    (dirname (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d (frame-reps-fs good-frame-p
                        abs-pwrite frame->frame-of-put-assoc
                        collapse collapse-this
                        1st-complete frame-addrs-root
                        dist-names abs-separate abs-fs-fix
                        assoc-equal-of-frame-with-root
                        hifat-no-dups-p
                        hifat-place-file hifat-find-file
                        abs-alloc ctx-app-ok addrs-at)
         ((:rewrite collapse-hifat-place-file-lemma-6)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 2)
          (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
          (:rewrite len-when-prefixp)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 3)
          (:rewrite abs-lstat-refinement-lemma-1)
          (:rewrite abs-fs-p-of-ctx-app)
          (:rewrite partial-collapse-correctness-lemma-2)
          (:type-prescription assoc-when-zp-len)
          (:rewrite abs-addrs-when-m1-file-contents-p)
          (:rewrite final-val-seq-of-collapse-this-lemma-2)
          (:rewrite ctx-app-when-not-ctx-app-ok)
          (:rewrite abs-mkdir-correctness-lemma-73)
          (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
          (:rewrite assoc-after-remove-assoc)
          (:definition nth)
          (:definition put-assoc-equal)
          (:rewrite insert-text-correctness-4)
          (:rewrite m1-file-alist-p-of-cdr-when-m1-file-alist-p)
          (:rewrite no-duplicatesp-of-strip-cars-when-hifat-no-dups-p)
          (:rewrite subsetp-car-member)
          (:definition len)
          (:rewrite hifat-no-dups-p-of-cdr)
          (:rewrite m1-file-alist-p-when-not-consp)
          (:rewrite abs-alloc-correctness-1)
          (:rewrite ctx-app-ok-when-abs-complete)
          (:linear len-when-hifat-bounded-file-alist-p . 2)
          (:rewrite abs-addrs-of-put-assoc-lemma-1)
          (:rewrite hifat-subsetp-reflexive-lemma-3))))))

(defthm abs-pwrite-correctness-lemma-67
  (implies (natp n)
           (equal (abs-fs-fix (list n)) (list n)))
  :hints (("goal" :in-theory (enable abs-fs-fix))))

;; Consider removing afterwards.
(defthmd
  abs-pwrite-correctness-lemma-94
  (implies
   (and (mv-nth 1 (collapse frame))
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (consp path)
        (not (consp (dirname path))))
   (hifat-equiv
    (put-assoc-equal
     (basename path)
     (m1-file
      (m1-file->d-e (cdr (assoc-equal (basename path)
                                          (mv-nth 0 (collapse frame)))))
      (implode
       (insert-text
        (explode
         (m1-file->contents (cdr (assoc-equal (basename path)
                                              (mv-nth 0 (collapse frame))))))
        offset buf)))
     (mv-nth 0 (collapse frame)))
    (put-assoc-equal
     (basename path)
     (m1-file
      (m1-file->d-e (mv-nth 0
                                (hifat-find-file (mv-nth 0 (collapse frame))
                                                 path)))
      (implode
       (insert-text
        (explode (m1-file->contents
                  (mv-nth 0
                          (hifat-find-file (mv-nth 0 (collapse frame))
                                           path))))
        offset buf)))
     (mv-nth 0 (collapse frame)))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d (frame-reps-fs good-frame-p
                                   abs-pwrite frame->frame-of-put-assoc
                                   collapse collapse-this
                                   1st-complete frame-addrs-root
                                   dist-names abs-separate abs-fs-fix
                                   assoc-equal-of-frame-with-root
                                   hifat-no-dups-p hifat-place-file
                                   hifat-find-file abs-alloc ctx-app
                                   abs-fs-fix abs-addrs basename dirname)
                    ()))))

(defthm
  abs-pwrite-correctness-lemma-74
  (implies
   (and (not (consp (abs-addrs (frame->root frame))))
        (not (consp (dirname path)))
        (m1-regular-file-p (mv-nth 0
                                   (hifat-find-file (frame->root frame)
                                                    path))))
   (not
    (m1-directory-file-p
     (cdr (assoc-equal (basename path)
                       (frame-val->dir (cdr (assoc-equal 0 frame))))))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (collapse collapse-this
                              1st-complete frame-addrs-root
                              dist-names abs-separate abs-fs-fix
                              assoc-equal-of-frame-with-root
                              hifat-no-dups-p hifat-place-file
                              hifat-find-file abs-alloc
                              ctx-app abs-fs-fix abs-addrs basename
                              dirname frame->root abs-complete)
                    ())
    :expand ((len path) (len (cdr path))))))

(defthm abs-pwrite-correctness-lemma-81
  (implies
   (and
    (not (consp (abs-addrs (frame->root frame)))))
   (abs-complete
    (put-assoc-equal
     (basename (file-table-element->fid$inline
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
     (m1-file
      (m1-file->d-e$inline
       (cdr
        (assoc-equal
         (basename (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (frame-val->dir$inline (cdr (assoc-equal 0 frame))))))
      (implode$inline
       (insert-text
        (explode$inline
         (m1-file->contents$inline
          (cdr
           (assoc-equal
            (basename (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (frame-val->dir$inline (cdr (assoc-equal 0 frame)))))))
        offset buf)))
     (frame-val->dir$inline (cdr (assoc-equal 0 frame))))))
 :hints
 (("goal"
   :do-not-induct t
   :in-theory
   (e/d (frame-reps-fs good-frame-p
                       abs-pwrite frame->frame-of-put-assoc
                       collapse collapse-this
                       1st-complete frame-addrs-root
                       dist-names abs-separate abs-fs-fix
                       assoc-equal-of-frame-with-root
                       hifat-no-dups-p
                       hifat-place-file hifat-find-file
                       abs-alloc ctx-app abs-fs-fix
                       abs-addrs abs-complete frame->root)
        ((:rewrite collapse-hifat-place-file-lemma-6)
         (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                   . 2)
         (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
         (:rewrite len-when-prefixp)
         (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                   . 3)
         (:rewrite abs-lstat-refinement-lemma-1)
         (:rewrite abs-fs-p-of-ctx-app)
         (:rewrite partial-collapse-correctness-lemma-2)
         (:type-prescription assoc-when-zp-len)
         (:rewrite abs-addrs-when-m1-file-contents-p)
         (:rewrite final-val-seq-of-collapse-this-lemma-2)
         (:rewrite ctx-app-when-not-ctx-app-ok)
         (:rewrite abs-mkdir-correctness-lemma-73)
         (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
         (:rewrite assoc-after-remove-assoc)
         (:definition nth)
         (:definition put-assoc-equal)
         (:rewrite insert-text-correctness-4)
         (:rewrite m1-file-alist-p-of-cdr-when-m1-file-alist-p)
         (:rewrite no-duplicatesp-of-strip-cars-when-hifat-no-dups-p)
         (:rewrite subsetp-car-member)
         (:definition len)
         (:rewrite hifat-no-dups-p-of-cdr)
         (:rewrite m1-file-alist-p-when-not-consp)
         (:rewrite abs-alloc-correctness-1)
         (:rewrite ctx-app-ok-when-abs-complete)
         (:linear len-when-hifat-bounded-file-alist-p . 2)
         (:rewrite abs-addrs-of-put-assoc-lemma-1)
         (:rewrite hifat-subsetp-reflexive-lemma-3))))))

(defthm abs-pwrite-correctness-lemma-79
 (implies
  (and
   (not
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))
  (ctx-app-ok
   (list (find-new-index (strip-cars frame)))
   (find-new-index (strip-cars frame))
   (dirname (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))))
 :hints
 (("goal"
   :do-not-induct t
   :in-theory
   (e/d (frame-reps-fs good-frame-p
                       abs-pwrite frame->frame-of-put-assoc
                       collapse collapse-this
                       1st-complete frame-addrs-root
                       dist-names abs-separate abs-fs-fix
                       assoc-equal-of-frame-with-root
                       hifat-no-dups-p
                       hifat-place-file hifat-find-file
                       abs-alloc ctx-app abs-fs-fix
                       abs-addrs ctx-app-ok addrs-at)
        ((:rewrite collapse-hifat-place-file-lemma-6)
         (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                   . 2)
         (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
         (:rewrite len-when-prefixp)
         (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                   . 3)
         (:rewrite abs-lstat-refinement-lemma-1)
         (:rewrite abs-fs-p-of-ctx-app)
         (:rewrite partial-collapse-correctness-lemma-2)
         (:type-prescription assoc-when-zp-len)
         (:rewrite abs-addrs-when-m1-file-contents-p)
         (:rewrite final-val-seq-of-collapse-this-lemma-2)
         (:rewrite ctx-app-when-not-ctx-app-ok)
         (:rewrite abs-mkdir-correctness-lemma-73)
         (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
         (:rewrite assoc-after-remove-assoc)
         (:definition nth)
         (:definition put-assoc-equal)
         (:rewrite insert-text-correctness-4)
         (:rewrite m1-file-alist-p-of-cdr-when-m1-file-alist-p)
         (:rewrite no-duplicatesp-of-strip-cars-when-hifat-no-dups-p)
         (:rewrite subsetp-car-member)
         (:definition len)
         (:rewrite hifat-no-dups-p-of-cdr)
         (:rewrite m1-file-alist-p-when-not-consp)
         (:rewrite abs-alloc-correctness-1)
         (:rewrite ctx-app-ok-when-abs-complete)
         (:linear len-when-hifat-bounded-file-alist-p . 2)
         (:rewrite abs-addrs-of-put-assoc-lemma-1)
         (:rewrite hifat-subsetp-reflexive-lemma-3))))))

(defthm abs-pwrite-correctness-lemma-80
  (implies
   (and
    (not (consp (abs-addrs (frame->root frame))))
    (not
     (consp (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (frame-val->dir (cdr (assoc-equal 0 frame)))))
    (m1-regular-file-p
     (mv-nth
      0
      (hifat-find-file (frame->root frame)
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))))
   (m1-regular-file-p
    (cdr
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (frame-val->dir (cdr (assoc-equal 0 frame)))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d (frame-reps-fs good-frame-p
                        abs-pwrite frame->frame-of-put-assoc
                        collapse collapse-this
                        1st-complete frame-addrs-root
                        dist-names abs-separate abs-fs-fix
                        assoc-equal-of-frame-with-root
                        hifat-no-dups-p
                        hifat-place-file hifat-find-file
                        abs-alloc ctx-app abs-fs-fix
                        abs-addrs abs-complete frame->root)
         ((:rewrite collapse-hifat-place-file-lemma-6)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 2)
          (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
          (:rewrite len-when-prefixp)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 3)
          (:rewrite abs-lstat-refinement-lemma-1)
          (:rewrite abs-fs-p-of-ctx-app)
          (:rewrite partial-collapse-correctness-lemma-2)
          (:type-prescription assoc-when-zp-len)
          (:rewrite abs-addrs-when-m1-file-contents-p)
          (:rewrite final-val-seq-of-collapse-this-lemma-2)
          (:rewrite ctx-app-when-not-ctx-app-ok)
          (:rewrite abs-mkdir-correctness-lemma-73)
          (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
          (:rewrite assoc-after-remove-assoc)
          (:definition nth)
          (:definition put-assoc-equal)
          (:rewrite insert-text-correctness-4)
          (:rewrite m1-file-alist-p-of-cdr-when-m1-file-alist-p)
          (:rewrite no-duplicatesp-of-strip-cars-when-hifat-no-dups-p)
          (:rewrite subsetp-car-member)
          (:definition len)
          (:rewrite hifat-no-dups-p-of-cdr)
          (:rewrite m1-file-alist-p-when-not-consp)
          (:rewrite abs-alloc-correctness-1)
          (:rewrite ctx-app-ok-when-abs-complete)
          (:linear len-when-hifat-bounded-file-alist-p . 2)
          (:rewrite abs-addrs-of-put-assoc-lemma-1)
          (:rewrite hifat-subsetp-reflexive-lemma-3))))))

(defthm
  abs-pwrite-correctness-lemma-82
  (implies
   (and (not (consp (abs-addrs (frame->root frame))))
        (not (consp (dirname path)))
        (m1-regular-file-p (mv-nth 0
                                   (hifat-find-file (frame->root frame)
                                                    path))))
   (hifat-equiv
    (put-assoc-equal
     (basename path)
     (m1-file
      (m1-file->d-e
       (cdr (assoc-equal (basename path)
                         (frame-val->dir (cdr (assoc-equal 0 frame))))))
      (implode
       (insert-text
        (explode
         (m1-file->contents
          (cdr (assoc-equal (basename path)
                            (frame-val->dir (cdr (assoc-equal 0 frame)))))))
        offset buf)))
     (frame-val->dir (cdr (assoc-equal 0 frame))))
    (mv-nth
     0
     (hifat-place-file
      (frame->root frame)
      path
      (m1-file
       (m1-file->d-e (mv-nth 0
                                 (hifat-find-file (frame->root frame)
                                                  path)))
       (implode
        (insert-text
         (explode
          (m1-file->contents (mv-nth 0
                                     (hifat-find-file (frame->root frame)
                                                      path))))
         offset buf)))))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (collapse collapse-this
                              1st-complete frame-addrs-root
                              dist-names abs-separate abs-fs-fix
                              assoc-equal-of-frame-with-root
                              hifat-no-dups-p hifat-place-file
                              hifat-find-file abs-alloc
                              ctx-app abs-fs-fix abs-addrs dirname
                              basename frame->root abs-complete)
                    ())
    :expand ((len path) (len (cdr path))))))

(defthmd
  abs-pwrite-correctness-lemma-55
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp path)
    (not (consp (dirname path)))
    (m1-regular-file-p (mv-nth 0
                               (hifat-find-file (mv-nth 0 (collapse frame))
                                                path))))
   (consp (assoc-equal (basename path)
                       (mv-nth 0 (collapse frame)))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (collapse collapse-this
                              1st-complete frame-addrs-root
                              dist-names abs-separate abs-fs-fix
                              assoc-equal-of-frame-with-root
                              hifat-no-dups-p hifat-place-file
                              hifat-find-file abs-alloc ctx-app
                              abs-fs-fix abs-addrs basename dirname)
                    ()))))

(defthm
  abs-pwrite-correctness-lemma-84
  (implies
   (and (not (consp (abs-addrs (frame->root frame))))
        (consp path)
        (not (consp (dirname path)))
        (not (equal (mv-nth 1
                            (hifat-find-file (frame->root frame)
                                             path))
                    0)))
   (hifat-equiv
    (put-assoc-equal (basename path)
                     (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (implode (insert-text nil offset buf)))
                     (frame-val->dir (cdr (assoc-equal 0 frame))))
    (mv-nth
     0
     (hifat-place-file (frame->root frame)
                       path
                       (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                (implode (insert-text nil offset buf)))))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (collapse collapse-this
                              1st-complete frame-addrs-root
                              dist-names abs-separate abs-fs-fix
                              assoc-equal-of-frame-with-root
                              hifat-no-dups-p hifat-place-file
                              hifat-find-file abs-alloc
                              ctx-app abs-fs-fix abs-addrs basename
                              dirname frame->root abs-complete)
                    ())
    :expand ((len path) (len (cdr path))))))

(defthm
  abs-pwrite-correctness-lemma-95
  (implies
   (and
    (not (consp (abs-addrs (frame->root frame))))
    (consp path)
    (not (consp (dirname path)))
    (not (consp (assoc-equal (basename path)
                             (frame-val->dir (cdr (assoc-equal 0 frame)))))))
   (hifat-equiv
    (put-assoc-equal (basename path)
                     (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                              (implode (insert-text nil offset buf)))
                     (frame-val->dir (cdr (assoc-equal 0 frame))))
    (mv-nth
     0
     (hifat-place-file (frame->root frame)
                       path
                       (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                (implode (insert-text nil offset buf)))))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (collapse collapse-this
                              1st-complete frame-addrs-root
                              dist-names abs-separate abs-fs-fix
                              assoc-equal-of-frame-with-root
                              hifat-no-dups-p hifat-place-file
                              hifat-find-file abs-alloc
                              ctx-app abs-fs-fix abs-addrs basename
                              dirname abs-complete frame->root)
                    ())
    :expand ((len (cdr path)) (len path)))))

(defthm
  abs-pwrite-correctness-lemma-101
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp path)
    (not (consp (dirname path)))
    (consp (assoc-equal (basename path)
                        (mv-nth 0 (collapse frame))))
    (not
     (m1-regular-file-p (mv-nth 0
                                (hifat-find-file (mv-nth 0 (collapse frame))
                                                 path)))))
   (m1-directory-file-p (cdr (assoc-equal (basename path)
                                          (mv-nth 0 (collapse frame))))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (collapse collapse-this
                              1st-complete frame-addrs-root
                              dist-names abs-separate abs-fs-fix
                              assoc-equal-of-frame-with-root
                              hifat-no-dups-p hifat-place-file
                              hifat-find-file abs-alloc
                              ctx-app abs-fs-fix abs-addrs basename
                              dirname abs-complete frame->root)
                    ()))))

(defthm
  abs-pwrite-correctness-lemma-68
  (implies
   (and (not (consp (abs-addrs (frame->root frame))))
        (not (consp (dirname path)))
        (consp (assoc-equal (basename path)
                            (frame-val->dir (cdr (assoc-equal 0 frame)))))
        (not (m1-regular-file-p (mv-nth 0
                                        (hifat-find-file (frame->root frame)
                                                         path)))))
   (absfat-equiv
    (mv-nth
     0
     (hifat-place-file (frame->root frame)
                       path
                       (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                (implode (insert-text nil offset buf)))))
    (frame->root frame)))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (collapse collapse-this
                              1st-complete frame-addrs-root
                              dist-names abs-separate abs-fs-fix
                              assoc-equal-of-frame-with-root
                              hifat-no-dups-p hifat-place-file
                              hifat-find-file abs-alloc
                              ctx-app abs-fs-fix abs-addrs basename
                              dirname abs-complete frame->root)
                    ())
    :expand ((len (cdr path)) (len path)))))

(defthm
  abs-pwrite-correctness-lemma-104
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (assoc-equal 0 frame))
    (m1-regular-file-p
     (cdr
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (mv-nth
        0
        (abs-alloc
         (frame-val->dir
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
         (nthcdr
          (len
           (frame-val->path
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              frame))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (find-new-index
          (strip-cars
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (equal
    (put-assoc-equal
     (basename (file-table-element->fid$inline
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
     (m1-file
      (m1-file->d-e$inline
       (cdr
        (assoc-equal
         (basename (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (mv-nth
          0
          (abs-alloc
           (frame-val->dir$inline
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (dirname (file-table-element->fid$inline
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (partial-collapse
               frame
               (dirname (file-table-element->fid$inline
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))
           (nthcdr
            (len
             (frame-val->path$inline
              (cdr
               (assoc-equal
                (abs-find-file-src
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (dirname
                  (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                frame))))
            (dirname (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (find-new-index
            (strip-cars
             (partial-collapse
              frame
              (dirname (file-table-element->fid$inline
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))))))))))
      (implode$inline
       (insert-text
        (explode$inline
         (m1-file->contents$inline
          (cdr
           (assoc-equal
            (basename (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))
            (mv-nth
             0
             (abs-alloc
              (frame-val->dir$inline
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (dirname
                   (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
              (nthcdr
               (len
                (frame-val->path$inline
                 (cdr
                  (assoc-equal
                   (abs-find-file-src
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (dirname
                     (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   frame))))
               (dirname (file-table-element->fid$inline
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (find-new-index
               (strip-cars
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))))))
        offset buf)))
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir$inline
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (partial-collapse
           frame
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (nthcdr
        (len
         (frame-val->path$inline
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid$inline
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir$inline
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (partial-collapse
            frame
            (dirname (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
        (nthcdr
         (len
          (frame-val->path$inline
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid$inline
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid$inline
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (dirname (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (find-new-index
         (strip-cars
          (partial-collapse
           frame
           (dirname (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))
      (list (basename (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
      (m1-file
       (m1-file->d-e$inline
        (cdr
         (assoc-equal
          (basename (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))
          (mv-nth
           0
           (abs-alloc
            (frame-val->dir$inline
             (cdr
              (assoc-equal
               (abs-find-file-src
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid$inline
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (dirname
                 (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
            (nthcdr
             (len
              (frame-val->path$inline
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (dirname
                   (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 frame))))
             (dirname (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (find-new-index
             (strip-cars
              (partial-collapse
               frame
               (dirname (file-table-element->fid$inline
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))))))
       (implode$inline
        (insert-text
         (explode$inline
          (m1-file->contents$inline
           (cdr
            (assoc-equal
             (basename (file-table-element->fid$inline
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))
             (mv-nth
              0
              (abs-alloc
               (frame-val->dir$inline
                (cdr
                 (assoc-equal
                  (abs-find-file-src
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid$inline
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   (dirname
                    (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid$inline
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
               (nthcdr
                (len
                 (frame-val->path$inline
                  (cdr
                   (assoc-equal
                    (abs-find-file-src
                     (partial-collapse
                      frame
                      (dirname
                       (file-table-element->fid$inline
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     (dirname
                      (file-table-element->fid$inline
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    frame))))
                (dirname
                 (file-table-element->fid$inline
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (find-new-index
                (strip-cars
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid$inline
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))))
         offset buf)))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d (frame-reps-fs good-frame-p
                        abs-pwrite frame->frame-of-put-assoc
                        collapse collapse-this
                        1st-complete frame-addrs-root
                        dist-names abs-separate abs-fs-fix
                        assoc-equal-of-frame-with-root
                        hifat-no-dups-p
                        hifat-place-file hifat-find-file
                        abs-alloc ctx-app abs-fs-fix abs-addrs)
         ((:rewrite collapse-hifat-place-file-lemma-6)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 2)
          (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
          (:rewrite len-when-prefixp)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 3)
          (:rewrite abs-lstat-refinement-lemma-1)
          (:rewrite abs-fs-p-of-ctx-app)
          (:rewrite partial-collapse-correctness-lemma-2)
          (:type-prescription assoc-when-zp-len)
          (:rewrite abs-addrs-when-m1-file-contents-p)
          (:rewrite final-val-seq-of-collapse-this-lemma-2)
          (:rewrite ctx-app-when-not-ctx-app-ok)
          (:rewrite abs-mkdir-correctness-lemma-73)
          (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
          (:rewrite assoc-after-remove-assoc)
          (:definition nth)
          (:definition put-assoc-equal)
          (:rewrite insert-text-correctness-4)
          (:rewrite m1-file-alist-p-of-cdr-when-m1-file-alist-p)
          (:rewrite no-duplicatesp-of-strip-cars-when-hifat-no-dups-p)
          (:rewrite subsetp-car-member)
          (:definition len)
          (:rewrite hifat-no-dups-p-of-cdr)
          (:rewrite m1-file-alist-p-when-not-consp)
          (:rewrite abs-alloc-correctness-1)
          (:rewrite ctx-app-ok-when-abs-complete)
          (:linear len-when-hifat-bounded-file-alist-p . 2)
          (:rewrite abs-addrs-of-put-assoc-lemma-1)
          (:rewrite hifat-subsetp-reflexive-lemma-3))))))

(defthmd
  abs-pwrite-correctness-lemma-4
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (not
     (consp
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (m1-file->contents
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    (m1-directory-file-p
     (cdr
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (mv-nth
        0
        (abs-alloc
         (frame-val->dir
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
         (nthcdr
          (len
           (frame-val->path
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              frame))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (find-new-index
          (strip-cars
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))))))))))
   (not
    (member-equal
     (basename (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))
     (names-at
      (frame-val->dir
       (cdr
        (assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))
      (nthcdr
       (len
        (frame-val->path
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           frame))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))))
  :hints
  (("goal"
    :in-theory (e/d (member-of-names-at)
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path
      (nthcdr
       (len
        (frame-val->path
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           frame))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-18
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (file-table-element->fid
            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (not
     (consp
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (m1-file->contents
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    (not
     (m1-regular-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (mv-nth
         0
         (abs-alloc
          (frame-val->dir
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table))))))))
          (nthcdr
           (len
            (frame-val->path
             (cdr
              (assoc-equal
               (abs-find-file-src
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               frame))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (find-new-index
           (strip-cars
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))))))))))
    (not
     (equal
      0
      (abs-find-file-src
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   (and
    (absfat-equiv
     (mv-nth
      0
      (collapse
       (frame-with-root
        (frame->root
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))
        (put-assoc-equal
         (abs-find-file-src
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (frame-val
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame)))
          (mv-nth
           0
           (abs-place-file-helper
            (frame-val->dir
             (cdr
              (assoc-equal
               (abs-find-file-src
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))
            (nthcdr
             (len
              (frame-val->path
               (cdr
                (assoc-equal
                 (abs-find-file-src
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 frame))))
             (file-table-element->fid
              (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                file-table))))
            (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                     (implode (insert-text nil offset buf)))))
          (frame-val->src
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (frame->frame
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))
     (mv-nth
      0
      (hifat-place-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
       (m1-file
        (m1-file->d-e
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))
        (put-assoc-equal
         (basename (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))
         (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                  (implode (insert-text nil offset buf)))
         (m1-file->contents
          (mv-nth
           0
           (hifat-find-file
            (mv-nth 0 (collapse frame))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))))
    (mv-nth
     1
     (collapse
      (frame-with-root
       (frame->root
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))
       (put-assoc-equal
        (abs-find-file-src
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (frame-val
         (frame-val->path
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame)))
         (mv-nth
          0
          (abs-place-file-helper
           (frame-val->dir
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))))))
           (nthcdr
            (len
             (frame-val->path
              (cdr
               (assoc-equal
                (abs-find-file-src
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                frame))))
            (file-table-element->fid
             (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                               file-table))))
           (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                    (implode (insert-text nil offset buf)))))
         (frame-val->src
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (frame->frame
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d (frame-reps-fs good-frame-p
                        abs-pwrite frame->frame-of-put-assoc
                        collapse collapse-this
                        1st-complete frame-addrs-root
                        dist-names abs-separate abs-fs-fix
                        assoc-equal-of-frame-with-root
                        hifat-no-dups-p
                        hifat-place-file hifat-find-file
                        assoc-of-frame->frame
                        len-of-insert-text
                        abs-pwrite-correctness-lemma-4)
         ((:rewrite collapse-hifat-place-file-lemma-6)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 2)
          (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
          (:rewrite len-when-prefixp)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 3)
          (:rewrite abs-lstat-refinement-lemma-1)
          (:rewrite abs-fs-p-of-ctx-app)
          (:rewrite partial-collapse-correctness-lemma-2)
          (:type-prescription assoc-when-zp-len)
          (:rewrite abs-addrs-when-m1-file-contents-p)
          (:rewrite final-val-seq-of-collapse-this-lemma-2)
          (:rewrite ctx-app-when-not-ctx-app-ok)
          (:rewrite abs-mkdir-correctness-lemma-73)
          (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
          (:rewrite assoc-after-remove-assoc)
          (:definition nth)
          (:definition put-assoc-equal)
          (:rewrite insert-text-correctness-4)
          collapse-hifat-place-file-2))
    :expand
    ((:with abs-pwrite-correctness-lemma-1
            (:free (file)
                   (hifat-place-file
                    (mv-nth 0 (collapse frame))
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))
                    file))))
    :use
    ((:instance
      collapse-hifat-place-file-2
      (root
       (frame->root
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))
      (frame
       (frame->frame
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))
      (x
       (abs-find-file-src
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))
      (path
       (append
        (nthcdr
         (len
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (list (basename (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))))
      (file
       (m1-file
        (m1-file->d-e
         (cdr
          (assoc-equal
           (basename (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))
           (mv-nth
            0
            (abs-alloc
             (frame-val->dir
              (cdr
               (assoc-equal
                (abs-find-file-src
                 (partial-collapse
                  frame
                  (dirname
                   (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (partial-collapse
                 frame
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
             (nthcdr
              (len
               (frame-val->path
                (cdr
                 (assoc-equal
                  (abs-find-file-src
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
                  frame))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (find-new-index
              (strip-cars
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))))))))
        (implode
         (insert-text
          (explode
           (m1-file->contents
            (cdr
             (assoc-equal
              (basename (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table))))
              (mv-nth
               0
               (abs-alloc
                (frame-val->dir
                 (cdr
                  (assoc-equal
                   (abs-find-file-src
                    (partial-collapse
                     frame
                     (dirname
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
                   (partial-collapse
                    frame
                    (dirname
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
                (nthcdr
                 (len
                  (frame-val->path
                   (cdr
                    (assoc-equal
                     (abs-find-file-src
                      (partial-collapse
                       frame
                       (dirname
                        (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
                      (dirname
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
                     frame))))
                 (dirname
                  (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
                (find-new-index
                 (strip-cars
                  (partial-collapse
                   frame
                   (dirname
                    (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
          offset buf)))))))))

(defthm abs-pwrite-correctness-lemma-41
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (not
     (m1-regular-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))
   (not
    (m1-regular-file-p
     (cdr
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (mv-nth
        0
        (abs-alloc
         (frame-val->dir
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table))))))))
         (nthcdr
          (len
           (frame-val->path
            (cdr
             (assoc-equal
              (abs-find-file-src
               (partial-collapse
                frame
                (dirname
                 (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              frame))))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (find-new-index
          (strip-cars
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))))))))
  :hints
  (("goal"
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (nthcdr
        (len
         (frame-val->path
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    :in-theory (e/d nil
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path
      (nthcdr
       (len
        (frame-val->path
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           frame))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-56
  (implies
   (and
    (not (consp (dirname path)))
    (not
     (equal
      (mv-nth
       1
       (hifat-place-file (frame->root frame)
                         path
                         (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                  (implode (insert-text nil offset buf)))))
      0)))
   (equal
    (mv-nth
     1
     (hifat-place-file (frame->root frame)
                       path
                       (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                (implode (insert-text nil offset buf)))))
    2))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (enable
                frame-reps-fs good-frame-p
                abs-pwrite frame->frame-of-put-assoc
                collapse collapse-this
                1st-complete frame-addrs-root
                dist-names abs-separate abs-fs-fix
                assoc-equal-of-frame-with-root
                hifat-no-dups-p hifat-place-file
                hifat-find-file abs-alloc ctx-app
                abs-fs-fix abs-addrs basename dirname
                path-clear-partial-collapse-when-zp-src-lemma-34)
    :expand ((len path) (len (cdr path))))))

(defthm
  abs-pwrite-correctness-lemma-42
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-place-file (frame->root frame)
                        path
                        (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                 (implode (insert-text nil offset buf)))))
     0)
    (not (consp (abs-addrs (frame->root frame))))
    (not (consp (dirname path)))
    (consp (assoc-equal (basename path)
                        (frame-val->dir (cdr (assoc-equal 0 frame))))))
   (m1-regular-file-p (mv-nth 0
                              (hifat-find-file (frame->root frame)
                                               path))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (collapse collapse-this
                              1st-complete frame-addrs-root
                              dist-names abs-separate abs-fs-fix
                              assoc-equal-of-frame-with-root
                              hifat-no-dups-p hifat-place-file
                              hifat-find-file abs-alloc
                              ctx-app abs-fs-fix abs-addrs basename
                              dirname frame->root abs-complete)
                    ())
    :expand ((len path)))))

(defthm abs-pwrite-correctness-lemma-58
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))))))
    (not
     (m1-regular-file-p
      (cdr
       (assoc-equal
        (basename (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0 (collapse frame))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))))))
   (m1-directory-file-p
    (cdr
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
        (nthcdr
         (len
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname
                (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))
              (dirname
               (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table)))))
             frame))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (find-new-index
         (strip-cars
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
  :hints
  (("goal"
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (nthcdr
        (len
         (frame-val->path
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    :in-theory (e/d nil
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path
      (nthcdr
       (len
        (frame-val->path
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           frame))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-66
  (implies
   (and
    (not (consp (abs-addrs (frame->root frame))))
    (consp path)
    (not (consp (dirname path)))
    (not (consp (assoc-equal (basename path)
                             (frame-val->dir (cdr (assoc-equal 0 frame)))))))
   (equal
    (mv-nth
     1
     (hifat-place-file (frame->root frame)
                       path
                       (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                (implode (insert-text nil offset buf)))))
    0))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (collapse collapse-this
                              1st-complete frame-addrs-root
                              dist-names abs-separate abs-fs-fix
                              assoc-equal-of-frame-with-root
                              hifat-no-dups-p hifat-place-file
                              hifat-find-file abs-alloc
                              ctx-app abs-fs-fix abs-addrs basename
                              dirname frame->root abs-complete)
                    ())
    :expand ((len path) (len (cdr path))))))

(defthm
  abs-pwrite-correctness-lemma-62
  (implies
   (and
    (equal
     (mv-nth
      1
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (file-table-element->fid
            (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                              file-table))))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (consp
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (m1-file->contents
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))))
   (member-equal
    (basename (file-table-element->fid
               (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                 file-table))))
    (names-at
     (frame-val->dir
      (cdr
       (assoc-equal
        (abs-find-file-src
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (partial-collapse
         frame
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
     (nthcdr
      (len
       (frame-val->path
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          frame))))
      (dirname (file-table-element->fid
                (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                  file-table))))))))
  :instructions
  ((:bash
    ("goal"
     :do-not-induct t
     :in-theory (e/d (member-of-names-at)
                     ((:rewrite abs-mkdir-correctness-lemma-85)))
     :use
     (:instance
      (:rewrite abs-mkdir-correctness-lemma-85)
      (x-path
       (nthcdr
        (len
         (frame-val->path
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))
      (path (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
      (frame
       (partial-collapse
        frame
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))))
   :demote
   (:casesplit
    (zp
     (mv-nth
      1
      (hifat-find-file
       (mv-nth
        0
        (collapse
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))
   :bash :contrapose (:dive 1 2 1)
   (:rewrite (:rewrite partial-collapse-correctness-1 . 2))
   :top :bash))

(defthm
  abs-pwrite-correctness-lemma-32
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file
       (mv-nth 0 (collapse frame))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table)))))))
    (equal
     (mv-nth
      1
      (hifat-find-file (mv-nth 0 (collapse frame))
                       (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
     0)
    (m1-regular-file-p
     (cdr
      (assoc-equal
       (basename (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))
       (m1-file->contents
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0 (collapse frame))
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table)))))))))))
   (m1-regular-file-p
    (cdr
     (assoc-equal
      (basename (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table))))))))
        (nthcdr
         (len
          (frame-val->path
           (cdr
            (assoc-equal
             (abs-find-file-src
              (partial-collapse
               frame
               (dirname (file-table-element->fid
                         (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                           file-table)))))
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             frame))))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table)))))
        (find-new-index
         (strip-cars
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))))))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d nil
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr
         (assoc-equal
          (abs-find-file-src
           (partial-collapse
            frame
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
          (partial-collapse
           frame
           (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table))))))))
       (nthcdr
        (len
         (frame-val->path
          (cdr
           (assoc-equal
            (abs-find-file-src
             (partial-collapse
              frame
              (dirname (file-table-element->fid
                        (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                          file-table)))))
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            frame))))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))
       (find-new-index
        (strip-cars
         (partial-collapse
          frame
          (dirname (file-table-element->fid
                    (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                      file-table))))))))))
    :use
    (:instance
     (:rewrite abs-mkdir-correctness-lemma-85)
     (x-path
      (nthcdr
       (len
        (frame-val->path
         (cdr
          (assoc-equal
           (abs-find-file-src
            (partial-collapse
             frame
             (dirname (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))))
            (dirname (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))))
           frame))))
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))
     (path (dirname (file-table-element->fid
                     (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                       file-table)))))
     (frame
      (partial-collapse
       frame
       (dirname (file-table-element->fid
                 (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                   file-table))))))))))

(defthm
  abs-pwrite-correctness-lemma-87
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (consp (dirname path))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    path))
           0)
    (m1-regular-file-p
     (cdr
      (assoc-equal
       (basename path)
       (m1-file->contents (mv-nth 0
                                  (hifat-find-file (mv-nth 0 (collapse frame))
                                                   (dirname path)))))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path))))
   (m1-regular-file-p
    (cdr
     (assoc-equal
      (basename path)
      (mv-nth
       0
       (abs-alloc
        (frame-val->dir
         (cdr (assoc-equal 0
                           (partial-collapse frame (dirname path)))))
        (dirname path)
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))))))
  :hints
  (("goal"
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    :in-theory (e/d nil
                    ((:rewrite abs-mkdir-correctness-lemma-85)))
    :use (:instance (:rewrite abs-mkdir-correctness-lemma-85)
                    (x-path (dirname path))
                    (path (dirname path))
                    (frame (partial-collapse frame (dirname path)))))))

(defthm
  abs-mkdir-correctness-lemma-222
  (implies (and (consp (assoc-equal name (abs-file->contents file)))
                (abs-complete (abs-file->contents file)))
           (consp (assoc-equal name (m1-file->contents file))))
  :hints (("goal" :in-theory (enable abs-file->contents
                                     m1-file->contents abs-file-contents-fix
                                     m1-file-contents-fix
                                     abs-file-contents-p m1-file-contents-p)
           :do-not-induct t)))

(defthm
  abs-mkdir-correctness-lemma-223
  (implies
   (and (consp path)
        (member-equal name (names-at fs path))
        (abs-complete
         (abs-file->contents (mv-nth 0 (abs-find-file-helper fs path)))))
   (consp
    (assoc-equal
     name
     (m1-file->contents (mv-nth 0 (abs-find-file-helper fs path))))))
  :hints (("goal" :in-theory (enable abs-find-file-helper names-at))))

(defthm
  abs-mkdir-correctness-lemma-228
  (implies (and (abs-directory-file-p file)
                (abs-complete (abs-file->contents file)))
           (m1-directory-file-p file))
  :hints (("goal" :do-not-induct t
           :in-theory (enable m1-directory-file-p abs-directory-file-p
                              abs-file-p m1-file-p m1-file-contents-p
                              m1-file->contents abs-file->contents))))

(defthm abs-mkdir-correctness-lemma-235
  (implies (and (m1-file-contents-p contents)
                (not (fat32-filename-p name)))
           (not (consp (assoc-equal name contents))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable m1-file-contents-p))))

(defthm
  abs-mkdir-correctness-lemma-236
  (implies
   (and (not (member-equal name (names-at fs path)))
        (abs-complete
         (abs-file->contents (mv-nth 0 (abs-find-file-helper fs path)))))
   (not
    (consp
     (assoc-equal
      name
      (m1-file->contents (mv-nth 0 (abs-find-file-helper fs path)))))))
  :hints (("goal" :in-theory (enable abs-find-file-helper names-at))))

(defthm
  abs-mkdir-correctness-lemma-224
  (implies
   (and
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (mv-nth 1 (collapse frame))
    (atom (frame-val->path (cdr (assoc-equal 0 frame))))
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (consp
     (nthcdr
      (len
       (frame-val->path
        (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                             path)
                          (partial-collapse frame path)))))
      path)))
   (and
    (implies
     (member-equal
      name
      (names-at
       (frame-val->dir
        (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                             path)
                          (partial-collapse frame path))))
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                               path)
                            (partial-collapse frame path)))))
        path)))
     (consp
      (assoc-equal
       name
       (m1-file->contents (mv-nth 0
                                  (abs-find-file (partial-collapse frame path)
                                                 path))))))
    (implies
     (not
      (member-equal
       name
       (names-at
        (frame-val->dir
         (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                              path)
                           (partial-collapse frame path))))
        (nthcdr
         (len
          (frame-val->path
           (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                                path)
                             (partial-collapse frame path)))))
         path))))
     (not
      (consp
       (assoc-equal name
                    (m1-file->contents
                     (mv-nth 0
                             (abs-find-file (partial-collapse frame path)
                                            path)))))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (disable path-clear-partial-collapse-when-zp-src-lemma-43
                        abs-mkdir-correctness-lemma-223
                        abs-mkdir-correctness-lemma-236
                        (:rewrite abs-mkdir-correctness-lemma-85)
                        (:rewrite path-clear-partial-collapse-when-zp-src-lemma-9 . 1))
    :use
    (path-clear-partial-collapse-when-zp-src-lemma-43
     (:instance
      abs-mkdir-correctness-lemma-223
      (fs
       (frame-val->dir
        (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                             path)
                          (partial-collapse frame path)))))
      (path
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                               path)
                            (partial-collapse frame path)))))
        path)))
     (:instance
      abs-mkdir-correctness-lemma-236
      (fs
       (frame-val->dir
        (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                             path)
                          (partial-collapse frame path)))))
      (path
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                               path)
                            (partial-collapse frame path)))))
        path)))
     (:instance
      (:rewrite abs-mkdir-correctness-lemma-85)
      (x-path
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                               path)
                            (partial-collapse frame path)))))
        path))
      (path path)
      (frame (partial-collapse frame path)))
     (:instance (:rewrite path-clear-partial-collapse-when-zp-src-lemma-9 . 1)
                (path path)
                (frame (partial-collapse frame path)))))))

(defthmd
  abs-mkdir-correctness-lemma-229
  (implies
   (and (consp (names-at fs path))
        (abs-complete
         (abs-file->contents (mv-nth 0 (abs-find-file-helper fs path)))))
   (m1-directory-file-p (mv-nth 0 (abs-find-file-helper fs path))))
  :hints (("goal" :in-theory (enable abs-find-file-helper names-at))))

(defthm
  abs-mkdir-correctness-lemma-230
  (implies
   (and
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (mv-nth 1 (collapse frame))
    (atom (frame-val->path (cdr (assoc-equal 0 frame))))
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (consp
     (names-at
      (frame-val->dir
       (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                            path)
                         (partial-collapse frame path))))
      (nthcdr
       (len
        (frame-val->path
         (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                              path)
                           (partial-collapse frame path)))))
       path))))
   (m1-directory-file-p (mv-nth 0
                                (abs-find-file (partial-collapse frame path)
                                               path))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (disable path-clear-partial-collapse-when-zp-src-lemma-43
                        (:rewrite abs-mkdir-correctness-lemma-85)
                        (:rewrite path-clear-partial-collapse-when-zp-src-lemma-9 . 1))
    :use
    ((:instance
      (:rewrite abs-mkdir-correctness-lemma-85)
      (x-path
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                               path)
                            (partial-collapse frame path)))))
        path))
      (path path)
      (frame (partial-collapse frame path)))
     path-clear-partial-collapse-when-zp-src-lemma-43
     (:instance
      abs-mkdir-correctness-lemma-229
      (fs
       (frame-val->dir
        (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                             path)
                          (partial-collapse frame path)))))
      (path
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                               path)
                            (partial-collapse frame path)))))
        path)))
     (:instance (:rewrite path-clear-partial-collapse-when-zp-src-lemma-9 . 1)
                (path path)
                (frame (partial-collapse frame path)))))))

(defthm
  abs-mkdir-correctness-lemma-231
  (implies
   (and
    (consp (assoc-equal 0 (partial-collapse frame path)))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (mv-nth 1 (collapse frame))
    (atom (frame-val->path (cdr (assoc-equal 0 frame))))
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (consp
     (names-at
      (frame-val->dir
       (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                            path)
                         (partial-collapse frame path))))
      (nthcdr
       (len
        (frame-val->path
         (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                              path)
                           (partial-collapse frame path)))))
       path))))
   (and
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  path)))
    (m1-directory-file-p
     (mv-nth
      0
      (hifat-find-file (mv-nth 0
                               (collapse (partial-collapse frame path)))
                       path)))))
  :hints (("goal" :in-theory (disable abs-mkdir-correctness-lemma-230
                                      abs-find-file-correctness-2)
           :use (abs-mkdir-correctness-lemma-230
                 (:instance abs-find-file-correctness-2
                            (frame (partial-collapse frame path)))
                 abs-find-file-correctness-2)
           :do-not-induct t)))

(defthm
  abs-mkdir-correctness-lemma-232
  (implies
   (and
    (fat32-filename-p name)
    (consp (assoc-equal '0 frame))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (mv-nth 1 (collapse frame))
    (atom (frame-val->path (cdr (assoc-equal 0 frame))))
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (consp
     (nthcdr
      (len
       (frame-val->path
        (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                             path)
                          (partial-collapse frame path)))))
      path))
    (m1-directory-file-p
     (m1-file-fix (mv-nth 0
                          (hifat-find-file (mv-nth 0 (collapse frame))
                                           path)))))
   (and
    (implies
     (member-equal
      name
      (names-at
       (frame-val->dir
        (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                             path)
                          (partial-collapse frame path))))
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                               path)
                            (partial-collapse frame path)))))
        path)))
     (consp
      (assoc-equal
       name
       (m1-file->contents (mv-nth 0
                                  (hifat-find-file (mv-nth 0 (collapse frame))
                                                   path))))))
    (implies
     (not
      (member-equal
       name
       (names-at
        (frame-val->dir
         (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                              path)
                           (partial-collapse frame path))))
        (nthcdr
         (len
          (frame-val->path
           (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                                path)
                             (partial-collapse frame path)))))
         path))))
     (not
      (consp
       (assoc-equal name
                    (m1-file->contents
                     (mv-nth 0
                             (hifat-find-file (mv-nth 0 (collapse frame))
                                              path)))))))))
  :instructions
  ((:bash
    ("goal" :do-not-induct t
     :in-theory (disable abs-mkdir-correctness-lemma-224
                         abs-find-file-correctness-2)
     :use (abs-mkdir-correctness-lemma-224
           (:instance abs-find-file-correctness-2
                      (frame (partial-collapse frame path))))))
   :demote
   (:casesplit
    (consp
     (assoc-equal
      name
      (m1-file->contents (mv-nth 0
                                 (abs-find-file (partial-collapse frame path)
                                                path))))))
   :bash :contrapose
   (:= (abs-find-file (partial-collapse frame path)
                      path)
       (hifat-find-file (mv-nth 0
                                (collapse (partial-collapse frame path)))
                        path))
   (:= name (fat32-filename-fix name))
   (:=
    (m1-file->contents
     (mv-nth
      0
      (hifat-find-file (mv-nth 0
                               (collapse (partial-collapse frame path)))
                       path)))
    (hifat-file-alist-fix
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file (mv-nth 0
                                (collapse (partial-collapse frame path)))
                        path)))))
   (:dive 1 2 1 1 2 1)
   (:rewrite (:rewrite partial-collapse-correctness-1 . 2))
   :top :bash :demote
   (:casesplit
    (not
     (consp
      (assoc-equal
       name
       (m1-file->contents (mv-nth 0
                                  (abs-find-file (partial-collapse frame path)
                                                 path)))))))
   :bash :contrapose
   (:= (abs-find-file (partial-collapse frame path)
                      path)
       (hifat-find-file (mv-nth 0
                                (collapse (partial-collapse frame path)))
                        path))
   (:= name (fat32-filename-fix name))
   (:=
    (m1-file->contents
     (mv-nth
      0
      (hifat-find-file (mv-nth 0
                               (collapse (partial-collapse frame path)))
                       path)))
    (hifat-file-alist-fix
     (m1-file->contents
      (mv-nth
       0
       (hifat-find-file (mv-nth 0
                                (collapse (partial-collapse frame path)))
                        path)))))
   (:dive 1 1 2 1 1 2 1)
   (:rewrite (:rewrite partial-collapse-correctness-1 . 2))
   :top :bash))

(defthm
  abs-mkdir-correctness-lemma-226
  (implies
   (and
    (fat32-filename-p name)
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  path)))
    (consp (assoc-equal '0 frame))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (mv-nth 1 (collapse frame))
    (atom (frame-val->path (cdr (assoc-equal 0 frame))))
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (consp
     (nthcdr
      (len
       (frame-val->path
        (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                             path)
                          (partial-collapse frame path)))))
      path)))
   (iff
    (consp
     (assoc-equal
      name
      (m1-file->contents
       (mv-nth 0
               (hifat-find-file (mv-nth 0 (collapse frame))
                                path)))))
    (member-equal
     name
     (names-at
      (frame-val->dir
       (cdr
        (assoc-equal
         (abs-find-file-src (partial-collapse frame path)
                            path)
         (partial-collapse frame path))))
      (nthcdr
       (len
        (frame-val->path
         (cdr
          (assoc-equal
           (abs-find-file-src (partial-collapse frame path)
                              path)
           frame))))
       path)))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (disable abs-mkdir-correctness-lemma-224
                        abs-find-file-correctness-2)
    :use (abs-mkdir-correctness-lemma-224
          (:instance abs-find-file-correctness-2
                     (frame (partial-collapse frame path)))))))

(defthm abs-mkdir-correctness-lemma-233
  (implies
   (and (mv-nth 1 (collapse frame))
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (consp (assoc-equal 0 frame))
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (equal (mv-nth 1
                       (hifat-find-file (mv-nth 0 (collapse frame))
                                        path))
               0))
   (<
    (len
     (frame-val->path
      (cdr (assoc-equal (abs-find-file-src (partial-collapse frame path)
                                           path)
                        frame))))
    (len path)))
  :hints
  (("goal" :do-not-induct t
    :use (:instance (:linear abs-find-file-src-correctness-2)
                    (path path)
                    (frame (partial-collapse frame path)))))
  :rule-classes :linear)

(defthm
  abs-mkdir-correctness-lemma-112
  (implies (and (equal (mv-nth 1
                               (hifat-find-file (frame->root frame)
                                                path))
                       0)
                (not (consp (abs-addrs (frame->root frame))))
                (not (consp (dirname path))))
           (consp (assoc-equal (basename path)
                               (frame-val->dir (cdr (assoc-equal 0 frame))))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable frame->root basename
                              hifat-find-file abs-complete))))

;; Kinda general.
(defthmd
  abs-mkdir-correctness-lemma-238
  (equal
   (hifat-find-file fs path)
   (cond
    ((atom path)
     (mv (m1-file-fix nil) *enoent*))
    ((atom (list (basename path)))
     (hifat-find-file fs (dirname path)))
    ((and
      (zp (mv-nth 1 (hifat-find-file fs (dirname path))))
      (m1-directory-file-p (mv-nth 0 (hifat-find-file fs (dirname path)))))
     (hifat-find-file
      (m1-file->contents (mv-nth 0 (hifat-find-file fs (dirname path))))
      (list (basename path))))
    ((zp (mv-nth 1 (hifat-find-file fs (dirname path))))
     (cons (m1-file-fix nil) '(20)))
    ((atom (dirname path))
     (hifat-find-file fs (list (basename path))))
    (t (hifat-find-file fs (dirname path)))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (hifat-find-file)
                    ((:rewrite hifat-find-file-of-append-1)
                     (:rewrite append-nthcdr-dirname-basename-lemma-1
                               . 1)))
    :use ((:instance (:rewrite hifat-find-file-of-append-1)
                     (y (list (basename path)))
                     (x (dirname path))
                     (fs fs))
          (:rewrite append-nthcdr-dirname-basename-lemma-1
                    . 1)))))

(defthm abs-mkdir-correctness-lemma-239
  (implies (and (abs-complete fs)
                (abs-complete (abs-file->contents file))
                (abs-file-alist-p fs)
                (abs-no-dups-p fs)
                (fat32-filename-p name))
           (abs-complete (put-assoc-equal name file fs)))
  :hints (("goal" :do-not-induct t
           :in-theory (e/d (abs-complete) nil))))

(defthm abs-mkdir-correctness-lemma-240
  (implies
   (and
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path))))
   (equal
    (mv-nth
     1
     (abs-find-file-helper
      (frame-val->dir
       (cdr (assoc-equal 0
                         (partial-collapse frame (dirname path)))))
      (dirname path)))
    0))
  :hints
  (("goal" :do-not-induct t
    :use (:instance abs-find-file-src-correctness-2
                    (frame (partial-collapse frame (dirname path)))
                    (path (dirname path))))))

(defthm abs-mkdir-correctness-lemma-241
 (implies
  (and
   (equal (mv-nth 1
                  (hifat-find-file (mv-nth 0 (collapse frame))
                                   (dirname path)))
          0)
   (mv-nth 1 (collapse frame))
   (not (frame-val->path (cdr (assoc-equal 0 frame))))
   (consp (assoc-equal 0 frame))
   (equal (frame-val->src (cdr (assoc-equal 0 frame)))
          0)
   (frame-p frame)
   (no-duplicatesp-equal (strip-cars frame))
   (abs-separate frame)
   (subsetp-equal (abs-addrs (frame->root frame))
                  (frame-addrs-root (frame->frame frame)))
   (equal 0
          (abs-find-file-src (partial-collapse frame (dirname path))
                             (dirname path))))
  (not
   (consp
    (set-difference-equal
     (abs-addrs
      (abs-file->contents
       (mv-nth
        0
        (abs-find-file-helper
         (frame-val->dir
          (cdr (assoc-equal 0
                            (partial-collapse frame (dirname path)))))
         (dirname path)))))
     (abs-addrs
      (abs-file->contents
       (cdr
        (assoc-equal
         (basename path)
         (abs-file->contents
          (mv-nth
           0
           (abs-find-file-helper
            (frame-val->dir
             (cdr (assoc-equal 0
                               (partial-collapse frame (dirname path)))))
            (dirname path))))))))))))
 :hints
 (("goal" :do-not-induct t
          :use (:instance abs-find-file-src-correctness-2
                          (frame (partial-collapse frame (dirname path)))
                          (path (dirname path))))))

(defthm
  abs-mkdir-correctness-lemma-242
  (implies
   (and (equal (mv-nth 1
                       (hifat-find-file (mv-nth 0 (collapse frame))
                                        (dirname path)))
               0)
        (mv-nth 1 (collapse frame))
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (consp (assoc-equal 0 frame))
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (equal 0
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))))
   (abs-complete
    (put-assoc-equal
     (basename path)
     '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
       (contents))
     (mv-nth
      '0
      (abs-alloc
       (frame-val->dir$inline
        (cdr (assoc-equal '0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))))
  :hints
  (("goal"
    :in-theory (e/d (abs-complete) nil)
    :do-not-induct t
    :expand
    (:with
     abs-mkdir-correctness-lemma-30
     (mv-nth
      0
      (abs-alloc
       (frame-val->dir$inline
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (dirname path)
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path))))))))))

(defthm
  abs-mkdir-correctness-lemma-243
  (implies
   (and
    (m1-file-p file)
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (not
     (member-equal
      (basename path)
      (names-at
       (frame-val->dir
        (cdr (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (dirname path))))))
   (equal
    (put-assoc-equal
     (basename path)
     file
     (mv-nth
      '0
      (abs-alloc
       (frame-val->dir$inline
        (cdr (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
       (nthcdr
        (len
         (frame-val->path$inline
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (dirname path))
       (find-new-index
        (strip-cars (partial-collapse frame (dirname path)))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth
       '0
       (abs-alloc
        (frame-val->dir$inline
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               (partial-collapse frame (dirname path)))))
        (nthcdr
         (len
          (frame-val->path$inline
           (cdr
            (assoc-equal
             (abs-find-file-src (partial-collapse frame (dirname path))
                                (dirname path))
             frame))))
         (dirname path))
        (find-new-index
         (strip-cars (partial-collapse frame (dirname path))))))
      (list (basename path))
      file))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable hifat-place-file))))

(defthm
  abs-mkdir-correctness-lemma-244
  (implies
   (and (mv-nth 1 (collapse frame))
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (consp path)
        (not (equal 0
                    (abs-find-file-src (partial-collapse frame (dirname path))
                                       (dirname path)))))
   (mv-nth
    1
    (collapse
     (frame-with-root
      (frame->root (partial-collapse frame (dirname path)))
      (put-assoc-equal
       (abs-find-file-src (partial-collapse frame (dirname path))
                          (dirname path))
       (frame-val
        (frame-val->path
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame)))
        (mv-nth
         0
         (abs-place-file-helper
          (frame-val->dir
           (cdr
            (assoc-equal
             (abs-find-file-src (partial-collapse frame (dirname path))
                                (dirname path))
             (partial-collapse frame (dirname path)))))
          (nthcdr
           (len
            (frame-val->path
             (cdr
              (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame))))
           path)
          '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
            (contents))))
        (frame-val->src
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame))))
       (frame->frame (partial-collapse frame (dirname path))))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (disable collapse-hifat-place-file-2)
    :use
    (:instance
     collapse-hifat-place-file-2
     (x (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path)))
     (frame (frame->frame (partial-collapse frame (dirname path))))
     (path
      (append
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (dirname path))
       (list (basename path))))
     (file '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
             (contents)))
     (root (frame->root (partial-collapse frame (dirname path))))))))

(defthm
  abs-mkdir-correctness-lemma-245
  (implies (consp (assoc-equal name (frame->root frame)))
           (consp (assoc-equal name
                               (frame-val->dir (cdr (assoc-equal 0 frame))))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable abs-complete frame->root))))

(defthm fat32-filename-list-equiv-implies-equal-consp-cdr
  (implies (fat32-filename-list-equiv x y)
           (equal (consp (cdr x)) (consp (cdr y))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable fat32-filename-list-equiv
                              fat32-filename-list-fix)
           :expand ((fat32-filename-list-fix (cdr x))
                    (fat32-filename-list-fix (cdr y))
                    (fat32-filename-list-fix x)
                    (fat32-filename-list-fix y))))
  :rule-classes :congruence)

(defthm
  abs-mkdir-correctness-lemma-246
  (implies
   (and (m1-file-p file)
        (not (consp (abs-addrs (frame->root frame)))))
   (abs-complete
    (put-assoc-equal (basename path)
                     file
                     (frame-val->dir$inline (cdr (assoc-equal 0 frame))))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable abs-complete frame->root))))

(defthm
  abs-mkdir-correctness-lemma-247
  (implies
   (and (m1-file-p file)
        (not (consp (abs-addrs (frame->root frame))))
        (not (consp (cdr path)))
        (consp path)
        (not (consp (assoc-equal (basename path)
                                 (frame->root frame)))))
   (equal (put-assoc-equal (basename path)
                           file
                           (frame-val->dir (cdr (assoc-equal 0 frame))))
          (mv-nth 0
                  (hifat-place-file (frame->root frame)
                                    path file))))
  :hints
  (("goal"
    :in-theory (e/d (frame->root hifat-place-file basename abs-complete)
                    ())
    :do-not-induct t
    :expand
    (hifat-place-file (frame-val->dir (cdr (assoc-equal 0 frame)))
                      path
                      '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                                 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                        (contents))))))

(defthm
  abs-mkdir-correctness-lemma-248
  (implies
   (and
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (equal 0
           (abs-find-file-src (partial-collapse frame (dirname path))
                              (dirname path))))
   (abs-complete
    (mv-nth
     '0
     (abs-alloc
      (frame-val->dir$inline
       (cdr (assoc-equal '0
                         (partial-collapse frame (dirname path)))))
      (dirname path)
      (find-new-index
       (strip-cars (partial-collapse frame (dirname path))))))))
  :hints (("goal" :in-theory (e/d (abs-complete) nil))))

(defthm
  abs-mkdir-correctness-lemma-249
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path)))))
   (m1-directory-file-p
    (mv-nth
     0
     (hifat-find-file
      (mv-nth
       0
       (collapse
        (frame-with-root
         (frame-val->dir$inline
          (cdr (assoc-equal 0
                            (partial-collapse frame (dirname path)))))
         (frame->frame (partial-collapse frame (dirname path))))))
      (dirname path)))))
  :instructions
  (:promote
   (:= (frame-val->dir
        (cdr (assoc-equal 0
                          (partial-collapse frame (dirname path)))))
       (frame->root (partial-collapse frame (dirname path)))
       :hints (("goal" :in-theory (enable frame->root))))
   :bash))

(defthm
  abs-mkdir-correctness-lemma-251
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path)))))
   (hifat-equiv
    (put-assoc-equal
     (basename path)
     '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
       (contents))
     (m1-file->contents
      (mv-nth 0
              (hifat-find-file
               (mv-nth 0
                       (collapse (partial-collapse frame (dirname path))))
               (dirname path)))))
    (put-assoc-equal
     (basename path)
     '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
       (contents))
     (m1-file->contents (mv-nth 0
                                (hifat-find-file (mv-nth 0 (collapse frame))
                                                 (dirname path)))))))
  :instructions
  (:promote
   (:dive 1)
   (:rewrite
    hifat-equiv-of-put-assoc-2
    ((fs2
      (m1-file->contents (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path)))))))
   :top :bash
   :bash :bash
   :bash :bash
   :bash :bash
   :bash :bash))

(defthm
  abs-mkdir-correctness-lemma-252
  (implies
   (and
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path)))))
   (hifat-equiv
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname path)
      (m1-file
       (m1-file->d-e
        (mv-nth
         0
         (hifat-find-file
          (mv-nth 0
                  (collapse (partial-collapse frame (dirname path))))
          (dirname path))))
       (put-assoc-equal
        (basename path)
        '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
          (contents))
        (m1-file->contents
         (mv-nth
          0
          (hifat-find-file
           (mv-nth 0
                   (collapse (partial-collapse frame (dirname path))))
           (dirname path))))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname path)
      (m1-file
       (m1-file->d-e (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
       (put-assoc-equal
        (basename path)
        '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
          (contents))
        (m1-file->contents
         (mv-nth 0
                 (hifat-find-file (mv-nth 0 (collapse frame))
                                  (dirname path))))))))))
  :instructions
  (:promote
   (:dive 1)
   (:rewrite
    hifat-place-file-when-hifat-equiv-1
    ((file2
      (m1-file
       (m1-file->d-e (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
       (put-assoc-equal
        (basename path)
        '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
          (contents))
        (m1-file->contents
         (mv-nth 0
                 (hifat-find-file (mv-nth 0 (collapse frame))
                                  (dirname path)))))))))
   :top
   :bash :bash
   :bash :bash))

(defthm
  abs-mkdir-correctness-lemma-250
  (implies
   (and
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (consp path)
    (not
     (member-equal
      (basename path)
      (names-at
       (frame-val->dir
        (cdr (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (dirname path)))))
    (not (equal 0
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path)))))
   (absfat-equiv
    (mv-nth
     0
     (collapse
      (frame-with-root
       (frame->root (partial-collapse frame (dirname path)))
       (put-assoc-equal
        (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path))
        (frame-val
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame)))
         (mv-nth
          0
          (abs-place-file-helper
           (frame-val->dir
            (cdr
             (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
           (nthcdr
            (len
             (frame-val->path
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
            path)
           '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
             (contents))))
         (frame-val->src
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (frame->frame (partial-collapse frame (dirname path)))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname path)
      (m1-file
       (m1-file->d-e (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
       (put-assoc-equal
        (basename path)
        '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
          (contents))
        (m1-file->contents
         (mv-nth 0
                 (hifat-find-file (mv-nth 0 (collapse frame))
                                  (dirname path))))))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory (e/d (assoc-of-frame->frame hifat-place-file)
                    ((:rewrite collapse-hifat-place-file-2)))
    :use
    (:instance
     (:rewrite collapse-hifat-place-file-2)
     (file '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
             (contents)))
     (path
      (nthcdr
       (len
        (frame-val->path
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               (frame->frame (partial-collapse frame (dirname path)))))))
       path))
     (frame (frame->frame (partial-collapse frame (dirname path))))
     (x (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path)))
     (root (frame->root (partial-collapse frame (dirname path)))))
    :expand
    (:with
     abs-pwrite-correctness-lemma-1
     (hifat-place-file (mv-nth 0 (collapse frame))
                       path
                       '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                         (contents)))))))

(defthm
  abs-mkdir-correctness-lemma-253
  (equal
   (collapse
    (frame-with-root
     (frame-val->dir
      (cdr (assoc-equal 0 frame)))
     (frame->frame frame)))
   (collapse frame))
  :instructions
  ((:= (frame-val->dir
        (cdr (assoc-equal 0 frame)))
       (frame->root frame)
       :hints (("goal" :in-theory (enable frame->root))))
   :bash))

(defthm abs-mkdir-correctness-lemma-254
  (implies (atom y)
           (equal (fat32-filename-list-prefixp x y)
                  (atom x)))
  :hints (("goal" :in-theory (e/d (fat32-filename-list-prefixp)))))

(defthm
  abs-mkdir-correctness-lemma-256
  (implies
   (and
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame))))
   (not
    (prefixp
     (dirname path)
     (frame-val->path
      (cdr
       (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                       (dirname path))
                    frame))))))
  :hints
  (("goal" :do-not-induct t
    :use (:instance (:linear abs-find-file-src-correctness-2)
                    (frame (partial-collapse frame (dirname path)))
                    (path (dirname path))))))

(defthm abs-mkdir-correctness-lemma-34
  (implies (not (consp (cdr path)))
           (equal (put-assoc-equal (basename path)
                                   file fs)
                  (put-assoc-equal (fat32-filename-fix (car path))
                                   file fs)))
  :hints (("goal" :do-not-induct t
           :in-theory (enable basename))))

;; This lemma could come into conflict with the definition of frame->root as
;; and when it is enabled...
(defthm abs-mkdir-correctness-lemma-39
  (equal (put-assoc-equal name file
                          (frame-val->dir (cdr (assoc-equal 0 frame))))
         (put-assoc-equal name file (frame->root frame)))
  :hints (("goal" :in-theory (enable frame->root))))

(defthm
  abs-mkdir-correctness-lemma-52
  (implies
   (not (consp (cdr path)))
   (and (implies (not (consp (assoc-equal (basename path) fs)))
                 (not (consp (assoc-equal (fat32-filename-fix (car path))
                                          fs))))
        (implies (consp (assoc-equal (basename path) fs))
                 (consp (assoc-equal (fat32-filename-fix (car path))
                                     fs)))))
  :hints (("goal" :do-not-induct t
           :in-theory (enable basename))))

(defthm
  abs-mkdir-correctness-lemma-113
  (implies
   (not (equal 0
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))))
   (equal
    (frame-val->src$inline
     (cdr
      (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                      (dirname path))
                   (frame->frame frame))))
    (frame-val->src$inline
     (cdr
      (assoc-equal (abs-find-file-src (partial-collapse frame (dirname path))
                                      (dirname path))
                   frame)))))
  :hints
  (("goal"
    :in-theory (e/d (assoc-of-frame->frame) nil)
    :do-not-induct t
    :expand
    ((:with
      abs-pwrite-correctness-lemma-1
      (:free (file)
             (hifat-place-file (mv-nth 0 (collapse frame))
                               path
                               '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                                      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                 (contents)))))
     (:with abs-mkdir-correctness-lemma-238
            (hifat-find-file (mv-nth 0 (collapse frame))
                             path))))))

;; This encapsulation is to ensure that any changes we make to a theory while
;; examining a subgoal actually have effect...
(encapsulate
  ()

  (local
   (in-theory
    (e/d
     (good-frame-p frame-reps-fs
                   abs-mkdir
                   collapse collapse-this
                   hifat-place-file
                   hifat-find-file dist-names abs-separate
                   ;; Enabling names-at creates a really silly subgoal.
                   assoc-equal-of-frame-with-root ;; names-at
                   1st-complete frame->frame-of-put-assoc frame-addrs-root
                   abs-alloc abs-addrs ctx-app)
     ((:rewrite abs-file->contents-when-m1-file-p)
      (:rewrite collapse-hifat-place-file-lemma-6)
      (:rewrite m1-file-p-when-m1-regular-file-p)
      (:definition fat32-filename-list-prefixp)
      (:rewrite abs-find-file-correctness-lemma-2)
      (:rewrite abs-find-file-of-frame->frame-1)
      (:type-prescription assoc-when-zp-len)
      (:rewrite
       collapse-1st-index-of-frame-val->src-of-cdr-of-assoc-linear-lemma-2)
      (:rewrite
       abs-find-file-after-abs-mkdir-lemma-21)
      (:rewrite
       abs-directory-file-p-correctness-1)
      (:rewrite
       fat32-filename-list-p-when-not-consp)
      (:rewrite
       abs-separate-of-frame->frame-of-collapse-this-lemma-8
       . 3)
      (:rewrite abs-fs-p-correctness-1)
      (:rewrite abs-file-alist-p-correctness-1)
      (:rewrite abs-addrs-of-remove-assoc-lemma-2)
      (:rewrite abs-mkdir-guard-lemma-3)
      (:type-prescription len-when-consp)
      (:type-prescription
       fat32-filename-list-fix-when-zp-len)
      (:rewrite m1-regular-file-p-correctness-1)
      (:rewrite
       partial-collapse-when-path-clear-of-prefix)
      (:rewrite abs-lstat-refinement-lemma-1)
      (:rewrite valid-seqp-of-seq-this-under-path)
      (:rewrite prefixp-when-not-consp-left)
      (:rewrite
       abs-separate-of-collapse-this-lemma-7)
      (:type-prescription
       abs-find-file-correctness-1-lemma-17)
      (:rewrite
       abs-find-file-correctness-1-lemma-40)
      (:rewrite abs-addrs-when-m1-file-alist-p)
      (:rewrite
       m1-file-alist-p-of-cdr-when-m1-file-alist-p)
      (:rewrite put-assoc-equal-without-change
                . 2)
      (:rewrite hifat-no-dups-p-when-abs-complete)
      (:rewrite abs-file-alist-p-correctness-1)
      (:rewrite collapse-hifat-place-file-lemma-6)
      (:rewrite
       1st-complete-under-path-of-put-assoc-lemma-1)
      (:rewrite prefixp-when-equal-lengths)
      (:rewrite abs-file-alist-p-of-cdr)
      (:rewrite abs-fs-p-of-ctx-app)
      (:rewrite
       hifat-find-file-correctness-1-lemma-1)
      (:type-prescription
       abs-addrs-of-remove-assoc-lemma-1)
      (:rewrite
       m1-directory-file-p-when-m1-file-p)
      (:rewrite
       append-nthcdr-dirname-basename-lemma-1
       . 3)))))

  (defthm
    abs-mkdir-correctness-2
    (implies (good-frame-p frame)
             (and
              (frame-reps-fs (mv-nth 0 (abs-mkdir frame path))
                             (mv-nth 0 (hifat-mkdir (mv-nth 0 (collapse frame)) path)))
              (equal (mv-nth 2 (abs-mkdir frame path))
                     (mv-nth 2 (hifat-mkdir (mv-nth 0 (collapse frame)) path)))))
    :hints (("goal"
             :do-not-induct t
             :expand
             ((:with abs-pwrite-correctness-lemma-1
                     (:free (file)
                            (hifat-place-file (mv-nth 0 (collapse frame))
                                              path
                                              '((d-e 0 0 0 0 0 0 0 0 0 0 0 16
                                                         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                                                (contents)))))
              ;; This hint will probably work!
              (:with
               abs-mkdir-correctness-lemma-238
               (hifat-find-file (mv-nth 0 (collapse frame))
                                path)))))
              :otf-flg t))

(defthm
  abs-pwrite-correctness-lemma-89
  (implies
   (and (equal (mv-nth 1
                       (hifat-find-file (mv-nth 0 (collapse frame))
                                        (dirname path)))
               0)
        (mv-nth 1 (collapse frame))
        (not (frame-val->path (cdr (assoc-equal 0 frame))))
        (equal (frame-val->src (cdr (assoc-equal 0 frame)))
               0)
        (frame-p frame)
        (no-duplicatesp-equal (strip-cars frame))
        (abs-separate frame)
        (subsetp-equal (abs-addrs (frame->root frame))
                       (frame-addrs-root (frame->frame frame)))
        (not (equal 0
                    (abs-find-file-src (partial-collapse frame (dirname path))
                                       (dirname path)))))
   (mv-nth
    1
    (collapse
     (frame-with-root
      (frame->root (partial-collapse frame (dirname path)))
      (put-assoc-equal
       (abs-find-file-src (partial-collapse frame (dirname path))
                          (dirname path))
       (frame-val
        (frame-val->path
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame)))
        (mv-nth
         0
         (abs-place-file-helper
          (frame-val->dir
           (cdr
            (assoc-equal
             (abs-find-file-src (partial-collapse frame (dirname path))
                                (dirname path))
             (partial-collapse frame (dirname path)))))
          (nthcdr
           (len
            (frame-val->path
             (cdr
              (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame))))
           path)
          (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                   (implode (insert-text nil offset buf)))))
        (frame-val->src
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               frame))))
       (frame->frame (partial-collapse frame (dirname path))))))))
  :hints
  (("goal"
    :in-theory (e/d (assoc-of-frame->frame)
                    ((:rewrite collapse-hifat-place-file-2)))
    :use
    (:instance
     (:rewrite collapse-hifat-place-file-2)
     (file (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                    (implode (insert-text nil offset buf))))
     (path
      (nthcdr
       (len
        (frame-val->path
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               (frame->frame (partial-collapse frame (dirname path)))))))
       path))
     (frame (frame->frame (partial-collapse frame (dirname path))))
     (x (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path)))
     (root (frame->root (partial-collapse frame (dirname path))))))))

(defthm
  abs-pwrite-correctness-lemma-105
  (abs-fs-p
   (mv-nth '0
           (hifat-place-file
            (mv-nth '0
                    (collapse (partial-collapse frame (dirname path))))
            path
            (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                     (implode$inline (insert-text 'nil offset buf))))))
  :hints
  (("goal"
    :do-not-induct t
    :in-theory
    (e/d (assoc-of-frame->frame m1-file-contents-fix hifat-no-dups-p)
         ((:rewrite collapse-hifat-place-file-2))))))

(defthm
  abs-pwrite-correctness-lemma-106
  (implies
   (and
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (not
     (member-equal
      (basename path)
      (names-at
       (frame-val->dir
        (cdr (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (dirname path))))))
   (hifat-equiv
    (mv-nth 0
            (hifat-place-file
             (mv-nth 0
                     (collapse (partial-collapse frame (dirname path))))
             path
             (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                      (implode (insert-text nil offset buf)))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname path)
      (m1-file
       (m1-file->d-e (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
       (put-assoc-equal
        (basename path)
        (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                 (implode (insert-text nil offset buf)))
        (m1-file->contents
         (mv-nth 0
                 (hifat-find-file (mv-nth 0 (collapse frame))
                                  (dirname path))))))))))
  :instructions
  (:promote
   (:dive 1)
   (:rewrite hifat-place-file-correctness-4
             ((m1-file-alist2 (mv-nth 0 (collapse frame)))))
   :top (:change-goal nil t)
   :bash
   (:bash ("goal" :in-theory (enable hifat-no-dups-p)))
   (:bash
    ("goal"
     :in-theory (enable hifat-place-file)
     :expand ((:with abs-pwrite-correctness-lemma-1
                     (:free (file)
                            (hifat-place-file (mv-nth 0 (collapse frame))
                                              path file))))))))

(defthm
  abs-pwrite-correctness-lemma-107
  (implies
   (and
    (equal (mv-nth 1
                   (hifat-find-file (mv-nth 0 (collapse frame))
                                    (dirname path)))
           0)
    (mv-nth 1 (collapse frame))
    (not (frame-val->path (cdr (assoc-equal 0 frame))))
    (consp (assoc-equal 0 frame))
    (equal (frame-val->src (cdr (assoc-equal 0 frame)))
           0)
    (frame-p frame)
    (no-duplicatesp-equal (strip-cars frame))
    (abs-separate frame)
    (subsetp-equal (abs-addrs (frame->root frame))
                   (frame-addrs-root (frame->frame frame)))
    (m1-directory-file-p (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
    (not
     (member-equal
      (basename path)
      (names-at
       (frame-val->dir
        (cdr (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
       (nthcdr
        (len
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (dirname path)))))
    (not (equal 0
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path)))))
   (absfat-equiv
    (mv-nth
     0
     (collapse
      (frame-with-root
       (frame->root (partial-collapse frame (dirname path)))
       (put-assoc-equal
        (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path))
        (frame-val
         (frame-val->path
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame)))
         (mv-nth
          0
          (abs-place-file-helper
           (frame-val->dir
            (cdr
             (assoc-equal
              (abs-find-file-src (partial-collapse frame (dirname path))
                                 (dirname path))
              (partial-collapse frame (dirname path)))))
           (nthcdr
            (len
             (frame-val->path
              (cdr
               (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
            path)
           (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                    (implode (insert-text nil offset buf)))))
         (frame-val->src
          (cdr (assoc-equal
                (abs-find-file-src (partial-collapse frame (dirname path))
                                   (dirname path))
                frame))))
        (frame->frame (partial-collapse frame (dirname path)))))))
    (mv-nth
     0
     (hifat-place-file
      (mv-nth 0 (collapse frame))
      (dirname path)
      (m1-file
       (m1-file->d-e (mv-nth 0
                                 (hifat-find-file (mv-nth 0 (collapse frame))
                                                  (dirname path))))
       (put-assoc-equal
        (basename path)
        (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                 (implode (insert-text nil offset buf)))
        (m1-file->contents
         (mv-nth 0
                 (hifat-find-file (mv-nth 0 (collapse frame))
                                  (dirname path))))))))))
  :hints
  (("goal" :do-not-induct t
    :in-theory (e/d (assoc-of-frame->frame hifat-no-dups-p)
                    ((:rewrite collapse-hifat-place-file-2)))
    :use
    (:instance
     (:rewrite collapse-hifat-place-file-2)
     (file (m1-file '(0 0 0 0 0 0 0 0 0 0 0 0
                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
                    (implode (insert-text nil offset buf))))
     (path
      (nthcdr
       (len
        (frame-val->path
         (cdr (assoc-equal
               (abs-find-file-src (partial-collapse frame (dirname path))
                                  (dirname path))
               (frame->frame (partial-collapse frame (dirname path)))))))
       path))
     (frame (frame->frame (partial-collapse frame (dirname path))))
     (x (abs-find-file-src (partial-collapse frame (dirname path))
                           (dirname path)))
     (root (frame->root (partial-collapse frame (dirname path))))))))

(defthm
  abs-pwrite-correctness-lemma-37
  (implies (and (fat32-filename-list-p path)
                (consp path)
                (not (consp (cdr path))))
           (equal (assoc-equal (car path) fs)
                  (assoc-equal (basename path) fs)))
  :hints (("goal" :in-theory (enable basename)
           :do-not-induct t)))

;; This lemma could come into conflict with the definition of frame->root as
;; and when it is enabled...
(defthm abs-pwrite-correctness-lemma-40
  (equal (assoc-equal name
                      (frame-val->dir (cdr (assoc-equal 0 frame))))
         (assoc-equal name (frame->root frame)))
  :hints (("goal" :in-theory (enable frame->root))))

(encapsulate
  ()

  (local
   (in-theory
    (e/d (frame-reps-fs good-frame-p
                        abs-pwrite frame->frame-of-put-assoc
                        collapse collapse-this
                        1st-complete frame-addrs-root
                        dist-names abs-separate abs-fs-fix
                        assoc-equal-of-frame-with-root
                        hifat-no-dups-p
                        hifat-place-file hifat-find-file
                        abs-alloc ctx-app abs-fs-fix abs-addrs
                        abs-mkdir-correctness-lemma-35
                        abs-pwrite-correctness-lemma-55
                        abs-pwrite-correctness-lemma-21)
         ((:rewrite collapse-hifat-place-file-lemma-6)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 2)
          (:rewrite abs-find-file-after-abs-mkdir-lemma-21)
          (:rewrite len-when-prefixp)
          (:rewrite abs-separate-of-frame->frame-of-collapse-this-lemma-8
                    . 3)
          (:rewrite abs-lstat-refinement-lemma-1)
          (:rewrite abs-fs-p-of-ctx-app)
          (:rewrite partial-collapse-correctness-lemma-2)
          (:type-prescription assoc-when-zp-len)
          (:rewrite abs-addrs-when-m1-file-contents-p)
          (:rewrite final-val-seq-of-collapse-this-lemma-2)
          (:rewrite ctx-app-when-not-ctx-app-ok)
          (:rewrite abs-mkdir-correctness-lemma-73)
          (:type-prescription abs-addrs-of-remove-assoc-lemma-1)
          (:rewrite assoc-after-remove-assoc)
          (:definition nth)
          (:definition put-assoc-equal)
          (:rewrite insert-text-correctness-4)
          (:rewrite m1-file-alist-p-of-cdr-when-m1-file-alist-p)
          (:rewrite no-duplicatesp-of-strip-cars-when-hifat-no-dups-p)
          (:rewrite subsetp-car-member)
          (:definition len)
          (:rewrite hifat-no-dups-p-of-cdr)
          (:rewrite m1-file-alist-p-when-not-consp)
          (:rewrite abs-alloc-correctness-1)
          (:rewrite ctx-app-ok-when-abs-complete)
          (:linear len-when-hifat-bounded-file-alist-p . 2)
          (:rewrite abs-addrs-of-put-assoc-lemma-1)
          (:rewrite hifat-subsetp-reflexive-lemma-3)
          (:rewrite abs-pwrite-correctness-lemma-97)
          (:type-prescription
           abs-mkdir-correctness-lemma-97)
          (:rewrite abs-pwrite-correctness-lemma-20)
          (:rewrite abs-pwrite-correctness-lemma-22)
          (:rewrite abs-pwrite-correctness-lemma-47)
          path-clear-partial-collapse-when-zp-src-lemma-17
          (:rewrite abs-addrs-of-ctx-app-2)
          (:rewrite abs-addrs-of-remove-assoc-lemma-2)
          (:rewrite abs-file-alist-p-of-cdr)
          (:rewrite abs-mkdir-correctness-lemma-107)
          (:rewrite
           fat32-filename-p-of-nth-when-fat32-filename-list-p)
          (:rewrite
           subsetp-of-abs-addrs-of-put-assoc-lemma-1)
          (:rewrite abs-pwrite-correctness-lemma-29)
          (:rewrite abs-mkdir-correctness-lemma-26 . 1)
          (:rewrite abs-find-file-correctness-lemma-2)
          (:rewrite
           abs-find-file-after-abs-mkdir-lemma-16)
          (:rewrite abs-find-file-of-frame->frame-1)
          (:rewrite
           append-nthcdr-dirname-basename-lemma-1
           . 3)
          (:rewrite abs-pwrite-correctness-lemma-98)
          (:definition nat-equiv$inline)
          (:rewrite str::explode-when-not-stringp)
          (:rewrite
           fat32-filename-list-p-when-subsetp-equal)
          (:rewrite
           fat32-filename-p-when-member-equal-of-fat32-filename-list-p)
          (:rewrite nthcdr-when->=-n-len-l)
          (:rewrite nfix-when-zp)
          (:rewrite path-clear-partial-collapse-when-zp-src-lemma-15)
          (:rewrite abs-find-file-helper-of-collapse-1 . 2)
          (:rewrite abs-mkdir-correctness-lemma-26 . 2)
          (:linear len-when-prefixp)
          (:rewrite partial-collapse-when-path-clear-of-prefix)
          (:rewrite abs-find-file-correctness-lemma-12)
          (:rewrite path-clear-partial-collapse-when-zp-src-lemma-3)))))

  ;; This was a counterexample, because abs-pwrite used to return *enotdir*.
  (thm
   (implies
    (and
     (mv-nth 1 (collapse frame))
     (not (frame-val->path (cdr (assoc-equal 0 frame))))
     (consp (assoc-equal 0 frame))
     (frame-p frame)
     (no-duplicatesp-equal (strip-cars frame))
     (abs-separate frame)
     (subsetp-equal (abs-addrs (frame->root frame))
                    (frame-addrs-root (frame->frame frame)))
     (consp (assoc-equal fd fd-table))
     (not (stringp buf))
     (integerp (+ offset (len buf)))
     (<= 0 (+ offset (len buf)))
     (< (+ offset (len buf)) 4294967296)
     (not
      (m1-directory-file-p
       (mv-nth
        0
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))))
     (not
      (m1-regular-file-p
       (mv-nth
        0
        (hifat-find-file (mv-nth 0 (collapse frame))
                         (file-table-element->fid
                          (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                            file-table)))))))
     (equal
      (mv-nth
       1
       (hifat-find-file
        (mv-nth 0 (collapse frame))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table))))))
      2))
    (and (equal (mv-nth 2
                        (abs-pwrite fd
                                    buf offset frame fd-table file-table))
                *enoent*)
         (equal (mv-nth 2
                        (hifat-pwrite fd
                                      buf offset (mv-nth 0 (collapse frame))
                                      fd-table file-table))
                *enoent*)))
   :hints
   (("goal"
     :do-not-induct t
     :expand
     ((:with abs-pwrite-correctness-lemma-1
             (:free (file)
                    (hifat-place-file
                     (mv-nth 0 (collapse frame))
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))
                     file)))))))

  ;; This used to be a counterexample, because abs-pwrite returned *enoent*.
  (thm
   (implies
    (and
     (mv-nth 1 (collapse frame))
     (not (frame-val->path (cdr (assoc-equal 0 frame))))
     (consp (assoc-equal 0 frame))
     (frame-p frame)
     (no-duplicatesp-equal (strip-cars frame))
     (abs-separate frame)
     (subsetp-equal (abs-addrs (frame->root frame))
                    (frame-addrs-root (frame->frame frame)))
     (consp (assoc-equal fd fd-table))
     (not (stringp buf))
     (integerp (+ offset (len buf)))
     (<= 0 (+ offset (len buf)))
     (< (+ offset (len buf)) 4294967296)
     (<
      0
      (mv-nth
       1
       (hifat-find-file
        (mv-nth 0 (collapse frame))
        (dirname (file-table-element->fid
                  (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                    file-table)))))))
     (not
      (equal
       (mv-nth
        1
        (hifat-find-file
         (mv-nth 0 (collapse frame))
         (dirname (file-table-element->fid
                   (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                     file-table))))))
       2)))
    (and (equal (mv-nth 2
                        (abs-pwrite fd
                                    buf offset frame fd-table file-table))
                *enotdir*)
         (equal (mv-nth 2
                        (hifat-pwrite fd
                                      buf offset (mv-nth 0 (collapse frame))
                                      fd-table file-table))
                *enotdir*)))
   :hints
   (("goal"
     :do-not-induct t
     :expand
     ((:with abs-pwrite-correctness-lemma-1
             (:free (file)
                    (hifat-place-file
                     (mv-nth 0 (collapse frame))
                     (file-table-element->fid
                      (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                        file-table)))
                     file)))))))

  (defthm
    abs-pwrite-correctness-1
    (implies
     (good-frame-p frame)
     (and (frame-reps-fs
           (mv-nth 0
                   (abs-pwrite fd
                               buf offset frame fd-table file-table))
           (mv-nth 0
                   (hifat-pwrite fd
                                 buf offset (mv-nth 0 (collapse frame))
                                 fd-table file-table)))
          (equal (mv-nth 2
                         (abs-pwrite fd
                                     buf offset frame fd-table file-table))
                 (mv-nth 2
                         (hifat-pwrite fd
                                       buf offset (mv-nth 0 (collapse frame))
                                       fd-table file-table)))))
    :hints
    (("goal"
      :do-not-induct t
      :expand
      ((:with abs-pwrite-correctness-lemma-1
              (:free (file)
                     (hifat-place-file
                      (mv-nth 0 (collapse frame))
                      (file-table-element->fid
                       (cdr (assoc-equal (cdr (assoc-equal fd fd-table))
                                         file-table)))
                      file))))))
    :otf-flg t))

(defund abs-open (path fd-table file-table)
  (declare (xargs :guard (and (fat32-filename-list-p path)
                              (fd-table-p fd-table)
                              (file-table-p file-table))))
  (hifat-open path fd-table file-table))

(defund
  abs-pread
  (fd count offset frame fd-table file-table)
  (declare (xargs :guard (and (natp fd)
                              (natp count)
                              (natp offset)
                              (fd-table-p fd-table)
                              (file-table-p file-table)
                              (frame-p frame)
                              (consp (assoc-equal 0 frame)))))
  (b*
      ((fd-table (mbe :logic (fd-table-fix fd-table) :exec fd-table))
       (file-table (mbe :logic (file-table-fix file-table) :exec file-table))
       (fd-table-entry (assoc-equal fd fd-table))
       ((unless (consp fd-table-entry))
        (mv "" -1 *ebadf*))
       (file-table-entry (assoc-equal (cdr fd-table-entry)
                                      file-table))
       ((unless (consp file-table-entry))
        (mv "" -1 *ebadf*))
       (path (file-table-element->fid (cdr file-table-entry)))
       ((mv file error-code)
        (abs-find-file frame path))
       ((unless (m1-regular-file-p file))
        (mv "" -1 *eisdir*))
       ((unless (equal error-code 0))
        (mv "" -1 error-code))
       (new-offset (min (+ offset count)
                        (length (m1-file->contents file))))
       (buf (subseq (m1-file->contents file)
                    (min offset
                         (length (m1-file->contents file)))
                    new-offset)))
    (mv buf (length buf) 0)))

(defthm abs-pread-refinement
  (implies (good-frame-p frame)
           (equal (abs-pread fd
                             count offset frame fd-table file-table)
                  (hifat-pread fd
                               count offset (mv-nth 0 (collapse frame))
                               fd-table file-table)))
  :hints (("goal" :do-not-induct t
           :in-theory (e/d (abs-pread hifat-pread good-frame-p)
                           nil))))
