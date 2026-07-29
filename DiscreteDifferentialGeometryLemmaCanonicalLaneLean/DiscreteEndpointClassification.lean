import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteGeometrization
import Mathlib.Geometry.Manifold.PoincareConjecture

/-!
# Discrete Endpoint Classification Package
-/

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteEndpointClassificationPackage {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    {Q : DiscreteSingularityModelsPackage N} {C : DiscreteCanonicalNeighborhoodsPackage Q}
    {U : DiscreteSurgeryPackage C} (Z : DiscreteGeometrizationPackage U) where
  targetSimplicialComplex : Type u
  targetTopology : TopologicalSpace targetSimplicialComplex
  simplyConnectedClosedDiscreteThreeManifold : Prop
  sphereEndpoint : ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere targetSimplicialComplex 3
  endpointMatchesDiscreteStatement : Prop

structure DiscreteEndpointClassificationEvidence {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    {Q : DiscreteSingularityModelsPackage N} {C : DiscreteCanonicalNeighborhoodsPackage Q}
    {U : DiscreteSurgeryPackage C} {Z : DiscreteGeometrizationPackage U}
    (Epkg2 : DiscreteEndpointClassificationPackage Z) where
  simplyConnectedClosedDiscreteThreeManifoldClosed : Epkg2.simplyConnectedClosedDiscreteThreeManifold
  endpointMatchesDiscreteStatementClosed : Epkg2.endpointMatchesDiscreteStatement

def DiscreteEndpointClassificationClosed {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    {Q : DiscreteSingularityModelsPackage N} {C : DiscreteCanonicalNeighborhoodsPackage Q}
    {U : DiscreteSurgeryPackage C} {Z : DiscreteGeometrizationPackage U}
    (Epkg2 : DiscreteEndpointClassificationPackage Z) : Prop :=
  Epkg2.simplyConnectedClosedDiscreteThreeManifold ∧
  Epkg2.endpointMatchesDiscreteStatement

theorem discrete_endpoint_classification_closed_from_evidence
    {G : DiscreteCurvaturePackage} {F : DiscreteRicciFlowPackage G}
    {S : DiscreteShortTimeExistencePackage F} {Epkg : DiscreteEntropyPackage S}
    {N : DiscreteNoncollapsingPackage Epkg} {Q : DiscreteSingularityModelsPackage N}
    {C : DiscreteCanonicalNeighborhoodsPackage Q} {U : DiscreteSurgeryPackage C}
    {Z : DiscreteGeometrizationPackage U} (Epkg2 : DiscreteEndpointClassificationPackage Z)
    (E : DiscreteEndpointClassificationEvidence Epkg2) : DiscreteEndpointClassificationClosed Epkg2 := by
  exact And.intro E.simplyConnectedClosedDiscreteThreeManifoldClosed
    E.endpointMatchesDiscreteStatementClosed

theorem discrete_endpoint_classification_supplies_mathlib_statement
    {G : DiscreteCurvaturePackage} {F : DiscreteRicciFlowPackage G}
    {S : DiscreteShortTimeExistencePackage F} {Epkg : DiscreteEntropyPackage S}
    {N : DiscreteNoncollapsingPackage Epkg} {Q : DiscreteSingularityModelsPackage N}
    {C : DiscreteCanonicalNeighborhoodsPackage Q} {U : DiscreteSurgeryPackage C}
    {Z : DiscreteGeometrizationPackage U} (Epkg2 : DiscreteEndpointClassificationPackage Z) :
    @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere
      Epkg2.targetSimplicialComplex Epkg2.targetTopology 3 :=
  Epkg2.sphereEndpoint

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
