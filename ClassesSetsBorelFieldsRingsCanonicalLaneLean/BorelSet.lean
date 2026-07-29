import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesSetsBorelFieldsRingsCanonicalLaneLean.SigmaAlgebra

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure BorelSetPackage (X : Type u) [TopologicalSpace X] where
  sigmaAlgebra : SigmaAlgebraPackage X
  includesAllOpenSets : ∀ s : Set X, IsOpen s → s ∈ sigmaAlgebra.sigmaAlgebra

structure BorelSetEvidence {X : Type u} [TopologicalSpace X] (B : BorelSetPackage X) where
  includesAllOpenSetsClosed : B.includesAllOpenSets

def BorelSetClosed {X : Type u} [TopologicalSpace X] (B : BorelSetPackage X) : Prop :=
  SigmaAlgebraClosed B.sigmaAlgebra ∧ B.includesAllOpenSets

theorem borel_set_closed_from_evidence {X : Type u} [TopologicalSpace X] (B : BorelSetPackage X)
    (E : BorelSetEvidence B) : BorelSetClosed B := by
  refine And.intro ?_ E.includesAllOpenSetsClosed
  exact sigma_algebra_closed_from_evidence B.sigmaAlgebra B.sigmaAlgebra.containsEmptyClosed

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse