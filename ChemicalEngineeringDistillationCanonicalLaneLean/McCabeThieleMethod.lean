import canonicalLaneMathlib.AdmissibleClass

/-!
# McCabe-Thiele Method Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure McCabeThieleMethodPackage where
  operatingLineRectifying : Float -> Float
  operatingLineStripping : Float -> Float
  equilibriumCurve : Float -> Float
  numberOfStages : Nat
  feedCondition : Float
  refluxRatio : Float
  minimumRefluxRatio : Float
  feedStageLocation : Nat
  operatingLinesDefined : Prop
  equilibriumCurveDefined : Prop
  operatingLinesDefinedClosed : operatingLinesDefined
  equilibriumCurveDefinedClosed : equilibriumCurveDefined

def McCabeThieleMethodClosed (M : McCabeThieleMethodPackage) : Prop :=
  M.operatingLinesDefined ∧ M.equilibriumCurveDefined

theorem mccabe_thiele_method_closed_from_evidence (M : McCabeThieleMethodPackage) : McCabeThieleMethodClosed M := by
  exact And.intro M.operatingLinesDefinedClosed M.equilibriumCurveDefinedClosed

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse