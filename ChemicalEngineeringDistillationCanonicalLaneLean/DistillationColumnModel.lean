import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure DistillationColumnModel where
  numberOfStages : Nat
  feedStage : Nat
  refluxRatio : ℝ
  boilupRatio : ℝ
  pressure : ℝ
  relativeVolatility : ℝ
  vaporFlowProfile : Nat → ℝ
  liquidFlowProfile : Nat → ℝ
  equilibriumCurve : ℝ → ℝ
  operatingLineRectifying : ℝ → ℝ
  operatingLineStripping : ℝ → ℝ

structure ColumnDesignEvidence (M : DistillationColumnModel) where
  numberOfStagesPositive : M.numberOfStages > 0
  feedStageWithinBounds : M.feedStage ≥ 1 ∧ M.feedStage ≤ M.numberOfStages
  positiveReflux : M.refluxRatio > 0
  positiveBoilup : M.boilupRatio > 0
  positivePressure : M.pressure > 0
  relativeVolatilityGreaterThanOne : M.relativeVolatility > 1

def ColumnDesignClosed (M : DistillationColumnModel) : Prop :=
  M.numberOfStages > 0 ∧
  M.feedStage ≥ 1 ∧ M.feedStage ≤ M.numberOfStages ∧
  M.refluxRatio > 0 ∧
  M.boilupRatio > 0 ∧
  M.pressure > 0 ∧
  M.relativeVolatility > 1

theorem column_design_closed_from_evidence (M : DistillationColumnModel)
    (E : ColumnDesignEvidence M) : ColumnDesignClosed M := by
  exact And.intro E.numberOfStagesPositive
    (And.intro (And.intro E.feedStageWithinBounds.1 E.feedStageWithinBounds.2)
      (And.intro E.positiveReflux
        (And.intro E.positiveBoilup
          (And.intro E.positivePressure E.relativeVolatilityGreaterThanOne))))

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse