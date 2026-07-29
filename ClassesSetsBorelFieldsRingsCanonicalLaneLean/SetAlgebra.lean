import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure SetAlgebra (X : Type u) where
  carrier : Set (Set X)
  containsEmpty : ∅ ∈ carrier
  closedUnderCompl : ∀ s ∈ carrier, sᶜ ∈ carrier
  closedUnderUnion : ∀ s t ∈ carrier, s ∪ t ∈ carrier

def SetAlgebra.carrier (A : SetAlgebra X) : Set (Set X) := A.carrier

theorem set_algebra_contains_empty (A : SetAlgebra X) : ∅ ∈ A.carrier := A.containsEmpty

theorem set_algebra_closed_under_compl (A : SetAlgebra X) (s : Set X) (hs : s ∈ A.carrier) : sᶜ ∈ A.carrier := A.closedUnderCompl s hs

theorem set_algebra_closed_under_union (A : SetAlgebra X) (s t : Set X) (hs : s ∈ A.carrier) (ht : t ∈ A.carrier) : s ∪ t ∈ A.carrier := A.closedUnderUnion s t hs ht

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse