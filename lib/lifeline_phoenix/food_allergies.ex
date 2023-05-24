defmodule LifelinePhoenix.FoodAllergies do
  @moduledoc """
  The FoodAllergies context.
  """

  import Ecto.Query, warn: false
  alias LifelinePhoenix.Repo

  alias LifelinePhoenix.FoodAllergies.FoodAllergy

  @doc """
  Returns the list of food_allergies.

  ## Examples

      iex> list_food_allergies()
      [%FoodAllergy{}, ...]

  """
  def list_food_allergies do
    Repo.all(FoodAllergy)
  end

  @doc """
  Gets a single food_allergy.

  Raises `Ecto.NoResultsError` if the Food allergy does not exist.

  ## Examples

      iex> get_food_allergy!(123)
      %FoodAllergy{}

      iex> get_food_allergy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food_allergy!(id), do: Repo.get!(FoodAllergy, id)

  @doc """
  Creates a food_allergy.

  ## Examples

      iex> create_food_allergy(%{field: value})
      {:ok, %FoodAllergy{}}

      iex> create_food_allergy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food_allergy(attrs \\ %{}) do
    %FoodAllergy{}
    |> FoodAllergy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food_allergy.

  ## Examples

      iex> update_food_allergy(food_allergy, %{field: new_value})
      {:ok, %FoodAllergy{}}

      iex> update_food_allergy(food_allergy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food_allergy(%FoodAllergy{} = food_allergy, attrs) do
    food_allergy
    |> FoodAllergy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a food_allergy.

  ## Examples

      iex> delete_food_allergy(food_allergy)
      {:ok, %FoodAllergy{}}

      iex> delete_food_allergy(food_allergy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food_allergy(%FoodAllergy{} = food_allergy) do
    Repo.delete(food_allergy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food_allergy changes.

  ## Examples

      iex> change_food_allergy(food_allergy)
      %Ecto.Changeset{data: %FoodAllergy{}}

  """
  def change_food_allergy(%FoodAllergy{} = food_allergy, attrs \\ %{}) do
    FoodAllergy.changeset(food_allergy, attrs)
  end
end
