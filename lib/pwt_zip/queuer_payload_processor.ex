defmodule PwtZip.QueuerPayloadProcessor do
  use Broadway

  alias Broadway.Message
  alias PwtZip.{HNStats, Repo}

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producers: [
        default: [
          module:
            {BroadwayRabbitMQ.Producer,
             queue: PwtZip.RMQPublisher.bulk_item_data_queue_name(),
             connection: [
               username: "rabbitmq",
               password: "rabbitmq"
             ]},
          stages: 1
        ]
      ],
      processors: [
        default: [
          stages: 20
        ]
      ]
    )
  end

  def handle_message(_processor, %Message{data: data} = message, _context) do
    data
    |> Jason.decode!()

    message
  end
end
