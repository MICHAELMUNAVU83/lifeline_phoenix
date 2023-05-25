defmodule LifelinePhoenixWeb.PatientControllerTest do
  use LifelinePhoenixWeb.ConnCase

  import LifelinePhoenix.PatientsFixtures

  @create_attrs %{
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
  @update_attrs %{
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

  describe "index" do
    test "lists all patients", %{conn: conn} do
      conn = get(conn, Routes.patient_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Patients"
    end
  end

  describe "new patient" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.patient_path(conn, :new))
      assert html_response(conn, 200) =~ "New Patient"
    end
  end

  describe "create patient" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.patient_path(conn, :show, id)

      conn = get(conn, Routes.patient_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Patient"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Patient"
    end
  end

  describe "edit patient" do
    setup [:create_patient]

    test "renders form for editing chosen patient", %{conn: conn, patient: patient} do
      conn = get(conn, Routes.patient_path(conn, :edit, patient))
      assert html_response(conn, 200) =~ "Edit Patient"
    end
  end

  describe "update patient" do
    setup [:create_patient]

    test "redirects when data is valid", %{conn: conn, patient: patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @update_attrs)
      assert redirected_to(conn) == Routes.patient_path(conn, :show, patient)

      conn = get(conn, Routes.patient_path(conn, :show, patient))
      assert html_response(conn, 200) =~ "some updated blood_group"
    end

    test "renders errors when data is invalid", %{conn: conn, patient: patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Patient"
    end
  end

  describe "delete patient" do
    setup [:create_patient]

    test "deletes chosen patient", %{conn: conn, patient: patient} do
      conn = delete(conn, Routes.patient_path(conn, :delete, patient))
      assert redirected_to(conn) == Routes.patient_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.patient_path(conn, :show, patient))
      end
    end
  end

  defp create_patient(_) do
    patient = patient_fixture()
    %{patient: patient}
  end
end
