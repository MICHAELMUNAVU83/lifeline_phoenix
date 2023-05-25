defmodule LifelinePhoenix.FoodAllergiesTest do
  use LifelinePhoenix.DataCase

  alias LifelinePhoenix.FoodAllergies

  describe "food_allergies" do
    alias LifelinePhoenix.FoodAllergies.FoodAllergy

    import LifelinePhoenix.FoodAllergiesFixtures

    @invalid_attrs %{name: nil}

    test "list_food_allergies/0 returns all food_allergies" do
      food_allergy = food_allergy_fixture()
      assert FoodAllergies.list_food_allergies() == [food_allergy]
    end

    test "get_food_allergy!/1 returns the food_allergy with given id" do
      food_allergy = food_allergy_fixture()
      assert FoodAllergies.get_food_allergy!(food_allergy.id) == food_allergy
    end

    test "create_food_allergy/1 with valid data creates a food_allergy" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %FoodAllergy{} = food_allergy} = FoodAllergies.create_food_allergy(valid_attrs)
      assert food_allergy.name == "some name"
    end

    test "create_food_allergy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FoodAllergies.create_food_allergy(@invalid_attrs)
    end

    test "update_food_allergy/2 with valid data updates the food_allergy" do
      food_allergy = food_allergy_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %FoodAllergy{} = food_allergy} =
               FoodAllergies.update_food_allergy(food_allergy, update_attrs)

      assert food_allergy.name == "some updated name"
    end

    test "update_food_allergy/2 with invalid data returns error changeset" do
      food_allergy = food_allergy_fixture()

      assert {:error, %Ecto.Changeset{}} =
               FoodAllergies.update_food_allergy(food_allergy, @invalid_attrs)

      assert food_allergy == FoodAllergies.get_food_allergy!(food_allergy.id)
    end

    test "delete_food_allergy/1 deletes the food_allergy" do
      food_allergy = food_allergy_fixture()
      assert {:ok, %FoodAllergy{}} = FoodAllergies.delete_food_allergy(food_allergy)
      assert_raise Ecto.NoResultsError, fn -> FoodAllergies.get_food_allergy!(food_allergy.id) end
    end

    test "change_food_allergy/1 returns a food_allergy changeset" do
      food_allergy = food_allergy_fixture()
      assert %Ecto.Changeset{} = FoodAllergies.change_food_allergy(food_allergy)
    end
  end
end
