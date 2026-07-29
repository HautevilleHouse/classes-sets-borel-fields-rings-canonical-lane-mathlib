import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure Set where
  elements : Type u
  membership : elements → Prop
  subset : Set → Prop
  powerset : Set
  union : Set → Set → Set
  intersection : Set → Set → Set

structure SetEvidence (S : Set) where
  subsetReflexive : ∀ T : Set, S.subset S
  subsetTransitive : ∀ A B C : Set, A.subset B → B.subset C → A.subset C
  unionCommutative : ∀ A B : Set, union A B = union B A
  intersectionCommutative : ∀ A B : Set, intersection A B = intersection B A

def SetClosed (S : Set) : Prop :=
  (∀ T : Set, S.subset S) ∧ (∀ A B C : Set, A.subset B → B.subset C → A.subset C) ∧
  (∀ A B : Set, union A B = union B A) ∧ (∀ A B : Set, intersection A B = intersection B A)

theorem set_closed_from_evidence (S : Set) (E : SetEvidence S) : SetClosed S := by
  exact And.intro E.subsetReflexive (And.intro E.subsetTransitive
    (And.intro E.unionCommutative E.intersectionCommutative))

end HautevilleHouse.ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse