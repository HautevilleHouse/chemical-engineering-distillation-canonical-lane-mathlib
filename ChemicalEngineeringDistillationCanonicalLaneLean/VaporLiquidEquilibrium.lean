import canonicalLaneMathlib.AdmissibleClass

/-!
# Vapor-Liquid Equilibrium Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure VaporLiquidEquilibriumPackage where
  components : Nat
  pressure : Float
  temperature : Float
  liquidComposition : Array Float
  vaporComposition : Array Float
  kValues : Array Float
  relativeVolatility : Float
  activityCoefficients : Array Float
  raoultsLawValid : Prop
  gammaPhiApproach : Prop
  fugacityCoefficients : Array Float
  raoultsLawValidClosed : raoultsLawValid
  gammaPhiApproachClosed : gammaPhiApproach

def VaporLiquidEquilibriumClosed (V : VaporLiquidEquilibriumPackage) : Prop :=
  V.raoultsLawValid ∧ V.gammaPhiApproach

theorem vapor_liquid_equilibrium_closed_from_evidence (V : VaporLiquidEquilibriumPackage) : VaporLiquidEquilibriumClosed V := by
  exact And.intro V.raoultsLawValidClosed V.gammaPhiApproachClosed

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse