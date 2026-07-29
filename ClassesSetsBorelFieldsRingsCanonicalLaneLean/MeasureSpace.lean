import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure Measure (X : Type u) (Σ : SigmaAlgebra X) where
  m : Set X → ℝ≥0∞
  emptyZero : m ∅ = 0
  countablyAdditive : ∀ (f : ℕ → Set X), (∀ n, f n ∈ Σ.sets) → Pairwise (fun i j => Disjoint (f i) (f j)) → m (⋃ n, f n) = ∑' n, m (f n)

theorem measure_empty_zero (μ : Measure X Σ) : μ.m ∅ = 0 := μ.emptyZero

theorem measure_countably_additive (μ : Measure X Σ) (f : ℕ → Set X) (hf : ∀ n, f n ∈ Σ.sets) (hdisj : Pairwise (fun i j => Disjoint (f i) (f j))) : μ.m (⋃ n, f n) = ∑' n, μ.m (f n) :=
  μ.countablyAdditive f hf hdisj

structure MeasureSpace (X : Type u) [TopologicalSpace X] where
  σ : SigmaAlgebra X
  μ : Measure X σ
  borel : BorelSigmaAlgebra X
  borel_eq : borel.sigmaAlg = σ

theorem measure_space_measure_empty (M : MeasureSpace X) : M.μ.m ∅ = 0 := M.μ.emptyZero

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse