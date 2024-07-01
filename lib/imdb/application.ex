defmodule Imdb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ImdbWeb.Telemetry,
      Imdb.Repo,
      {DNSCluster, query: Application.get_env(:imdb, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Imdb.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Imdb.Finch},
      # Start a worker by calling: Imdb.Worker.start_link(arg)
      # {Imdb.Worker, arg},
      # Start to serve requests, typically the last entry
      ImdbWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Imdb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ImdbWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
