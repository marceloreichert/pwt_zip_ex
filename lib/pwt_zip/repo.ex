defmodule PwtZip.Repo do
  use Ecto.Repo,
    otp_app: :pwt_zip,
    adapter: Ecto.Adapters.Postgres
end
