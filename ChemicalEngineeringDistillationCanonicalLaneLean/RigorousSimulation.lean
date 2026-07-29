import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringDistillationCanonicalLaneLean.McCabeThieleMethod

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure RigorousSimulationPackage {V : VaporLiquidEquilibriumPackage} {F : FenskeUnderwoodGillilandPackage V} {M : McCabeThieleMethodPackage V F} where
  heatAndMassBalance : Prop
  energyBalance : Prop
  murphreeTrayEfficiency : Prop
  convergenceAlgorithm : Prop
  pressureDropComputation : Prop

structure RigorousSimulationEvidence {V : VaporLiquidEquilibriumPackage} {F : FenskeUnderwoodGillilandPackage V} {M : McCabeThieleMethodPackage V F} (R : RigorousSimulationPackage V F M) where
  heatAndMassBalanceClosed : R.heatAndMassBalance
  energyBalanceClosed : R.energyBalance
  murphreeTrayEfficiencyClosed : R.murphreeTrayEfficiency
  convergenceAlgorithmClosed : R.convergenceAlgorithm
  pressureDropComputationClosed : R.pressureDropComputation

def RigorousSimulationClosed {V : VaporLiquidEquilibriumPackage} {F : FenskeUnderwoodGillilandPackage V} {M : McCabeThieleMethodPackage V F} (R : RigorousSimulationPackage V F M) : Prop :=
  R.heatAndMassBalance ∧ R.energyBalance ∧ R.murphreeTrayEfficiency ∧ R.convergenceAlgorithm ∧ R.pressureDropComputation

theorem rigorous_simulation_closed_from_evidence {V : VaporLiquidEquilibriumPackage} {F : FenskeUnderwoodGillilandPackage V} {M : McCabeThieleMethodPackage V F} (R : RigorousSimulationPackage V F M) (E : RigorousSimulationEvidence R) : RigorousSimulationClosed R := by
  exact And.intro E.heatAndMassBalanceClosed (And.intro E.energyBalanceClosed (And.intro E.murphreeTrayEfficiencyClosed (And.intro E.convergenceAlgorithmClosed E.pressureDropComputationClosed)))

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse