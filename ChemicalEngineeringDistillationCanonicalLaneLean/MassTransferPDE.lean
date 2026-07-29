import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringDistillationCanonicalLaneLean

structure MassTransferPDE where
  componentBalanceEq : ℝ → ℝ → ℝ  -- (x, y) -> RHS
  vaporLiquidEquilibrium : ℝ → ℝ
  massTransferCoefficient : ℝ
  diffusivity : ℝ
  filmThickness : ℝ
  boundaryConditionTop : ℝ
  boundaryConditionBottom : ℝ

structure MassTransferEvidence (P : MassTransferPDE) where
  componentBalanceEqContinuous : Continuous (fun (x : ℝ × ℝ) => P.componentBalanceEq x.1 x.2)
  equilibriumSmooth : Smooth ℝ P.vaporLiquidEquilibrium
  positiveMassTransferCoeff : P.massTransferCoefficient > 0
  positiveDiffusivity : P.diffusivity > 0
  positiveFilmThickness : P.filmThickness > 0

def MassTransferPDEClosed (P : MassTransferPDE) : Prop :=
  P.massTransferCoefficient > 0 ∧
  P.diffusivity > 0 ∧
  P.filmThickness > 0

theorem mass_transfer_pde_closed_from_evidence (P : MassTransferPDE)
    (E : MassTransferEvidence P) : MassTransferPDEClosed P := by
  exact And.intro (And.intro E.positiveMassTransferCoeff E.positiveDiffusivity)
    E.positiveFilmThickness

end ChemicalEngineeringDistillationCanonicalLaneLean
end HautevilleHouse