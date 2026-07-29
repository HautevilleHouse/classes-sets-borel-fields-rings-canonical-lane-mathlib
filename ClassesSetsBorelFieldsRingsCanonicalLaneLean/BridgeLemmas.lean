import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BorelWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse