import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure FieldPackage extends RingPackage where
  multiplicativeGroup : Group (carrierSet \ {zero}) := by
    exact { mul := λ a b => ⟨a.1 * b.1, by
      intro h
      apply a.2
      have h' : a.1 * b.1 = zero := h
      apply mul_eq_zero.mp h' |>.1
    ⟩, mul_assoc := by
      intro a b c; ext; apply mul_assoc
    , one := ⟨one, by
      intro h; have : one = zero := h; exact one_ne_zero this
    ⟩, one_mul := by intro a; ext; apply one_mul, mul_one := by intro a; ext; apply mul_one, inv := λ a => ⟨a.1⁻¹, by
      intro h; apply a.2; apply mul_eq_zero.mp (mul_inv_cancel (by exact a.2)).symm
    ⟩, mul_left_inv := by intro a; ext; apply mul_inv_cancel (by exact a.2) }
  fieldAxioms : Prop
  fieldAxiomsTerm : fieldAxioms

structure FieldEvidence (F : FieldPackage) where
  fieldAxiomsClosed : F.fieldAxioms

def FieldClosed (F : FieldPackage) : Prop :=
  F.fieldAxioms

theorem field_closed_from_evidence (F : FieldPackage) (E : FieldEvidence F) :
    FieldClosed F := by
  exact E.fieldAxiomsClosed

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse