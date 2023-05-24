defmodule LifelinePhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LifelinePhoenix.Repo,
      # Start the Telemetry supervisor
      LifelinePhoenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LifelinePhoenix.PubSub},
      # Start the Endpoint (http/https)
      LifelinePhoenixWeb.Endpoint
      # Start a worker by calling: LifelinePhoenix.Worker.start_link(arg)
      # {LifelinePhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LifelinePhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LifelinePhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
