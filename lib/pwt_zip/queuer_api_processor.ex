defmodule PwtZip.QueuerApiProcessor do
  @moduledoc """
  Fetches data from the API and massages some data
  """

  require Logger

  @headers ["Accept": "Application/json"]

  def get_api_item(resource_id) do
    get_api_item(resource_id, 4)
  end

  defp get_api_item(resource_id, retry) do
    response =
      gen_api_url()
      |> HTTPoison.get(@headers, hackney: [pool: :hn_id_pool])

    with {_, {:ok, body}} <- {"response_api", handle_response(response)} do
      body
    else
      {stage, error} ->
        Logger.warn(
          "Failed attempt #{5 - retry} at stage \"#{stage}\" with Process ID of #{resource_id}. Error details: #{
            inspect(error)
          }"
        )

        if retry > 0 do
          get_api_item(resource_id, retry - 1)
        else
          Logger.warn("Failed to retrieve Process ID of #{resource_id}.")
          :error
        end
    end
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_response({_, invalid_response}) do
    {:error, invalid_response}
  end

  defp gen_api_url() do
    "http://legis.senado.leg.br/dadosabertos/senador/lista/atual"
  end

  # defp message_data(data) do
  #   {:ok,
  #    HackernewsItem.create(
  #      data["text"],
  #      data["type"],
  #      data["title"],
  #      data["time"]
  #    )}
  # end
end
