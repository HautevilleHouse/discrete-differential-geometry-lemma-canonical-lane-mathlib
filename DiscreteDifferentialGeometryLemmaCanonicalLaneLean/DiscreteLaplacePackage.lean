import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteLaplacePackage where
  discreteLaplacian : Type u
  spectrum : Type v
  eigenfunctionRegularity : Prop
  heatKernelDecay : Prop

structure DiscreteLaplaceEvidence (L : DiscreteLaplacePackage) where
  eigenfunctionRegularityClosed : L.eigenfunctionRegularity
  heatKernelDecayClosed : L.heatKernelDecay

def DiscreteLaplaceClosed (L : DiscreteLaplacePackage) : Prop :=
  L.eigenfunctionRegularity ∧ L.heatKernelDecay

theorem discrete_laplace_closed_from_evidence
    (L : DiscreteLaplacePackage) (E : DiscreteLaplaceEvidence L) :
    DiscreteLaplaceClosed L := by
  exact And.intro E.eigenfunctionRegularityClosed E.heatKernelDecayClosed

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse