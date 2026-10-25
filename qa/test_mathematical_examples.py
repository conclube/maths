"""Independent finite enumerations checking selected newly authored claims."""
import itertools
import unittest
from collections import Counter

def mul(a,b,mod,degree):
    result=0
    while b:
        if b&1:result^=a
        b>>=1;a<<=1
        if a&(1<<degree):a^=mod
    return result

def power(a,n,mod,degree):
    result=1
    while n:
        if n&1:result=mul(result,a,mod,degree)
        a=mul(a,a,mod,degree);n>>=1
    return result

class FiniteExamples(unittest.TestCase):
    def test_square_orbits(self):
        permutations=[tuple((k+i)%4 for i in range(4)) for k in range(4)]
        permutations += [tuple((k-i)%4 for i in range(4)) for k in range(4)]
        representatives={min(tuple(c[i] for i in p) for p in permutations)
                         for c in itertools.product(range(3),repeat=4)}
        self.assertEqual(len(representatives),21)

    def test_kernel_and_idempotents(self):
        kernel={(a,b) for a in range(12) for b in range(18) if (a+b)%6==0}
        generated={(n%12,-n%18) for n in range(36)}
        self.assertEqual(kernel,generated)
        self.assertEqual(len(kernel),36)
        self.assertEqual([x for x in range(12) if (x*x-x)%12==0],[0,1,4,9])

    def test_finite_field_counts(self):
        for degree,modulus in [(2,0b111),(4,0b10011),(6,0b1000011)]:
            with self.subTest(degree=degree):
                size=1<<degree
                # Verify the chosen quotient is a field before relying on its arithmetic.
                self.assertTrue(all(any(mul(a,b,modulus,degree)==1 for b in range(1,size))
                                    for a in range(1,size)))
                if degree==6:
                    count=sum(all(power(a,1<<d,modulus,degree)!=a for d in (1,2,3)) for a in range(size))
                    self.assertEqual(count,54)
                else:
                    q=1<<(degree//2)
                    fibers=Counter(power(a,q,modulus,degree)^a for a in range(size))
                    self.assertEqual(sorted(fibers.values()),[q]*q)

if __name__=='__main__':unittest.main()
