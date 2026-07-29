import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure ColumnHydraulicsPackage where
  pressureDropModel : Type u
  floodingCorrelation : Type v
  weepingPoint : Prop
  trayEfficiency : Prop
  downcomerDesign : Prop
  operatingFFactor : Prop

structure ColumnHydraulicsEvidence (H : ColumnHydraulicsPackage) where
  pressureDropModelClosed : H.pressureDropModel
  floodingCorrelationClosed : H.floodingCorrelation
  weepingPointClosed : H.weepingPoint
  trayEfficiencyClosed : H.trayEfficiency
  downcomerDesignClosed : H.downcomerDesign
  operatingFParameterClosed : H.operatingFParameter

def ColumnHydraulicsClosed (H : ColumnHydraulicsPackage) : Prop :=
  H.pressureDropModel ∧ H.floodingCorrelation ∧ H.weepingPoint ∧ H.trayEfficiency ∧ H.downcomerDesign ∧ H.operatingFParameter

theorem column_hydraulics_closed_from_evidence (H : ColumnHydraulicsPackage) (E : ColumnHydraulicsEvidence H) : ColumnHydraulicsClosed H := by
  exact And.intro E.pressureDropModelClosed (And.intro E.floodingCorrelationClosed (And.intro E.weepingPointClosed (And.intro E.trayEfficiencyClosed (And.intro E.downcomerDesignClosed E.operatingFParameterClosed))))

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse