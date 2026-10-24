{-# OPTIONS --safe --without-K #-}
module Lab01 where

data Bottom : Set where

data Product (A B : Set) : Set where
  pair : A → B → Product A B

data Sum (A B : Set) : Set where
  left  : A → Sum A B
  right : B → Sum A B

identity : {A : Set} → A → A
identity a = a

constant : {A B : Set} → A → B → A
constant a b = a

compose : {A B C : Set} → (B → C) → (A → B) → A → C
compose f g a = f (g a)

swap : {A B : Set} → Product A B → Product B A
swap (pair a b) = pair b a

cases : {A B C : Set} → (A → C) → (B → C) → Sum A B → C
cases f g (left a) = f a
cases f g (right b) = g b

absurd : {A : Set} → Bottom → A
absurd ()

distribute : {A B C : Set} → Product A (Sum B C) → Sum (Product A B) (Product A C)
distribute (pair a (left b)) = left (pair a b)
distribute (pair a (right c)) = right (pair a c)

factor : {A B C : Set} → Sum (Product A B) (Product A C) → Product A (Sum B C)
factor (left (pair a b)) = pair a (left b)
factor (right (pair a c)) = pair a (right c)
