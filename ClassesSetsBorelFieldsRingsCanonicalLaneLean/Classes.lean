import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure Class where
  obj : Type u
  membership : obj → Prop
  extensionality : ∀ x y : obj, (membership x ↔ membership y) → x = y
  comprehension : Prop

structure ClassEvidence (C : Class) where
  extensionalityClosed : C.extensionality
  comprehensionClosed : C.comprehension

def ClassClosed (C : Class) : Prop :=
  C.extensionality ∧ C.comprehension

theorem class_closed_from_evidence (C : Class) (E : ClassEvidence C) : ClassClosed C := by
  exact And.intro E.extensionalityClosed E.comprehensionClosed

end HautevilleHouse.ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse