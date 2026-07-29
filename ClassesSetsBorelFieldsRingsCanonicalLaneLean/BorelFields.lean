import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure BorelField where
  underlyingSet : Type u
  topology : TopologicalSpace underlyingSet
  borelSigmaAlgebra : Set (Set underlyingSet)
  allOpenSetsIncluded : ∀ s : Set underlyingSet, IsOpen s → s ∈ borelSigmaAlgebra
  sigmaAlgebraClosedUnderCountableUnions : Prop
  sigmaAlgebraContainsEmpty : Set.empty ∈ borelSigmaAlgebra
  smallestSigmaAlgebraContainingOpens : Prop

structure BorelFieldEvidence (B : BorelField) where
  allOpenSetsIncludedClosed : B.allOpenSetsIncluded
  sigmaAlgebraClosedUnderCountableUnionsClosed : B.sigmaAlgebraClosedUnderCountableUnions
  sigmaAlgebraContainsEmptyClosed : B.sigmaAlgebraContainsEmpty
  smallestSigmaAlgebraContainingOpensClosed : B.smallestSigmaAlgebraContainingOpens

def BorelFieldClosed (B : BorelField) : Prop :=
  B.allOpenSetsIncluded ∧ B.sigmaAlgebraClosedUnderCountableUnions ∧
  B.sigmaAlgebraContainsEmpty ∧ B.smallestSigmaAlgebraContainingOpens

theorem borel_field_closed_from_evidence (B : BorelField) (E : BorelFieldEvidence B) :
    BorelFieldClosed B := by
  exact And.intro E.allOpenSetsIncludedClosed
    (And.intro E.sigmaAlgebraClosedUnderCountableUnionsClosed
      (And.intro E.sigmaAlgebraContainsEmptyClosed E.smallestSigmaAlgebraContainingOpensClosed))

end HautevilleHouse.ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse