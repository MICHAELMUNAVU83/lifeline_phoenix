defmodule LifelinePhoenix.Patients do
  @moduledoc """
  The Patients context.
  """

  import Ecto.Query, warn: false
  alias LifelinePhoenix.Repo

  alias LifelinePhoenix.Patients.Patient
  alias LifelinePhoenix.DrugAllergies
  alias LifelinePhoenix.DrugAllergies.DrugAllergy
  alias LifelinePhoenix.FoodAllergies
  alias LifelinePhoenix.FoodAllergies.FoodAllergy

  @doc """
  Returns the list of patients.

  ## Examples

      iex> list_patients()
      [%Patient{}, ...]

  """
  def list_patients do
    Repo.all(Patient)
  end

  def list_patients_for_doctor(doctor_id) do
    Repo.all(from p in Patient, where: p.doctor_id == ^doctor_id)
  end

  @doc """
  Gets a single patient.

  Raises `Ecto.NoResultsError` if the Patient does not exist.

  ## Examples

      iex> get_patient!(123)
      %Patient{}

      iex> get_patient!(456)
      ** (Ecto.NoResultsError)

  """
  def get_patient!(id), do: Repo.get!(Patient, id)

  @doc """
  Creates a patient.

  ## Examples

      iex> create_patient(%{field: value})
      {:ok, %Patient{}}

      iex> create_patient(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_patient(attrs \\ %{}) do
    %Patient{}
    |> Patient.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a patient.

  ## Examples

      iex> update_patient(patient, %{field: new_value})
      {:ok, %Patient{}}

      iex> update_patient(patient, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_patient(%Patient{} = patient, attrs) do
    patient
    |> Patient.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a patient.

  ## Examples

      iex> delete_patient(patient)
      {:ok, %Patient{}}

      iex> delete_patient(patient)
      {:error, %Ecto.Changeset{}}

  """
  def delete_patient(%Patient{} = patient) do
    Repo.delete(patient)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking patient changes.

  ## Examples

      iex> change_patient(patient)
      %Ecto.Changeset{data: %Patient{}}

  """
  def change_patient(%Patient{} = patient, attrs \\ %{}) do
    Patient.changeset(patient, attrs)
  end

  def add_drug_allergy(patient_id, drug_allergy_params) do
    drug_allergy_params
    |> Map.put("patient_id", patient_id)
    |> DrugAllergies.create_drug_allergy()
  end

  def add_food_allergy(patient_id, food_allergy_params) do
    food_allergy_params
    |> Map.put("patient_id", patient_id)
    |> FoodAllergies.create_food_allergy()
  end
end
