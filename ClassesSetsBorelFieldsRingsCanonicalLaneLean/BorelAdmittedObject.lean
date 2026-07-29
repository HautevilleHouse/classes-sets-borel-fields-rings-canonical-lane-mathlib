import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure BorelSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BorelAdmittedObject where
  space : BorelSpace
  sigmaAlgebra : Prop
  borelSets : Prop
  measureDefined : Prop
  conclusion : measureDefined

def BorelWitnessClosed (O : BorelAdmittedObject) : Prop :=
  O.measureDefined

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse