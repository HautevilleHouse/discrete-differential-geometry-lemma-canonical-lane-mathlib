import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : DiscreteAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DiscreteWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
