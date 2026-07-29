import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteIndexTheoremPackage {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage G} where
  ellipticOperator : Type u
  indexFormula : Prop
  topologicalInvariant : Prop
  analyticIndex : Prop
  topologicalIndex : Prop

structure DiscreteIndexTheoremEvidence {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage G} (I : DiscreteIndexTheoremPackage G C) where
  indexFormulaClosed : I.indexFormula
  topologicalInvariantClosed : I.topologicalInvariant
  analyticIndexClosed : I.analyticIndex
  topologicalIndexClosed : I.topologicalIndex

def DiscreteIndexTheoremClosed {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage G} (I : DiscreteIndexTheoremPackage G C) : Prop :=
  I.indexFormula ∧ I.topologicalInvariant ∧ I.analyticIndex ∧ I.topologicalIndex

theorem discrete_index_theorem_closed_from_evidence
    {G : DiscreteRiemannianCurvaturePackage} {C : DiscreteConnectionPackage G}
    (I : DiscreteIndexTheoremPackage G C) (E : DiscreteIndexTheoremEvidence I) :
    DiscreteIndexTheoremClosed I := by
  exact And.intro E.indexFormulaClosed
    (And.intro E.topologicalInvariantClosed
      (And.intro E.analyticIndexClosed E.topologicalIndexClosed))

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse