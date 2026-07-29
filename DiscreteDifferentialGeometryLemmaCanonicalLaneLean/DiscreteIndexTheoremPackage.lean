import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteIndexTheoremPackage where
  diracOperator : Type u
  indexComputed : Prop
  analyticIndex : Prop
  topologicalIndex : Prop

structure DiscreteIndexTheoremEvidence (I : DiscreteIndexTheoremPackage) where
  indexComputedClosed : I.indexComputed
  analyticIndexClosed : I.analyticIndex
  topologicalIndexClosed : I.topologicalIndex

def DiscreteIndexTheoremClosed (I : DiscreteIndexTheoremPackage) : Prop :=
  I.indexComputed ∧ I.analyticIndex ∧ I.topologicalIndex

theorem discrete_index_theorem_closed_from_evidence
    (I : DiscreteIndexTheoremPackage) (E : DiscreteIndexTheoremEvidence I) :
    DiscreteIndexTheoremClosed I := by
  exact And.intro E.indexComputedClosed
    (And.intro E.analyticIndexClosed E.topologicalIndexClosed)

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse