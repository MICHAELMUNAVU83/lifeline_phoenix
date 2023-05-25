defmodule LifelinePhoenix.PatientsTest do
  use LifelinePhoenix.DataCase

  alias LifelinePhoenix.Patients

  describe "patients" do
    alias LifelinePhoenix.Patients.Patient

    import LifelinePhoenix.PatientsFixtures

    @invalid_attrs %{
      asthmatic: nil,
      blood_group: nil,
      date_of_birth: nil,
      diabetic: nil,
      first_name: nil,
      hypertensive: nil,
      last_name: nil,
      national_id: nil,
      telephone: nil
    }

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Patients.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Patients.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      valid_attrs = %{
        asthmatic: true,
        blood_group: "some blood_group",
        date_of_birth: ~D[2023-05-23],
        diabetic: true,
        first_name: "some first_name",
        hypertensive: true,
        last_name: "some last_name",
        national_id: 42,
        telephone: "some telephone"
      }

      assert {:ok, %Patient{} = patient} = Patients.create_patient(valid_attrs)
      assert patient.asthmatic == true
      assert patient.blood_group == "some blood_group"
      assert patient.date_of_birth == ~D[2023-05-23]
      assert patient.diabetic == true
      assert patient.first_name == "some first_name"
      assert patient.hypertensive == true
      assert patient.last_name == "some last_name"
      assert patient.national_id == 42
      assert patient.telephone == "some telephone"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Patients.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()

      update_attrs = %{
        asthmatic: false,
        blood_group: "some updated blood_group",
        date_of_birth: ~D[2023-05-24],
        diabetic: false,
        first_name: "some updated first_name",
        hypertensive: false,
        last_name: "some updated last_name",
        national_id: 43,
        telephone: "some updated telephone"
      }

      assert {:ok, %Patient{} = patient} = Patients.update_patient(patient, update_attrs)
      assert patient.asthmatic == false
      assert patient.blood_group == "some updated blood_group"
      assert patient.date_of_birth == ~D[2023-05-24]
      assert patient.diabetic == false
      assert patient.first_name == "some updated first_name"
      assert patient.hypertensive == false
      assert patient.last_name == "some updated last_name"
      assert patient.national_id == 43
      assert patient.telephone == "some updated telephone"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Patients.update_patient(patient, @invalid_attrs)
      assert patient == Patients.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Patients.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Patients.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Patients.change_patient(patient)
    end
  end
end
