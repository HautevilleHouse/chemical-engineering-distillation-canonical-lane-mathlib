import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringDistillationCanonicalLaneLean.FenskeUnderwoodGilliland

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure PonchonSavaritPackage where
  enthalpyConcentrationDiagram : Prop
  energyBalance : Prop
  materialBalance : Prop
  stageEnthalpy : Prop
  condenserReboilerDuty : Prop

structure PonchonSavaritEvidence (P : PonchonSavaritPackage) where
  enthalpyConcentrationDiagramClosed : P.enthalpyConcentrationDiagram
  energyBalanceClosed : P.energyBalance
  materialBalanceClosed : P.materialBalance
  stageEnthalpyClosed : P.stageEnthalpy
  condenserReboilerDutyClosed : P.condenserReboilerDuty

def PonchonSavaritClosed (P : PonchonSavaritPackage) : Prop :=
  P.enthalpyConcentrationDiagram ∧ P.energyBalance ∧ P.materialBalance ∧
  P.stageEnthalpy ∧ P.condenserReboilerDuty

theorem ponchon_savarit_closed_from_evidence (P : PonchonSavaritPackage)
    (E : PonchonSavaritEvidence P) : PonchonSavaritClosed P := by
  exact And.intro E.enthalpyConcentrationDiagramClosed
    (And.intro E.energyBalanceClosed
      (And.intro E.materialBalanceClosed
        (And.intro E.stageEnthalpyClosed E.condenserReboilerDutyClosed)))

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse