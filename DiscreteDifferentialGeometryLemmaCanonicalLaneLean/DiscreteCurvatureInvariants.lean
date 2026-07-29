import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteRiemannianCurvaturePackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  discreteMetric : Type v
  riemannCurvatureTensor : Type w
  ricciTensor : Type x
  scalarCurvature : Type y
  smoothThreeManifold : Prop
  metricSmooth : Prop
  riemannTensorLawful : Prop
  ricciTensorContractedFromRiemann : Prop
  scalarCurvatureTraceOfRicci : Prop

structure DiscreteRiemannianCurvatureEvidence (G : DiscreteRiemannianCurvaturePackage) where
  smoothThreeManifoldClosed : G.smoothThreeManifold
  metricSmoothClosed : G.metricSmooth
  riemannTensorLawfulClosed : G.riemannTensorLawful
  ricciTensorContractedFromRiemannClosed : G.ricciTensorContractedFromRiemann
  scalarCurvatureTraceOfRicciClosed : G.scalarCurvatureTraceOfRicci

def DiscreteRiemannianCurvatureClosed (G : DiscreteRiemannianCurvaturePackage) : Prop :=
  G.smoothThreeManifold ∧
  G.metricSmooth ∧
  G.riemannTensorLawful ∧
  G.ricciTensorContractedFromRiemann ∧
  G.scalarCurvatureTraceOfRicci

theorem discrete_riemannian_curvature_closed_from_evidence
    (G : DiscreteRiemannianCurvaturePackage) (E : DiscreteRiemannianCurvatureEvidence G) :
    DiscreteRiemannianCurvatureClosed G := by
  exact And.intro E.smoothThreeManifoldClosed
    (And.intro E.metricSmoothClosed
      (And.intro E.riemannTensorLawfulClosed
        (And.intro E.ricciTensorContractedFromRiemannClosed
          E.scalarCurvatureTraceOfRicciClosed)))

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse