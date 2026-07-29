import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure VaporLiquidEquilibrium where
  componentName : String
  kValue : Float
  relativeVolatility : Float

structure EquilibriumStageModel where
  stageIndex : Nat
  feedFlow : Float
  liquidComposition : Float
  vaporComposition : Float
  temperature : Float
  pressure : Float
  equilibrium : VaporLiquidEquilibrium

structure DistillationColumn where
  numberOfStages : Nat
  feedStage : Nat
  refluxRatio : Float
  distillateRate : Float
  bottomsRate : Float
  stages : List EquilibriumStageModel
  cutoffSpecification : Prop

def DistillationColumnClosed (col : DistillationColumn) : Prop :=
  col.numberOfStages > 0 ∧ col.feedStage ≤ col.numberOfStages ∧
  col.refluxRatio > 0 ∧ col.distillateRate > 0 ∧ col.bottomsRate > 0 ∧
  col.cutoffSpecification

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse
