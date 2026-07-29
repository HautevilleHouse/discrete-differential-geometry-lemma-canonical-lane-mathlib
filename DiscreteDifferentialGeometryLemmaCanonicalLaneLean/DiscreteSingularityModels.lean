import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteNoncollapsing

/-!
# Discrete Singularity Models Package
-/

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteSingularityModelsPackage {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} (N : DiscreteNoncollapsingPackage Epkg) where
  blowupSequenceExists : Prop
  ancientSolutionLimit : Prop
  kappaSolutionClassification : Prop
  neckOrCapModel : Prop

structure DiscreteSingularityModelsEvidence {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    (Q : DiscreteSingularityModelsPackage N) where
  blowupSequenceExistsClosed : Q.blowupSequenceExists
  ancientSolutionLimitClosed : Q.ancientSolutionLimit
  kappaSolutionClassificationClosed : Q.kappaSolutionClassification
  neckOrCapModelClosed : Q.neckOrCapModel

def DiscreteSingularityModelsClosed {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} {N : DiscreteNoncollapsingPackage Epkg}
    (Q : DiscreteSingularityModelsPackage N) : Prop :=
  Q.blowupSequenceExists ∧ Q.ancientSolutionLimit ∧
  Q.kappaSolutionClassification ∧ Q.neckOrCapModel

theorem discrete_singularity_models_closed_from_evidence
    {G : DiscreteCurvaturePackage} {F : DiscreteRicciFlowPackage G}
    {S : DiscreteShortTimeExistencePackage F} {Epkg : DiscreteEntropyPackage S}
    {N : DiscreteNoncollapsingPackage Epkg} (Q : DiscreteSingularityModelsPackage N)
    (E : DiscreteSingularityModelsEvidence Q) : DiscreteSingularityModelsClosed Q := by
  exact And.intro E.blowupSequenceExistsClosed
    (And.intro E.ancientSolutionLimitClosed
      (And.intro E.kappaSolutionClassificationClosed E.neckOrCapModelClosed))

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
