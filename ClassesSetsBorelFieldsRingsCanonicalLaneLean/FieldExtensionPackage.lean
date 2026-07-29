import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure FieldExtensionPackage (K : Type u) [Field K] (L : Type v) [Field L] where
  includes : K → L
  ringHom : ∀ x y, includes (x + y) = includes x + includes y ∧ includes (x * y) = includes x * includes y
  includes_one : includes 1 = 1

def AlgebraicElement {K : Type u} [Field K] {L : Type v} [Field L] (F : FieldExtensionPackage K L) (α : L) : Prop :=
  ∃ p : Polynomial K, p ≠ 0 ∧ (Polynomial.eval (F.includes) p) = 0

structure FiniteExtensionPackage {K : Type u} [Field K] {L : Type v} [Field L]
    (F : FieldExtensionPackage K L) where
  finiteBasis : Basis (FiniteDimensional.finrank K L) K L
  basis_linear_independent : linearIndependent K (finiteBasis)
  basis_span : ⊤.carrier = Submodule.span K (Set.range finiteBasis)

structure ExtensionEvidence {K : Type u} [Field K] {L : Type v} [Field L]
    (F : FieldExtensionPackage K L) where
  ringHom_closed : ∀ x y, F.includes (x + y) = F.includes x + F.includes y ∧ F.includes (x * y) = F.includes x * F.includes y
  includes_one_closed : F.includes 1 = 1

def FieldExtensionClosed {K : Type u} [Field K] {L : Type v} [Field L] (F : FieldExtensionPackage K L) : Prop :=
  (∀ x y, F.includes (x + y) = F.includes x + F.includes y ∧ F.includes (x * y) = F.includes x * F.includes y) ∧
  F.includes 1 = 1

theorem field_extension_closed_from_evidence {K : Type u} [Field K] {L : Type v} [Field L]
    (F : FieldExtensionPackage K L) (E : ExtensionEvidence F) : FieldExtensionClosed F := by
  exact And.intro E.ringHom_closed E.includes_one_closed

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse