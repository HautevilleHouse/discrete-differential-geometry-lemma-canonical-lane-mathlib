import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiscreteWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
