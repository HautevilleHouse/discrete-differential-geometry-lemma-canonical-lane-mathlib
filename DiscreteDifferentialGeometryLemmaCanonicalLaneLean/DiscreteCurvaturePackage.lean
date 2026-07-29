import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteCurvaturePackage where
  vertexSet : Type u
  edgeSet : Type v
  curvatureFunction : Type w
  smoothMatching : Prop
  curvatureDefectClosed : Prop

structure DiscreteCurvatureEvidence (G : DiscreteCurvaturePackage) where
  smoothMatchingClosed : G.smoothMatching
  curvatureDefectClosedClosed : G.curvatureDefectClosed

def DiscreteCurvatureClosed (G : DiscreteCurvaturePackage) : Prop :=
  G.smoothMatching ∧ G.curvatureDefectClosed

theorem discrete_curvature_closed_from_evidence
    (G : DiscreteCurvaturePackage) (E : DiscreteCurvatureEvidence G) :
    DiscreteCurvatureClosed G := by
  exact And.intro E.smoothMatchingClosed E.curvatureDefectClosedClosed

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse