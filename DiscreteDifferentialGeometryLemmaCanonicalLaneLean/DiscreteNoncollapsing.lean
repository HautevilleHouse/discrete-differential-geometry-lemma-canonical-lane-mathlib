import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteEntropy

/-!
# Discrete Noncollapsing Package
-/

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteNoncollapsingPackage {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    (Epkg : DiscreteEntropyPackage S) where
  scaleInvariantVolumeBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure DiscreteNoncollapsingEvidence {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} (N : DiscreteNoncollapsingPackage Epkg) where
  scaleInvariantVolumeBoundClosed : N.scaleInvariantVolumeBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def DiscreteNoncollapsingClosed {G : DiscreteCurvaturePackage}
    {F : DiscreteRicciFlowPackage G} {S : DiscreteShortTimeExistencePackage F}
    {Epkg : DiscreteEntropyPackage S} (N : DiscreteNoncollapsingPackage Epkg) : Prop :=
  N.scaleInvariantVolumeBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem discrete_noncollapsing_closed_from_evidence
    {G : DiscreteCurvaturePackage} {F : DiscreteRicciFlowPackage G}
    {S : DiscreteShortTimeExistencePackage F} {Epkg : DiscreteEntropyPackage S}
    (N : DiscreteNoncollapsingPackage Epkg) (E : DiscreteNoncollapsingEvidence N) :
    DiscreteNoncollapsingClosed N := by
  exact And.intro E.scaleInvariantVolumeBoundClosed
    (And.intro E.curvatureScaleControlClosed E.blowupLimitNoncollapsedClosed)

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
