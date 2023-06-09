defmodule LifelinePhoenix.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LifelinePhoenix.Accounts` context.
  """

  def unique_doctor_email, do: "doctor#{System.unique_integer()}@example.com"
  def valid_doctor_password, do: "hello world!"

  def valid_doctor_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_doctor_email(),
      password: valid_doctor_password()
    })
  end

  def doctor_fixture(attrs \\ %{}) do
    {:ok, doctor} =
      attrs
      |> valid_doctor_attributes()
      |> LifelinePhoenix.Accounts.register_doctor()

    doctor
  end

  def extract_doctor_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end
end
