import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

def ConstrainedDiscreteDiffGeoClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_diff_geo_endgame (A : AdmissibleClass) :
    ConstrainedDiscreteDiffGeoClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse