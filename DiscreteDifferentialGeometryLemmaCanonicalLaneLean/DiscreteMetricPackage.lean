import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteMetricPackage where
  vertices : Type u
  edges : Type v
  edgeLength : edges → ℝ
  triangleInequality : Prop
  positiveDefinite : Prop
  metricClosed : Prop

structure DiscreteMetricEvidence (M : DiscreteMetricPackage) where
  triangleInequalityClosed : M.triangleInequality
  positiveDefiniteClosed : M.positiveDefinite

def DiscreteMetricClosed (M : DiscreteMetricPackage) : Prop :=
  M.triangleInequality ∧ M.positiveDefinite

theorem discrete_metric_closed_from_evidence (M : DiscreteMetricPackage) (E : DiscreteMetricEvidence M) :
    DiscreteMetricClosed M := by
  exact And.intro E.triangleInequalityClosed E.positiveDefiniteClosed

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse