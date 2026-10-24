{-# OPTIONS --safe --without-K #-}
module Lab04 where
-- Exercises: replace each ? by a term or pattern-matching clauses. See the handbook.

infix 4 _==_
data _==_ {A : Set} (x : A) : A → Set where
  refl : x == x

sym : {A : Set} {x y : A} → x == y → y == x
sym = ?

trans : {A : Set} {x y z : A} → x == y → y == z → x == z
trans = ?

cong : {A B : Set} (f : A → B) {x y : A} → x == y → f x == f y
cong = ?

transport : {A : Set} (P : A → Set) {x y : A} → x == y → P x → P y
transport = ?

transport-refl : {A : Set} (P : A → Set) {x : A} (px : P x) → transport P refl px == px
transport-refl = ?

transport-compose : {A : Set} (P : A → Set) {x y z : A}
                  (p : x == y) (q : y == z) (px : P x) →
                  transport P q (transport P p px) == transport P (trans p q) px
transport-compose = ?

data Nat : Set where
  zero : Nat
  suc : Nat → Nat

data Vec (A : Set) : Nat → Set where
  nil : Vec A zero
  cons : {n : Nat} → A → Vec A n → Vec A (suc n)

cast : {A : Set} {m n : Nat} → m == n → Vec A m → Vec A n
cast = ?

cast-refl : {A : Set} {n : Nat} (xs : Vec A n) → cast refl xs == xs
cast-refl = ?
