defmodule LifelinePhoenixWeb.PatientController do
  use LifelinePhoenixWeb, :controller

  alias LifelinePhoenix.Patients
  alias LifelinePhoenix.Patients.Patient
  alias LifelinePhoenix.Reviews.Review
  alias LifelinePhoenix.Reviews


  def index(conn, _params) do
    patients = Patients.list_patients()
    render(conn, "index.html", patients: patients)
  end

  def new(conn, _params) do
    changeset = Patients.change_patient(%Patient{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"patient" => patient_params}) do
    patient_params = Map.put(patient_params, "doctor_id", conn.assigns.current_doctor.id)
    case Patients.create_patient(patient_params) do
      {:ok, patient} ->
        conn
        |> put_flash(:info, "Patient created successfully.")
        |> redirect(to: Routes.patient_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    patient = Patients.get_patient!(id)
    render(conn, "show.html", patient: patient)
  end

  def edit(conn, %{"id" => id}) do
    patient = Patients.get_patient!(id)
    changeset = Patients.change_patient(patient)
    render(conn, "edit.html", patient: patient, changeset: changeset)
  end

  def update(conn, %{"id" => id, "patient" => patient_params}) do
    patient = Patients.get_patient!(id)

    case Patients.update_patient(patient, patient_params) do
      {:ok, patient} ->
        conn
        |> put_flash(:info, "Patient updated successfully.")
        |> redirect(to: Routes.patient_path(conn, :show, patient))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", patient: patient, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    patient = Patients.get_patient!(id)
    {:ok, _patient} = Patients.delete_patient(patient)

    conn
    |> put_flash(:info, "Patient deleted successfully.")
    |> redirect(to: Routes.patient_path(conn, :index))
  end


  def add_a_drug_allergy(conn, %{"drug_allergy" => drug_allergy_params, "patient_id" => patient_id}) do
   patient =
     patient_id
      |> Patients.get_book!()
      |> Repo.preload([:drug_allergies])
     case Patients.add_drug_allergy(patient_id, drug_allergy_params) do
      {:ok, _drug_allergy} ->
        conn
        |> put_flash(:info, "drug_allergy added :)")
        |> redirect(to: Routes.patient_path(conn, :show, patient))
      {:error, _error} ->
        conn
        |> put_flash(:error, "drug_allergy not added :(")
        |> redirect(to: Routes.patient_path(conn, :show, patient))

    end
  end


  
end
