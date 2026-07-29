import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteSingularityModels

/-!
# Discrete Canonical Neighborhoods Package
-/

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteCanonicalNeighborhoodsPackage {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    {Q : DiscreteSingularityModelsPackage N} where
  highCurvatureRegionCovered : Prop
  neckCapDecomposition : Prop
  scaleCompatibility : Prop
  persistenceUnderFlow : Prop

structure DiscreteCanonicalNeighborhoodsEvidence {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    {Q : DiscreteSingularityModelsPackage N} (C : DiscreteCanonicalNeighborhoodsPackage Q) where
  highCurvatureRegionCoveredClosed : C.highCurvatureRegionCovered
  neckCapDecompositionClosed : C.neckCapDecomposition
  scaleCompatibilityClosed : C.scaleCompatibility
  persistenceUnderFlowClosed : C.persistenceUnderFlow

def DiscreteCanonicalNeighborhoodsClosed {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    {Q : DiscreteSingularityModelsPackage N} (C : DiscreteCanonicalNeighborhoodsPackage Q) : Prop :=
  C.highCurvatureRegionCovered ∧ C.neckCapDecomposition ∧
  C.scaleCompatibility ∧ C.persistenceUnderFlow

theorem discrete_canonical_neighborhoods_closed_from_evidence
    {G : DiscreteCurvaturePackage} {F : DiscreteRicciFlowPackage G}
    {S : DiscreteShortTimeExistencePackage F} {Epkg : DiscreteEntropyPackage S}
    {N : DiscreteNoncollapsingPackage Epkg} {Q : DiscreteSingularityModelsPackage N}
    (C : DiscreteCanonicalNeighborhoodsPackage Q) (E : DiscreteCanonicalNeighborhoodsEvidence C) :
    DiscreteCanonicalNeighborhoodsClosed C := by
  exact And.intro E.highCurvatureRegionCoveredClosed
    (And.intro E.neckCapDecompositionClosed
      (And.intro E.scaleCompatibilityClosed E.persistenceUnderFlowClosed))

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
