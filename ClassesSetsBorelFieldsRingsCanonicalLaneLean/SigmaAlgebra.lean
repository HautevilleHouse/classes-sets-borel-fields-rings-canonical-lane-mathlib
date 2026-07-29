import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure SigmaAlgebra (X : Type u) where
  sets : Set (Set X)
  emptyMem : ∅ ∈ sets
  complMem : ∀ s ∈ sets, sᶜ ∈ sets
  unionCountableMem : ∀ (f : ℕ → Set X), (∀ n, f n ∈ sets) → (⋃ n, f n) ∈ sets

theorem sigma_algebra_contains_empty (Σ : SigmaAlgebra X) : ∅ ∈ Σ.sets := Σ.emptyMem

theorem sigma_algebra_closed_under_compl (Σ : SigmaAlgebra X) (s : Set X) (hs : s ∈ Σ.sets) : sᶜ ∈ Σ.sets := Σ.complMem s hs

theorem sigma_algebra_closed_under_countable_union (Σ : SigmaAlgebra X) (f : ℕ → Set X) (hf : ∀ n, f n ∈ Σ.sets) : (⋃ n, f n) ∈ Σ.sets :=
  Σ.unionCountableMem f hf

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse