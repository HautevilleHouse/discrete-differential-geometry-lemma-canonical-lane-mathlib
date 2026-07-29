import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteHolonomyPackage {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage G} where
  holonomyGroup : Type u
  parallelTransport : Type v
  monodromyTheorem : Prop
  curvatureHolonomyRelation : Prop

structure DiscreteHolonomyEvidence {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage G} (H : DiscreteHolonomyPackage G C) where
  monodromyTheoremClosed : H.monodromyTheorem
  curvatureHolonomyRelationClosed : H.curvatureHolonomyRelation

def DiscreteHolonomyClosed {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage G} (H : DiscreteHolonomyPackage G C) : Prop :=
  H.monodromyTheorem ∧ H.curvatureHolonomyRelation

theorem discrete_holonomy_closed_from_evidence
    {G : DiscreteRiemannianCurvaturePackage} {C : DiscreteConnectionPackage G}
    (H : DiscreteHolonomyPackage G C) (E : DiscreteHolonomyEvidence H) :
    DiscreteHolonomyClosed H := by
  exact And.intro E.monodromyTheoremClosed E.curvatureHolonomyRelationClosed

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse