import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.BridgeLemmas
import DiscreteDifferentialGeometryLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryLemmaCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  discreteConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
  deriving Repr, DecidableEq

def sourceRepository : String :=
  "discrete-differential-geometry-lemma-canonical-lane"

def sourceDescription : String :=
  "Discrete Differential Geometry Lemma"

def sourceTheoremBoundary : String :=
  "discrete classical boundary"

def baselineCertificateLane : String :=
  "discrete_constrained"

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := sourceRepository,
    theoremName := sourceRepository,
    theoremObject := sourceDescription,
    classicalBoundary := sourceTheoremBoundary,
    discreteConstrainedStatement := "discrete-constrained theorem certificate internalized through bridge and gate",
    certificateLane := baselineCertificateLane,
    carriedRemainder := "classical source boundary carried by formalization"
  }

end DiscreteDifferentialGeometryLemmaCanonicalLaneLean
end HautevilleHouse
