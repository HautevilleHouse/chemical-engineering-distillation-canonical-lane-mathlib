import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure MassTransferPackage where
  diffusionCoefficient : Type u
  filmThickness : Type v
  massTransferCoefficient : Type w
  twoFilmTheoryValid : Prop
  penetrationModelValid : Prop
  surfaceRenewalValid : Prop

structure MassTransferEvidence (M : MassTransferPackage) where
  twoFilmTheoryValidClosed : M.twoFilmTheoryValid
  penetrationModelValidClosed : M.penetrationModelValid
  surfaceRenewalValidClosed : M.surfaceRenewalValid

def MassTransferClosed (M : MassTransferPackage) : Prop :=
  M.twoFilmTheoryValid ∧ M.penetrationModelValid ∧ M.surfaceRenewalValid

theorem mass_transfer_closed_from_evidence
    (M : MassTransferPackage) (E : MassTransferEvidence M) :
    MassTransferClosed M := by
  exact And.intro E.twoFilmTheoryValidClosed
    (And.intro E.penetrationModelValidClosed E.surfaceRenewalValidClosed)

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse
