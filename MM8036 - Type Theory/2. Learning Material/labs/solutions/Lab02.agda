{-# OPTIONS --safe --without-K #-}
module Lab02 where

data Nat : Set where
  zero : Nat
  suc  : Nat → Nat

infix 4 _==_
data _==_ {A : Set} (x : A) : A → Set where
  refl : x == x

cong : {A B : Set} (f : A → B) {x y : A} → x == y → f x == f y
cong f refl = refl

infixl 6 _+_
_+_ : Nat → Nat → Nat
zero + n = n
suc m + n = suc (m + n)

zero-left : (n : Nat) → zero + n == n
zero-left n = refl

zero-right : (n : Nat) → n + zero == n
zero-right zero = refl
zero-right (suc n) = cong suc (zero-right n)

associative : (a b c : Nat) → (a + b) + c == a + (b + c)
associative zero b c = refl
associative (suc a) b c = cong suc (associative a b c)

one two four : Nat
one = suc zero
two = suc one
four = suc (suc two)

two-plus-two : two + two == four
two-plus-two = refl
