defmodule LifelinePhoenixWeb.Router do
  use LifelinePhoenixWeb, :router

  import LifelinePhoenixWeb.DoctorAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LifelinePhoenixWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_doctor
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LifelinePhoenixWeb do
    pipe_through [:browser, :require_authenticated_doctor]

    get "/", PatientController, :index

    resources "/patients", PatientController do
      post "/drug_allergies", PatientController, :add_a_drug_allergy
      post "/food_allergies", PatientController, :add_a_food_allergy
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", LifelinePhoenixWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LifelinePhoenixWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", LifelinePhoenixWeb do
    pipe_through [:browser, :redirect_if_doctor_is_authenticated]

    get "/doctors/register", DoctorRegistrationController, :new
    post "/doctors/register", DoctorRegistrationController, :create
    get "/doctors/log_in", DoctorSessionController, :new
    post "/doctors/log_in", DoctorSessionController, :create
    get "/doctors/reset_password", DoctorResetPasswordController, :new
    post "/doctors/reset_password", DoctorResetPasswordController, :create
    get "/doctors/reset_password/:token", DoctorResetPasswordController, :edit
    put "/doctors/reset_password/:token", DoctorResetPasswordController, :update
  end

  scope "/", LifelinePhoenixWeb do
    pipe_through [:browser, :require_authenticated_doctor]

    get "/doctors/settings", DoctorSettingsController, :edit
    put "/doctors/settings", DoctorSettingsController, :update
    get "/doctors/settings/confirm_email/:token", DoctorSettingsController, :confirm_email
  end

  scope "/", LifelinePhoenixWeb do
    pipe_through [:browser]

    delete "/doctors/log_out", DoctorSessionController, :delete
    get "/doctors/confirm", DoctorConfirmationController, :new
    post "/doctors/confirm", DoctorConfirmationController, :create
    get "/doctors/confirm/:token", DoctorConfirmationController, :edit
    post "/doctors/confirm/:token", DoctorConfirmationController, :update
  end
end
