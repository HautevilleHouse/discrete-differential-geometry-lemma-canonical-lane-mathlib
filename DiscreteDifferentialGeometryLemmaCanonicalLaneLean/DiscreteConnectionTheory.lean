import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteConnectionPackage {G : DiscreteRiemannianCurvaturePackage} where
  connectionForm : Type u
  curvatureForm : Type v
  torsionForm : Type w
  bianchiIdentities : Prop
  metricCompatibility : Prop

structure DiscreteConnectionEvidence {G : DiscreteRiemannianCurvaturePackage}
    (C : DiscreteConnectionPackage G) where
  bianchiIdentitiesClosed : C.bianchiIdentities
  metricCompatibilityClosed : C.metricCompatibility

def DiscreteConnectionClosed {G : DiscreteRiemannianCurvaturePackage}
    (C : DiscreteConnectionPackage G) : Prop :=
  C.bianchiIdentities ∧ C.metricCompatibility

theorem discrete_connection_closed_from_evidence
    {G : DiscreteRiemannianCurvaturePackage} (C : DiscreteConnectionPackage G)
    (E : DiscreteConnectionEvidence C) : DiscreteConnectionClosed C := by
  exact And.intro E.bianchiIdentitiesClosed E.metricCompatibilityClosed

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse