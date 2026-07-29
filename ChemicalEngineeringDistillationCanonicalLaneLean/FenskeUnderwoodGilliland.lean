import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure FenskeUnderwoodGillilandPackage where
  minimumStagesFenske : Type u
  minimumRefluxUnderwood : Type v
  actualStagesGilliland : Type w
  fenskeEquationValid : Prop
  underwoodRootsFound : Prop
  gillilandCorrelationValid : Prop

structure FenskeUnderwoodGillilandEvidence (F : FenskeUnderwoodGillilandPackage) where
  fenskeEquationValidClosed : F.fenskeEquationValid
  underwoodRootsFoundClosed : F.underwoodRootsFound
  gillilandCorrelationValidClosed : F.gillilandCorrelationValid

def FenskeUnderwoodGillilandClosed (F : FenskeUnderwoodGillilandPackage) : Prop :=
  F.fenskeEquationValid ∧ F.underwoodRootsFound ∧ F.gillilandCorrelationValid

theorem fenske_underwood_gilliland_closed_from_evidence
    (F : FenskeUnderwoodGillilandPackage) (E : FenskeUnderwoodGillilandEvidence F) :
    FenskeUnderwoodGillilandClosed F := by
  exact And.intro E.fenskeEquationValidClosed
    (And.intro E.underwoodRootsFoundClosed E.gillilandCorrelationValidClosed)

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse
