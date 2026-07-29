import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteEndpointClassification

/-!
# Discrete Ricci Flow Analytic Foundation
-/

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteRicciFlowAnalyticFoundation where
  curvature : DiscreteCurvaturePackage
  curvatureEvidence : DiscreteCurvatureEvidence curvature
  flow : DiscreteRicciFlowPackage curvature
  flowEvidence : DiscreteRicciFlowEvidence flow
  shortTime : DiscreteShortTimeExistencePackage flow
  shortTimeEvidence : DiscreteShortTimeExistenceEvidence shortTime
  entropy : DiscreteEntropyPackage shortTime
  entropyEvidence : DiscreteEntropyEvidence entropy
  noncollapsing : DiscreteNoncollapsingPackage entropy
  noncollapsingEvidence : DiscreteNoncollapsingEvidence noncollapsing
  singularityModels : DiscreteSingularityModelsPackage noncollapsing
  singularityModelsEvidence : DiscreteSingularityModelsEvidence singularityModels
  canonicalNeighborhoods : DiscreteCanonicalNeighborhoodsPackage singularityModels
  canonicalNeighborhoodsEvidence : DiscreteCanonicalNeighborhoodsEvidence canonicalNeighborhoods
  surgery : DiscreteSurgeryPackage canonicalNeighborhoods
  surgeryEvidence : DiscreteSurgeryEvidence surgery
  geometrization : DiscreteGeometrizationPackage surgery
  geometrizationEvidence : DiscreteGeometrizationEvidence geometrization
  endpoint : DiscreteEndpointClassificationPackage geometrization
  endpointEvidence : DiscreteEndpointClassificationEvidence endpoint

def DiscreteRicciFlowAnalyticFoundationClosed (A : DiscreteRicciFlowAnalyticFoundation) : Prop :=
  DiscreteCurvatureClosed A.curvature ∧
  DiscreteRicciFlowClosed A.flow ∧
  DiscreteShortTimeExistenceClosed A.shortTime ∧
  DiscreteEntropyClosed A.entropy ∧
  DiscreteNoncollapsingClosed A.noncollapsing ∧
  DiscreteSingularityModelsClosed A.singularityModels ∧
  DiscreteCanonicalNeighborhoodsClosed A.canonicalNeighborhoods ∧
  DiscreteSurgeryClosed A.surgery ∧
  DiscreteGeometrizationClosed A.geometrization ∧
  DiscreteEndpointClassificationClosed A.endpoint

theorem discrete_ricci_flow_analytic_foundation_closed_from_evidence
    (A : DiscreteRicciFlowAnalyticFoundation) :
    DiscreteRicciFlowAnalyticFoundationClosed A := by
  exact And.intro (discrete_curvature_closed_from_evidence A.curvature A.curvatureEvidence)
    (And.intro (discrete_ricci_flow_closed_from_evidence A.flow A.flowEvidence)
      (And.intro (discrete_short_time_existence_closed_from_evidence A.shortTime A.shortTimeEvidence)
        (And.intro (discrete_entropy_closed_from_evidence A.entropy A.entropyEvidence)
          (And.intro (discrete_noncollapsing_closed_from_evidence A.noncollapsing A.noncollapsingEvidence)
            (And.intro (discrete_singularity_models_closed_from_evidence A.singularityModels A.singularityModelsEvidence)
              (And.intro (discrete_canonical_neighborhoods_closed_from_evidence A.canonicalNeighborhoods A.canonicalNeighborhoodsEvidence)
                (And.intro (discrete_surgery_closed_from_evidence A.surgery A.surgeryEvidence)
                  (And.intro (discrete_geometrization_closed_from_evidence A.geometrization A.geometrizationEvidence)
                    (discrete_endpoint_classification_closed_from_evidence A.endpoint A.endpointEvidence)))))))))

/-- The analytic foundation supplies Mathlib's 3-dimensional sphere endpoint. -/
theorem discrete_ricci_flow_analytic_foundation_supplies_sphere_endpoint
    (A : DiscreteRicciFlowAnalyticFoundation) :
    @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere
      A.endpoint.targetSimplicialComplex A.endpoint.targetTopology 3 :=
  discrete_endpoint_classification_supplies_mathlib_statement A.endpoint

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
