{-# OPTIONS --safe --without-K #-}
module Lab01 where
-- Exercises: replace each ? by a term or pattern-matching clauses. See the handbook.

data Bottom : Set where

data Product (A B : Set) : Set where
  pair : A → B → Product A B

data Sum (A B : Set) : Set where
  left  : A → Sum A B
  right : B → Sum A B

identity : {A : Set} → A → A
identity = ?

constant : {A B : Set} → A → B → A
constant = ?

compose : {A B C : Set} → (B → C) → (A → B) → A → C
compose = ?

swap : {A B : Set} → Product A B → Product B A
swap = ?

cases : {A B C : Set} → (A → C) → (B → C) → Sum A B → C
cases = ?

absurd : {A : Set} → Bottom → A
absurd = ?

distribute : {A B C : Set} → Product A (Sum B C) → Sum (Product A B) (Product A C)
distribute = ?

factor : {A B C : Set} → Sum (Product A B) (Product A C) → Product A (Sum B C)
factor = ?
