defmodule LifelinePhoenix.Repo.Migrations.CreateDrugAllergies do
  use Ecto.Migration

  def change do
    create table(:drug_allergies) do
      add :name, :string
      add :patient_id, references(:patients, on_delete: :nothing)

      timestamps()
    end

    create index(:drug_allergies, [:patient_id])
  end
end
