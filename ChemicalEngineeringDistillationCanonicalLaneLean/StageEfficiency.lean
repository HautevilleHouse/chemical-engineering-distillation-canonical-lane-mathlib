import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure StageEfficiencyPackage where
  murphreeVaporEfficiency : Type u
  overallColumnEfficiency : Type v
  pointEfficiency : Type w
  murphreeDefinitionValid : Prop
  overallFromMurphree : Prop
  pointEfficiencyModel : Prop

structure StageEfficiencyEvidence (S : StageEfficiencyPackage) where
  murphreeDefinitionValidClosed : S.murphreeDefinitionValid
  overallFromMurphreeClosed : S.overallFromMurphree
  pointEfficiencyModelClosed : S.pointEfficiencyModel

def StageEfficiencyClosed (S : StageEfficiencyPackage) : Prop :=
  S.murphreeDefinitionValid ∧ S.overallFromMurphree ∧ S.pointEfficiencyModel

theorem stage_efficiency_closed_from_evidence
    (S : StageEfficiencyPackage) (E : StageEfficiencyEvidence S) :
    StageEfficiencyClosed S := by
  exact And.intro E.murphreeDefinitionValidClosed
    (And.intro E.overallFromMurphreeClosed E.pointEfficiencyModelClosed)

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse
