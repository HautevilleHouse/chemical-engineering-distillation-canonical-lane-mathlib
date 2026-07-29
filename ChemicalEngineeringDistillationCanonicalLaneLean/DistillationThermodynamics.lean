import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure EnthalpyBalance where
  vaporEnthalpy : Float
  liquidEnthalpy : Float
  energyConservation : Prop

structure EnergyRecoverySystem where
  feedPreheater : Bool
  condenserRecovery : Float
  reboilerEfficiency : Float
  recoveryClosed : Prop

structure ThermodynamicEfficiency where
  carnotEfficiency : Float
  actualEfficiency : Float
  approachToEquilibrium : Float
  efficiencyClosed : Prop

def DistillationThermodynamicsClosed (enthalpy : EnthalpyBalance)
    (energyRecovery : EnergyRecoverySystem) (efficiency : ThermodynamicEfficiency) : Prop :=
  enthalpy.energyConservation ∧ energyRecovery.recoveryClosed ∧
  efficiency.efficiencyClosed ∧ efficiency.actualEfficiency ≤ efficiency.carnotEfficiency

theorem thermodynamics_closed_implies_energy_conservation
    (enthalpy : EnthalpyBalance) (energyRecovery : EnergyRecoverySystem)
    (efficiency : ThermodynamicEfficiency) :
    DistillationThermodynamicsClosed enthalpy energyRecovery efficiency →
    enthalpy.energyConservation := by
  intro h
  exact h.1

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse
