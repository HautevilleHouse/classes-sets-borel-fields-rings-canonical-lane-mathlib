import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure AdmissibleClass where
  object : BorelAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BorelWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse