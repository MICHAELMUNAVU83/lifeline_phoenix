defmodule LifelinePhoenix.Repo.Migrations.CreateDoctorsAuthTables do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:doctors) do
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :password_confirmation, :string, null: false
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :bigint
      add :national_doctor_id, :integer
      add :hospital_name, :string

      add :confirmed_at, :naive_datetime
      timestamps()
    end

    create unique_index(:doctors, [:email])
    create unique_index(:doctors, [:national_doctor_id])

    create table(:doctors_tokens) do
      add :doctor_id, references(:doctors, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string
      timestamps(updated_at: false)
    end

    create index(:doctors_tokens, [:doctor_id])
    create unique_index(:doctors_tokens, [:context, :token])
  end
end
