import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure Ring where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zeroLeftAdd : ∀ a : carrier, add zero a = a
  addLeftInverse : ∀ a : carrier, ∃ b : carrier, add b a = zero
  addComm : ∀ a b : carrier, add a b = add b a
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  oneLeftMul : ∀ a : carrier, mul one a = a
  oneRightMul : ∀ a : carrier, mul a one = a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)

structure RingEvidence (R : Ring) where
  addAssocClosed : R.addAssoc
  zeroLeftAddClosed : R.zeroLeftAdd
  addLeftInverseClosed : R.addLeftInverse
  addCommClosed : R.addComm
  mulAssocClosed : R.mulAssoc
  oneLeftMulClosed : R.oneLeftMul
  oneRightMulClosed : R.oneRightMul
  leftDistribClosed : R.leftDistrib
  rightDistribClosed : R.rightDistrib

def RingClosed (R : Ring) : Prop :=
  R.addAssoc ∧ R.zeroLeftAdd ∧ R.addLeftInverse ∧ R.addComm ∧
  R.mulAssoc ∧ R.oneLeftMul ∧ R.oneRightMul ∧ R.leftDistrib ∧ R.rightDistrib

theorem ring_closed_from_evidence (R : Ring) (E : RingEvidence R) : RingClosed R := by
  exact And.intro E.addAssocClosed
    (And.intro E.zeroLeftAddClosed
      (And.intro E.addLeftInverseClosed
        (And.intro E.addCommClosed
          (And.intro E.mulAssocClosed
            (And.intro E.oneLeftMulClosed
              (And.intro E.oneRightMulClosed
                (And.intro E.leftDistribClosed E.rightDistribClosed)))))))

end HautevilleHouse.ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse