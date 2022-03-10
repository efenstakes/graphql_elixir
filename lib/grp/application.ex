defmodule Grp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Grp.Repo,
      # Start the Telemetry supervisor
      GrpWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Grp.PubSub},
      # Start the Endpoint (http/https)
      GrpWeb.Endpoint
      # Start a worker by calling: Grp.Worker.start_link(arg)
      # {Grp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Grp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GrpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
