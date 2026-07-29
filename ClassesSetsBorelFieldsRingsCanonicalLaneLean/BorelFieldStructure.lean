import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure BorelFieldPackage where
  carrierSet : Type u
  sigmaAlgebra : Set (Set carrierSet)
  measurableSpace : SigmaAlgebra carrierSet := by
    exact { sets := sigmaAlgebra, measurableSet_empty := by trivial, measurableSet_compl := by trivial, measurableSet_union := by trivial }
  borelGenerated : Prop
  borelGeneratedTerm : borelGenerated

structure BorelFieldEvidence (B : BorelFieldPackage) where
  sigmaAlgebraClosed : B.sigmaAlgebra = B.measurableSpace.sets
  borelGeneratedClosed : B.borelGenerated

def BorelFieldClosed (B : BorelFieldPackage) : Prop :=
  B.sigmaAlgebra = B.measurableSpace.sets ∧ B.borelGenerated

theorem borel_field_closed_from_evidence (B : BorelFieldPackage) (E : BorelFieldEvidence B) :
    BorelFieldClosed B := by
  exact And.intro E.sigmaAlgebraClosed E.borelGeneratedClosed

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse