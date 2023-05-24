defmodule LifelinePhoenix.PatientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LifelinePhoenix.Patients` context.
  """

  @doc """
  Generate a patient.
  """
  def patient_fixture(attrs \\ %{}) do
    {:ok, patient} =
      attrs
      |> Enum.into(%{
        asthmatic: true,
        blood_group: "some blood_group",
        date_of_birth: ~D[2023-05-23],
        diabetic: true,
        first_name: "some first_name",
        hypertensive: true,
        last_name: "some last_name",
        national_id: 42,
        telephone: "some telephone"
      })
      |> LifelinePhoenix.Patients.create_patient()

    patient
  end
end
