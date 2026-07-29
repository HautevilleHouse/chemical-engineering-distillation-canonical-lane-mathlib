import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringDistillationCanonicalLaneLean.PonchonSavarit

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure DistillationColumnDesignPackage where
  columnDiameter : Prop
  trayHydraulics : Prop
  pressureDrop : Prop
  weirDesign : Prop
  downcomerDesign : Prop
  efficiency : Prop

structure DistillationColumnDesignEvidence (D : DistillationColumnDesignPackage) where
  columnDiameterClosed : D.columnDiameter
  trayHydraulicsClosed : D.trayHydraulics
  pressureDropClosed : D.pressureDrop
  weirDesignClosed : D.weirDesign
  downcomerDesignClosed : D.downcomerDesign
  efficiencyClosed : D.efficiency

def DistillationColumnDesignClosed (D : DistillationColumnDesignPackage) : Prop :=
  D.columnDiameter ∧ D.trayHydraulics ∧ D.pressureDrop ∧
  D.weirDesign ∧ D.downcomerDesign ∧ D.efficiency

theorem distillation_column_design_closed_from_evidence
    (D : DistillationColumnDesignPackage) (E : DistillationColumnDesignEvidence D) :
    DistillationColumnDesignClosed D := by
  exact And.intro E.columnDiameterClosed
    (And.intro E.trayHydraulicsClosed
      (And.intro E.pressureDropClosed
        (And.intro E.weirDesignClosed
          (And.intro E.downcomerDesignClosed E.efficiencyClosed))))

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse