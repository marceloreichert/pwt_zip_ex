defmodule PwtZip do
  @moduledoc """
  Documentation for `PwtZip`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PwtZip.hello()
      :world

  """
  def handle_messages(payload) do

    # colocar no fila para processar o payload

    # FILA
    # baixar o arquivo
    # zipar
    # colocar no s3
    # mandar email informando

require IEx
IEx.pry()
    :zip.create('files.zip', ['IMG_2493.mov'], cwd: '/Users/marceloreichert/Downloads')

  end
end
