import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesSetsBorelFieldsRingsCanonicalLaneLean.SigmaAlgebra
import HautevilleHouse.ClassesSetsBorelFieldsRingsCanonicalLaneLean.BorelSet

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure MeasurableSpacePackage (X : Type u) where
  sigmaAlgebra : SigmaAlgebraPackage X

structure MeasurableSpaceEvidence {X : Type u} (M : MeasurableSpacePackage X) where
  sigmaAlgebraEvidence : SigmaAlgebraEvidence M.sigmaAlgebra

def MeasurableSpaceClosed {X : Type u} (M : MeasurableSpacePackage X) : Prop :=
  SigmaAlgebraClosed M.sigmaAlgebra

theorem measurable_space_closed_from_evidence {X : Type u} (M : MeasurableSpacePackage X)
    (E : MeasurableSpaceEvidence M) : MeasurableSpaceClosed M := by
  exact sigma_algebra_closed_from_evidence M.sigmaAlgebra E.sigmaAlgebraEvidence

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse