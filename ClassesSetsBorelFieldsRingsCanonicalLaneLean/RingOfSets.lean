import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure RingOfSets (X : Type u) where
  carrier : Set (Set X)
  emptyMem : ∅ ∈ carrier
  closedUnderDiff : ∀ s t ∈ carrier, s \ t ∈ carrier
  closedUnderUnion : ∀ s t ∈ carrier, s ∪ t ∈ carrier

theorem ring_of_sets_contains_empty (R : RingOfSets X) : ∅ ∈ R.carrier := R.emptyMem

theorem ring_of_sets_closed_under_diff (R : RingOfSets X) (s t : Set X) (hs : s ∈ R.carrier) (ht : t ∈ R.carrier) : s \ t ∈ R.carrier := R.closedUnderDiff s t hs ht

theorem ring_of_sets_closed_under_union (R : RingOfSets X) (s t : Set X) (hs : s ∈ R.carrier) (ht : t ∈ R.carrier) : s ∪ t ∈ R.carrier := R.closedUnderUnion s t hs ht

theorem ring_of_sets_closed_under_inter (R : RingOfSets X) (s t : Set X) (hs : s ∈ R.carrier) (ht : t ∈ R.carrier) : s ∩ t ∈ R.carrier := by
  have : s ∩ t = s \ (s \ t) := by
    ext x; simp
  rw [this]
  exact R.closedUnderDiff s (s \ t) hs (R.closedUnderDiff s s hs hs)

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse