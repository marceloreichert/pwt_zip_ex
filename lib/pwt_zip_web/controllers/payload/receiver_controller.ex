defmodule PwtZipWeb.Payload.ReceiverController do
  use PwtZipWeb, :controller

  def create(conn, params) do
    PwtZip.handle_messages(params)
    send_resp(conn, 200, "PAYLOAD_RECEIVED")
  end
end
