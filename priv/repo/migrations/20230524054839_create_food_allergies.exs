defmodule LifelinePhoenix.Repo.Migrations.CreateFoodAllergies do
  use Ecto.Migration

  def change do
    create table(:food_allergies) do
      add :name, :string
      add :patient_id, references(:patients, on_delete: :nothing)

      timestamps()
    end

    create index(:food_allergies, [:patient_id])
  end
end
