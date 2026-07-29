import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure FieldOfSets (X : Type u) where
  carrier : Set (Set X)
  emptyMem : ∅ ∈ carrier
  closedUnderCompl : ∀ s ∈ carrier, sᶜ ∈ carrier
  closedUnderUnion : ∀ s t ∈ carrier, s ∪ t ∈ carrier

theorem field_of_sets_contains_empty (F : FieldOfSets X) : ∅ ∈ F.carrier := F.emptyMem

theorem field_of_sets_closed_under_compl (F : FieldOfSets X) (s : Set X) (hs : s ∈ F.carrier) : sᶜ ∈ F.carrier := F.closedUnderCompl s hs

theorem field_of_sets_closed_under_union (F : FieldOfSets X) (s t : Set X) (hs : s ∈ F.carrier) (ht : t ∈ F.carrier) : s ∪ t ∈ F.carrier := F.closedUnderUnion s t hs ht

theorem field_of_sets_closed_under_inter (F : FieldOfSets X) (s t : Set X) (hs : s ∈ F.carrier) (ht : t ∈ F.carrier) : s ∩ t ∈ F.carrier := by
  have : s ∩ t = (sᶜ ∪ tᶜ)ᶜ := by
    ext x; simp
  rw [this]
  exact F.closedUnderCompl (sᶜ ∪ tᶜ) (F.closedUnderUnion (sᶜ) (tᶜ) (F.closedUnderCompl s hs) (F.closedUnderCompl t ht))

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse