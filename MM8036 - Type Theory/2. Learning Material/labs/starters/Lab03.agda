{-# OPTIONS --safe --without-K #-}
module Lab03 where
-- Exercises: replace each ? by a term or pattern-matching clauses. See the handbook.

data Nat : Set where
  zero : Nat
  suc : Nat → Nat

infixl 6 _+_
_+_ : Nat → Nat → Nat
zero + n = n
suc m + n = suc (m + n)

infixr 5 _::_
data Vec (A : Set) : Nat → Set where
  nil : Vec A zero
  _::_ : {n : Nat} → A → Vec A n → Vec A (suc n)

map : {A B : Set} {n : Nat} → (A → B) → Vec A n → Vec B n
map = ?

append : {A : Set} {m n : Nat} → Vec A m → Vec A n → Vec A (m + n)
append = ?

head : {A : Set} {n : Nat} → Vec A (suc n) → A
head = ?

tail : {A : Set} {n : Nat} → Vec A (suc n) → Vec A n
tail = ?

replicate : {A : Set} (n : Nat) → A → Vec A n
replicate = ?

data Bool : Set where
  false true : Bool

sample : Vec Bool (suc (suc zero))
sample = true :: false :: nil

sample-appended : Vec Bool (suc (suc (suc (suc zero))))
sample-appended = append sample sample

infix 4 _==_
data _==_ {A : Set} (x : A) : A → Set where
  refl : x == x

cong : {A B : Set} (f : A → B) {x y : A} → x == y → f x == f y
cong f refl = refl

map-identity : {A : Set} {n : Nat} (xs : Vec A n) → map (λ x → x) xs == xs
map-identity = ?
