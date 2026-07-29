import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure AdditiveClass where
  carrier : Type u
  zero : carrier
  add : carrier → carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zeroLeftAdd : ∀ a : carrier, add zero a = a
  addLeftInverse : ∀ a : carrier, ∃ b : carrier, add b a = zero
  addComm : ∀ a b : carrier, add a b = add b a

structure AdditiveClassEvidence (C : AdditiveClass) where
  addAssocClosed : C.addAssoc
  zeroLeftAddClosed : C.zeroLeftAdd
  addLeftInverseClosed : C.addLeftInverse
  addCommClosed : C.addComm

def AdditiveClassClosed (C : AdditiveClass) : Prop :=
  C.addAssoc ∧ C.zeroLeftAdd ∧ C.addLeftInverse ∧ C.addComm

theorem additive_class_closed_from_evidence (C : AdditiveClass) (E : AdditiveClassEvidence C) :
    AdditiveClassClosed C := by
  exact And.intro E.addAssocClosed (And.intro E.zeroLeftAddClosed
    (And.intro E.addLeftInverseClosed E.addCommClosed))

end HautevilleHouse.ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse