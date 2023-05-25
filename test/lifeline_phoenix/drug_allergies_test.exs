defmodule LifelinePhoenix.DrugAllergiesTest do
  use LifelinePhoenix.DataCase

  alias LifelinePhoenix.DrugAllergies

  describe "drug_allergies" do
    alias LifelinePhoenix.DrugAllergies.DrugAllergy

    import LifelinePhoenix.DrugAllergiesFixtures

    @invalid_attrs %{name: nil}

    test "list_drug_allergies/0 returns all drug_allergies" do
      drug_allergy = drug_allergy_fixture()
      assert DrugAllergies.list_drug_allergies() == [drug_allergy]
    end

    test "get_drug_allergy!/1 returns the drug_allergy with given id" do
      drug_allergy = drug_allergy_fixture()
      assert DrugAllergies.get_drug_allergy!(drug_allergy.id) == drug_allergy
    end

    test "create_drug_allergy/1 with valid data creates a drug_allergy" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %DrugAllergy{} = drug_allergy} = DrugAllergies.create_drug_allergy(valid_attrs)
      assert drug_allergy.name == "some name"
    end

    test "create_drug_allergy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DrugAllergies.create_drug_allergy(@invalid_attrs)
    end

    test "update_drug_allergy/2 with valid data updates the drug_allergy" do
      drug_allergy = drug_allergy_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %DrugAllergy{} = drug_allergy} =
               DrugAllergies.update_drug_allergy(drug_allergy, update_attrs)

      assert drug_allergy.name == "some updated name"
    end

    test "update_drug_allergy/2 with invalid data returns error changeset" do
      drug_allergy = drug_allergy_fixture()

      assert {:error, %Ecto.Changeset{}} =
               DrugAllergies.update_drug_allergy(drug_allergy, @invalid_attrs)

      assert drug_allergy == DrugAllergies.get_drug_allergy!(drug_allergy.id)
    end

    test "delete_drug_allergy/1 deletes the drug_allergy" do
      drug_allergy = drug_allergy_fixture()
      assert {:ok, %DrugAllergy{}} = DrugAllergies.delete_drug_allergy(drug_allergy)
      assert_raise Ecto.NoResultsError, fn -> DrugAllergies.get_drug_allergy!(drug_allergy.id) end
    end

    test "change_drug_allergy/1 returns a drug_allergy changeset" do
      drug_allergy = drug_allergy_fixture()
      assert %Ecto.Changeset{} = DrugAllergies.change_drug_allergy(drug_allergy)
    end
  end
end
