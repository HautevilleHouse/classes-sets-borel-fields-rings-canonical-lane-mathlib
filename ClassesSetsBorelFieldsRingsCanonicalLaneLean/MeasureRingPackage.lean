import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure RingOfSetsPackage (X : Type u) where
  carrier : Set (Set X)
  empty_mem : Set.empty ∈ carrier
  compl_mem : ∀ s ∈ carrier, sᶜ ∈ carrier
  union_mem : ∀ s t, s ∈ carrier → t ∈ carrier → s ∪ t ∈ carrier

structure RingMeasure {X : Type u} (R : RingOfSetsPackage X) where
  mu : Set X → ℝ≥0∞
  mu_empty : mu ∅ = 0
  mu_finite_additive : ∀ s t, s ∈ R.carrier → t ∈ R.carrier → s ∩ t = ∅ → mu (s ∪ t) = mu s + mu t

structure PreMeasurePackage {X : Type u} (R : RingOfSetsPackage X) where
  mu : Set X → ℝ≥0∞
  mu_empty : mu ∅ = 0
  mu_countably_additive : ∀ (f : ℕ → Set X), (∀ n, f n ∈ R.carrier) →
    (∀ n m, n ≠ m → f n ∩ f m = ∅) → (⋃ n, f n) ∈ R.carrier → mu (⋃ n, f n) = ∑' n, mu (f n)

structure PreMeasureEvidence {X : Type u} {R : RingOfSetsPackage X} (P : PreMeasurePackage R) where
  mu_empty_closed : P.mu_empty
  mu_countably_additive_closed : P.mu_countably_additive

def PreMeasureClosed {X : Type u} {R : RingOfSetsPackage X} (P : PreMeasurePackage R) : Prop :=
  P.mu_empty ∧ P.mu_countably_additive

theorem premeasure_closed_from_evidence {X : Type u} {R : RingOfSetsPackage X}
    (P : PreMeasurePackage R) (E : PreMeasureEvidence P) : PreMeasureClosed P := by
  exact And.intro E.mu_empty_closed E.mu_countably_additive_closed

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse