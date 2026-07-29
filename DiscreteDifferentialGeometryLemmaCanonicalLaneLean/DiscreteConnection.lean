import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteMetricPackage

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteConnection (M : DiscreteMetricPackage) where
  parallelTransport : M.edges → (M.vertices → ℝ) → (M.vertices → ℝ)
  linearOverℝ : Prop
  metricCompatible : Prop
  torsionFree : Prop
  linearOverℝClosed : linearOverℝ
  metricCompatibleClosed : metricCompatible
  torsionFreeClosed : torsionFree

structure DiscreteConnectionEvidence {M : DiscreteMetricPackage} (∇ : DiscreteConnection M) where
  linearOverℝClosed : ∇.linearOverℝ
  metricCompatibleClosed : ∇.metricCompatible
  torsionFreeClosed : ∇.torsionFree

def DiscreteConnectionClosed {M : DiscreteMetricPackage} (∇ : DiscreteConnection M) : Prop :=
  ∇.linearOverℝ ∧ ∇.metricCompatible ∧ ∇.torsionFree

theorem discrete_connection_closed_from_evidence {M : DiscreteMetricPackage} (∇ : DiscreteConnection M) (E : DiscreteConnectionEvidence ∇) :
    DiscreteConnectionClosed ∇ := by
  exact And.intro E.linearOverℝClosed (And.intro E.metricCompatibleClosed E.torsionFreeClosed)

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse