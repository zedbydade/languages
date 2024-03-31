defmodule EmbedsAssociations.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      EmbedsAssociationsWeb.Telemetry,
      # Start the Ecto repository
      EmbedsAssociations.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: EmbedsAssociations.PubSub},
      # Start Finch
      {Finch, name: EmbedsAssociations.Finch},
      # Start the Endpoint (http/https)
      EmbedsAssociationsWeb.Endpoint
      # Start a worker by calling: EmbedsAssociations.Worker.start_link(arg)
      # {EmbedsAssociations.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EmbedsAssociations.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EmbedsAssociationsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
