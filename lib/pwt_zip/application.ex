defmodule PwtZip.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      PwtZipWeb.Endpoint,
      :hackney_pool.child_spec(:hn_id_pool, timeout: 15000, max_connections: 100),
      PwtZip.Repo,
      # %{
      #   id: PwtZip.RMQPublisher,
      #   start: {PwtZip.RMQPublisher, :start_link, []}
      # },
      # PwtZip.QueuerIdProcessor,
      # PwtZip.QueuerPayloadProcessor
    ]


    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PwtZip.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PwtZipWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
