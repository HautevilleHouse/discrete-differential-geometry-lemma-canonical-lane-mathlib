import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteHolonomyPackage where
  loopSpace : Type u
  holonomyMap : Type v
  monodromyClosed : Prop
  curvatureHolonomyRelation : Prop

structure DiscreteHolonomyEvidence (H : DiscreteHolonomyPackage) where
  monodromyClosedClosed : H.monodromyClosed
  curvatureHolonomyRelationClosed : H.curvatureHolonomyRelation

def DiscreteHolonomyClosed (H : DiscreteHolonomyPackage) : Prop :=
  H.monodromyClosed ∧ H.curvatureHolonomyRelation

theorem discrete_holonomy_closed_from_evidence
    (H : DiscreteHolonomyPackage) (E : DiscreteHolonomyEvidence H) :
    DiscreteHolonomyClosed H := by
  exact And.intro E.monodromyClosedClosed E.curvatureHolonomyRelationClosed

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse