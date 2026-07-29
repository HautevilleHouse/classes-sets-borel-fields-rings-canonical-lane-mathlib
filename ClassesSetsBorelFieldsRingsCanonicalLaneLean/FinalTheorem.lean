import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

def ConstrainedBorelFieldExtensionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_borel_field_extension_endgame (A : AdmissibleClass) :
    ConstrainedBorelFieldExtensionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse