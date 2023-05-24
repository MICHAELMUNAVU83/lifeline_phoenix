defmodule LifelinePhoenix.FoodAllergies.FoodAllergy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_allergies" do
    field :name, :string
   belongs_to(:patient, LifelinePhoenix.Patients.Patient)

    timestamps()
  end

  @doc false
  def changeset(food_allergy, attrs) do
    food_allergy
    |> cast(attrs, [:name, :patient_id])
    |> validate_required([:name, :patient_id])
  end
end
