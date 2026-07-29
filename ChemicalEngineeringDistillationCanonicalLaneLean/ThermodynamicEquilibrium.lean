import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure ThermodynamicEquilibrium where
  temperature : ℝ
  pressure : ℝ
  liquidPhaseFugacity : ℝ → ℝ
  vaporPhaseFugacity : ℝ → ℝ
  equilibriumConstant : ℝ → ℝ
  relativeVolatility : ℝ
  azeotropeComposition : Option ℝ

structure EquilibriumEvidence (E : ThermodynamicEquilibrium) where
  positiveTemperature : E.temperature > 0
  positivePressure : E.pressure > 0
  fugacityContinuous : Continuous E.liquidPhaseFugacity ∧ Continuous E.vaporPhaseFugacity
  equilibriumConstantPositive : ∀ x, x > 0 → E.equilibriumConstant x > 0
  relativeVolatilityGreaterThanOne : E.relativeVolatility > 1

def ThermodynamicEquilibriumClosed (E : ThermodynamicEquilibrium) : Prop :=
  E.temperature > 0 ∧
  E.pressure > 0 ∧
  E.relativeVolatility > 1

theorem thermodynamic_equilibrium_closed_from_evidence
    (E : ThermodynamicEquilibrium) (Ev : EquilibriumEvidence E) :
    ThermodynamicEquilibriumClosed E := by
  exact And.intro (And.intro Ev.positiveTemperature Ev.positivePressure)
    Ev.relativeVolatilityGreaterThanOne

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse