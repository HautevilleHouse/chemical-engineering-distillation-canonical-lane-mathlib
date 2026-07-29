import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure PinchPoint where
  composition : Float
  temperature : Float
  location : String -- "rectifying" | "stripping"

structure MinimumRefluxCondition where
  pinchPoint : PinchPoint
  underwoodFactor : Float
  minimumRefluxRatio : Float
  active : Prop

structure PinchAnalysisResult where
  pinchPoints : List PinchPoint
  minimumRefluxConditions : List MinimumRefluxCondition
  analysisComplete : Prop

def PinchAnalysisClosed (result : PinchAnalysisResult) : Prop :=
  result.pinchPoints.length ≥ 1 ∧
  (∀ cond ∈ result.minimumRefluxConditions, cond.active) ∧
  result.analysisComplete

theorem pinch_point_at_minimux_reflux (result : PinchAnalysisResult) :
    PinchAnalysisClosed result → (∃ pp : PinchPoint, pp ∈ result.pinchPoints) := by
  intro h
  exact ⟨result.pinchPoints.head (by
    rcases h with ⟨lenPos, _, _⟩
    exact Nat.succ_ne_zero _ (by
      have : result.pinchPoints.length ≥ 1 := lenPos
      exact this)
  ), by
    exact List.mem_of_mem_head? _
  ⟩

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse
