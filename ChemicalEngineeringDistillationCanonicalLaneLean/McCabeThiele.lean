import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure McCabeThielePackage where
  operatingLineRectifying : Type u
  operatingLineStripping : Type v
  qLine : Type w
  equilibriumCurve : Type x
  constantMolarOverflowValid : Prop
  operatingLineFromReflux : Prop
  feedConditionApplied : Prop

structure McCabeThieleEvidence (M : McCabeThielePackage) where
  constantMolarOverflowValidClosed : M.constantMolarOverflowValid
  operatingLineFromRefluxClosed : M.operatingLineFromReflux
  feedConditionAppliedClosed : M.feedConditionApplied

def McCabeThieleClosed (M : McCabeThielePackage) : Prop :=
  M.constantMolarOverflowValid ∧ M.operatingLineFromReflux ∧ M.feedConditionApplied

theorem mccabe_thiele_closed_from_evidence
    (M : McCabeThielePackage) (E : McCabeThieleEvidence M) :
    McCabeThieleClosed M := by
  exact And.intro E.constantMolarOverflowValidClosed
    (And.intro E.operatingLineFromRefluxClosed E.feedConditionAppliedClosed)

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse
