import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure Field where
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
  mulComm : ∀ a b : carrier, mul a b = mul b a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  nonzeroInverse : ∀ a : carrier, a ≠ zero → ∃ b : carrier, mul a b = one

structure FieldEvidence (F : Field) where
  addAssocClosed : F.addAssoc
  zeroLeftAddClosed : F.zeroLeftAdd
  addLeftInverseClosed : F.addLeftInverse
  addCommClosed : F.addComm
  mulAssocClosed : F.mulAssoc
  oneLeftMulClosed : F.oneLeftMul
  oneRightMulClosed : F.oneRightMul
  mulCommClosed : F.mulComm
  leftDistribClosed : F.leftDistrib
  rightDistribClosed : F.rightDistrib
  nonzeroInverseClosed : F.nonzeroInverse

def FieldClosed (F : Field) : Prop :=
  F.addAssoc ∧ F.zeroLeftAdd ∧ F.addLeftInverse ∧ F.addComm ∧
  F.mulAssoc ∧ F.oneLeftMul ∧ F.oneRightMul ∧ F.mulComm ∧
  F.leftDistrib ∧ F.rightDistrib ∧ F.nonzeroInverse

theorem field_closed_from_evidence (F : Field) (E : FieldEvidence F) : FieldClosed F := by
  exact And.intro E.addAssocClosed
    (And.intro E.zeroLeftAddClosed
      (And.intro E.addLeftInverseClosed
        (And.intro E.addCommClosed
          (And.intro E.mulAssocClosed
            (And.intro E.oneLeftMulClosed
              (And.intro E.oneRightMulClosed
                (And.intro E.mulCommClosed
                  (And.intro E.leftDistribClosed
                    (And.intro E.rightDistribClosed E.nonzeroInverseClosed)))))))))

end HautevilleHouse.ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse