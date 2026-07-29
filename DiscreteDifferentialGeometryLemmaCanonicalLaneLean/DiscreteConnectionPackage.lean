import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteConnectionPackage where
  connectionForm : Type u
  holonomy : Type v
  parallelTransportDefined : Prop
  curvatureCompatibility : Prop

structure DiscreteConnectionEvidence (C : DiscreteConnectionPackage) where
  parallelTransportDefinedClosed : C.parallelTransportDefined
  curvatureCompatibilityClosed : C.curvatureCompatibility

def DiscreteConnectionClosed (C : DiscreteConnectionPackage) : Prop :=
  C.parallelTransportDefined ∧ C.curvatureCompatibility

theorem discrete_connection_closed_from_evidence
    (C : DiscreteConnectionPackage) (E : DiscreteConnectionEvidence C) :
    DiscreteConnectionClosed C := by
  exact And.intro E.parallelTransportDefinedClosed E.curvatureCompatibilityClosed

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse