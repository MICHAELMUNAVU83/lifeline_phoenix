defmodule LifelinePhoenix.Patients.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :asthmatic, :boolean, default: false
    field :blood_group, :string
    field :date_of_birth, :date
    field :diabetic, :boolean, default: false
    field :first_name, :string
    field :hypertensive, :boolean, default: false
    field :last_name, :string
    field :national_id, :integer
    field :telephone, :string
    field :gender , :string

    belongs_to(:doctor, LifelinePhoenix.Doctors.Doctor)
    has_many(:drug_allergies, LifelinePhoenix.DrugAllergies.DrugAllergy)
    has_many(:food_allergies, LifelinePhoenix.FoodAllergies.FoodAllergy)

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:first_name, :last_name, :national_id, :telephone, :blood_group, :date_of_birth, :diabetic, :hypertensive, :asthmatic, :gender , :doctor_id])
    |> validate_required([:first_name, :last_name, :national_id, :telephone, :blood_group, :date_of_birth, :diabetic, :hypertensive, :asthmatic, :gender , :doctor_id])
  end
end
