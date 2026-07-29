import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteConnection

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteCurvature {M : DiscreteMetricPackage} (∇ : DiscreteConnection M) where
  riemannTensor : M.edges → M.edges → (M.vertices → ℝ) → (M.vertices → ℝ)
  ricciCurvature : M.vertices → ℝ
  scalarCurvature : ℝ
  symmetriesHeld : Prop
  contractedBianchi : Prop
  symmetriesHeldClosed : symmetriesHeld
  contractedBianchiClosed : contractedBianchi

structure DiscreteCurvatureEvidence {M : DiscreteMetricPackage} {∇ : DiscreteConnection M} (K : DiscreteCurvature ∇) where
  symmetriesHeldClosed : K.symmetriesHeld
  contractedBianchiClosed : K.contractedBianchi

def DiscreteCurvatureClosed {M : DiscreteMetricPackage} {∇ : DiscreteConnection M} (K : DiscreteCurvature ∇) : Prop :=
  K.symmetriesHeld ∧ K.contractedBianchi

theorem discrete_curvature_closed_from_evidence {M : DiscreteMetricPackage} {∇ : DiscreteConnection M} (K : DiscreteCurvature ∇) (E : DiscreteCurvatureEvidence K) :
    DiscreteCurvatureClosed K := by
  exact And.intro E.symmetriesHeldClosed E.contractedBianchiClosed

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse