defmodule LifelinePhoenix.DrugAllergies do
  @moduledoc """
  The DrugAllergies context.
  """

  import Ecto.Query, warn: false
  alias LifelinePhoenix.Repo

  alias LifelinePhoenix.DrugAllergies.DrugAllergy

  @doc """
  Returns the list of drug_allergies.

  ## Examples

      iex> list_drug_allergies()
      [%DrugAllergy{}, ...]

  """
  def list_drug_allergies do
    Repo.all(DrugAllergy)
  end

  @doc """
  Gets a single drug_allergy.

  Raises `Ecto.NoResultsError` if the Drug allergy does not exist.

  ## Examples

      iex> get_drug_allergy!(123)
      %DrugAllergy{}

      iex> get_drug_allergy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_drug_allergy!(id), do: Repo.get!(DrugAllergy, id)

  @doc """
  Creates a drug_allergy.

  ## Examples

      iex> create_drug_allergy(%{field: value})
      {:ok, %DrugAllergy{}}

      iex> create_drug_allergy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_drug_allergy(attrs \\ %{}) do
    %DrugAllergy{}
    |> DrugAllergy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a drug_allergy.

  ## Examples

      iex> update_drug_allergy(drug_allergy, %{field: new_value})
      {:ok, %DrugAllergy{}}

      iex> update_drug_allergy(drug_allergy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_drug_allergy(%DrugAllergy{} = drug_allergy, attrs) do
    drug_allergy
    |> DrugAllergy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a drug_allergy.

  ## Examples

      iex> delete_drug_allergy(drug_allergy)
      {:ok, %DrugAllergy{}}

      iex> delete_drug_allergy(drug_allergy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_drug_allergy(%DrugAllergy{} = drug_allergy) do
    Repo.delete(drug_allergy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking drug_allergy changes.

  ## Examples

      iex> change_drug_allergy(drug_allergy)
      %Ecto.Changeset{data: %DrugAllergy{}}

  """
  def change_drug_allergy(%DrugAllergy{} = drug_allergy, attrs \\ %{}) do
    DrugAllergy.changeset(drug_allergy, attrs)
  end
end
