import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteCurvature

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteLaplaceBeltramiPackage where
  manifold : DiscreteRiemannianManifold
  laplacian : (vertices → ℝ) → (vertices → ℝ)
  harmonicFunctions : Set (vertices → ℝ)
  eigenvalues : List ℝ
  spectralGap : ℝ
  heatKernel : ℝ → ℝ → ℝ
  diffusionProperties : Prop

structure DiscreteLaplaceBeltramiEvidence (L : DiscreteLaplaceBeltramiPackage) where
  diffusionPropertiesClosed : L.diffusionProperties
  spectralGapPositive : L.spectralGap > 0

def DiscreteLaplaceBeltramiClosed (L : DiscreteLaplaceBeltramiPackage) : Prop :=
  L.diffusionProperties ∧ L.spectralGap > 0

theorem discrete_laplace_beltrami_closed_from_evidence (L : DiscreteLaplaceBeltramiPackage)
    (E : DiscreteLaplaceBeltramiEvidence L) : DiscreteLaplaceBeltramiClosed L := by
  exact And.intro E.diffusionPropertiesClosed E.spectralGapPositive

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse