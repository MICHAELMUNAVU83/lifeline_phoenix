defmodule LifelinePhoenix.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :last_name, :string
      add :national_id, :integer
      add :telephone, :string
      add :blood_group, :string
      add :date_of_birth, :date
      add :diabetic, :boolean, default: false, null: false
      add :hypertensive, :boolean, default: false, null: false
      add :asthmatic, :boolean, default: false, null: false
      add :doctor_id, references(:doctors, on_delete: :nothing)

      timestamps()
    end

    create index(:patients, [:doctor_id])
  end
end
