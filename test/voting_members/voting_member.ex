defmodule ANovaVoz.VotingMembers.VotingMember do
  use Ecto.Schema
  import Ecto.Changeset

  schema "voting_members" do
    field :vote, :string
    field :vote_description, :string

    belongs_to :unit, ANovaVoz.Units.Unit
    belongs_to :member, ANovaVoz.Members.Member
    belongs_to :voting, ANovaVoz.Votings.Voting

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:unit_id, :member_id, :voting_id, :vote, :vote_description])
    |> validate_required([:unit_id, :member_id, :voting_id, :vote, :vote_description])
  end
end
