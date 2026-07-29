import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSetsBorelFieldsRingsCanonicalLaneLean

structure BorelSigmaAlgebra (X : Type u) [TopologicalSpace X] where
  sigmaAlg : SigmaAlgebra X
  containsOpen : ∀ U : Set X, IsOpen U → U ∈ sigmaAlg.sets

theorem borel_sigma_algebra_contains_open (B : BorelSigmaAlgebra X) (U : Set X) (hU : IsOpen U) : U ∈ B.sigmaAlg.sets :=
  B.containsOpen U hU

theorem borel_sigma_algebra_contains_closed (B : BorelSigmaAlgebra X) (C : Set X) (hC : IsClosed C) : C ∈ B.sigmaAlg.sets := by
  have : Cᶜ ∈ B.sigmaAlg.sets := B.containsOpen Cᶜ (isOpen_compl_iff.mpr hC)
  simpa [Set.compl_compl] using B.sigmaAlg.complMem (Cᶜ) this

end ClassesSetsBorelFieldsRingsCanonicalLaneLean
end HautevilleHouse