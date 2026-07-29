import HautevilleHouse.ChemicalEngineeringDistillationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure DistillationAdmittedObject where
  column : Type
  feedComposition : Prop
  productSpecification : Prop
  equilibriumModel : Prop
  convergenceProof : Prop
  conclusion : convergenceProof

structure DistillationEndgameState where
  object : DistillationAdmittedObject

def DistillationWitnessClosed (O : DistillationAdmittedObject) : Prop :=
  O.convergenceProof

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse