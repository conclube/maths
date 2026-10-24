{-# OPTIONS --safe --without-K #-}
module Lab04 where

infix 4 _==_
data _==_ {A : Set} (x : A) : A → Set where
  refl : x == x

sym : {A : Set} {x y : A} → x == y → y == x
sym refl = refl

trans : {A : Set} {x y z : A} → x == y → y == z → x == z
trans refl q = q

cong : {A B : Set} (f : A → B) {x y : A} → x == y → f x == f y
cong f refl = refl

transport : {A : Set} (P : A → Set) {x y : A} → x == y → P x → P y
transport P refl px = px

transport-refl : {A : Set} (P : A → Set) {x : A} (px : P x) → transport P refl px == px
transport-refl P px = refl

transport-compose : {A : Set} (P : A → Set) {x y z : A}
                  (p : x == y) (q : y == z) (px : P x) →
                  transport P q (transport P p px) == transport P (trans p q) px
transport-compose P refl refl px = refl

data Nat : Set where
  zero : Nat
  suc : Nat → Nat

data Vec (A : Set) : Nat → Set where
  nil : Vec A zero
  cons : {n : Nat} → A → Vec A n → Vec A (suc n)

cast : {A : Set} {m n : Nat} → m == n → Vec A m → Vec A n
cast {A} p xs = transport (Vec A) p xs

cast-refl : {A : Set} {n : Nat} (xs : Vec A n) → cast refl xs == xs
cast-refl xs = refl
