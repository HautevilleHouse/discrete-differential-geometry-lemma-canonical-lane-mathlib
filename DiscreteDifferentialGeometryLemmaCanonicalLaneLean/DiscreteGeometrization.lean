import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteSurgery

/-!
# Discrete Finite Extinction And Geometrization Package
-/

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteGeometrizationPackage {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    {Q : DiscreteSingularityModelsPackage N} {C : DiscreteCanonicalNeighborhoodsPackage Q}
    (U : DiscreteSurgeryPackage C) where
  finiteExtinctionAlternative : Prop
  thickThinDecomposition : Prop
  geometrizedPiecesClassified : Prop
  simplyConnectedCaseForcesSpherePiece : Prop

structure DiscreteGeometrizationEvidence {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    {Q : DiscreteSingularityModelsPackage N} {C : DiscreteCanonicalNeighborhoodsPackage Q}
    {U : DiscreteSurgeryPackage C} (Z : DiscreteGeometrizationPackage U) where
  finiteExtinctionAlternativeClosed : Z.finiteExtinctionAlternative
  thickThinDecompositionClosed : Z.thickThinDecomposition
  geometrizedPiecesClassifiedClosed : Z.geometrizedPiecesClassified
  simplyConnectedCaseForcesSpherePieceClosed : Z.simplyConnectedCaseForcesSpherePiece

def DiscreteGeometrizationClosed {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    {Q : DiscreteSingularityModelsPackage N} {C : DiscreteCanonicalNeighborhoodsPackage Q}
    {U : DiscreteSurgeryPackage C} (Z : DiscreteGeometrizationPackage U) : Prop :=
  Z.finiteExtinctionAlternative ∧ Z.thickThinDecomposition ∧
  Z.geometrizedPiecesClassified ∧ Z.simplyConnectedCaseForcesSpherePiece

theorem discrete_geometrization_closed_from_evidence
    {G : DiscreteCurvaturePackage} {F : DiscreteRicciFlowPackage G}
    {S : DiscreteShortTimeExistencePackage F} {Epkg : DiscreteEntropyPackage S}
    {N : DiscreteNoncollapsingPackage Epkg} {Q : DiscreteSingularityModelsPackage N}
    {C : DiscreteCanonicalNeighborhoodsPackage Q} {U : DiscreteSurgeryPackage C}
    (Z : DiscreteGeometrizationPackage U) (E : DiscreteGeometrizationEvidence Z) :
    DiscreteGeometrizationClosed Z := by
  exact And.intro E.finiteExtinctionAlternativeClosed
    (And.intro E.thickThinDecompositionClosed
      (And.intro E.geometrizedPiecesClassifiedClosed
        E.simplyConnectedCaseForcesSpherePieceClosed))

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
