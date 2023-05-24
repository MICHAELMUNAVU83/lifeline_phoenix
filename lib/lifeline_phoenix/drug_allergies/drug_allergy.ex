defmodule LifelinePhoenix.DrugAllergies.DrugAllergy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drug_allergies" do
    field :name, :string
    belongs_to(:patient, LifelinePhoenix.Patients.Patient)

    timestamps()
  end

  @doc false
  def changeset(drug_allergy, attrs) do
    drug_allergy
    |> cast(attrs, [:name, :patient_id])
    |> validate_required([:name, :patient_id])
  end
end
