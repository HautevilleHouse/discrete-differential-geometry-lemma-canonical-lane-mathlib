import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.DiscreteCurvature

/-!
# Discrete Ricci Flow PDE Package
-/

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure DiscreteRicciFlowPackage (G : DiscreteCurvaturePackage) where
  timeStep : Type u
  discreteMetricAt : timeStep → Type v
  initialMetricMatches : Prop
  discreteRicciFlowEquation : Prop
  maximalTimeSteps : Prop

structure DiscreteRicciFlowEvidence {G : DiscreteCurvaturePackage}
    (F : DiscreteRicciFlowPackage G) where
  initialMetricMatchesClosed : F.initialMetricMatches
  discreteRicciFlowEquationClosed : F.discreteRicciFlowEquation
  maximalTimeStepsClosed : F.maximalTimeSteps

def DiscreteRicciFlowClosed {G : DiscreteCurvaturePackage}
    (F : DiscreteRicciFlowPackage G) : Prop :=
  F.initialMetricMatches ∧
  F.discreteRicciFlowEquation ∧
  F.maximalTimeSteps

theorem discrete_ricci_flow_closed_from_evidence
    {G : DiscreteCurvaturePackage} (F : DiscreteRicciFlowPackage G)
    (E : DiscreteRicciFlowEvidence F) : DiscreteRicciFlowClosed F := by
  exact And.intro E.initialMetricMatchesClosed
    (And.intro E.discreteRicciFlowEquationClosed E.maximalTimeStepsClosed)

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
