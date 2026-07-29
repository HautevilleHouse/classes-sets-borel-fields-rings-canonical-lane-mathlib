import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure SigmaAlgebraPackage (X : Type u) where
  carrier : Set (Set X)
  empty_mem : Set.empty ∈ carrier
  compl_mem : ∀ s ∈ carrier, sᶜ ∈ carrier
  union_countable_mem : ∀ f : ℕ → Set X, (∀ n, f n ∈ carrier) → (⋃ n, f n) ∈ carrier

structure BorelSetPackage (X : Type u) [TopologicalSpace X] where
  sigmaAlgebra : SigmaAlgebraPackage X
  open_generates : ∀ (U : Set X), IsOpen U → U ∈ sigmaAlgebra.carrier

structure BorelMeasure {X : Type u} [TopologicalSpace X] (B : BorelSetPackage X) where
  mu : Set X → ℝ≥0∞
  mu_empty : mu ∅ = 0
  mu_union_countably_disjoint : ∀ (f : ℕ → Set X), (∀ n, f n ∈ B.sigmaAlgebra.carrier) →
    (∀ n m, n ≠ m → f n ∩ f m = ∅) → mu (⋃ n, f n) = ∑' n, mu (f n)

structure BorelEvidence {X : Type u} [TopologicalSpace X] (B : BorelSetPackage X) where
  open_generates_closed : B.open_generates

def BorelClosed {X : Type u} [TopologicalSpace X] (B : BorelSetPackage X) : Prop :=
  B.open_generates

theorem borel_closed_from_evidence {X : Type u} [TopologicalSpace X] (B : BorelSetPackage X)
    (E : BorelEvidence B) : BorelClosed B := by
  exact E.open_generates_closed

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse