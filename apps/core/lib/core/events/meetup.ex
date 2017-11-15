defmodule Core.Events.Meetup do
  use Ecto.Schema
  import Ecto.Changeset
  alias Core.Events.Meetup


  schema "meetups" do
    field :description, :string
    field :end_time, :naive_datetime
    field :name, :string
    field :start_time, :naive_datetime

    timestamps()
  end

  def changeset(%Meetup{} = meetup, attrs) do
    meetup
    |> cast(attrs, [:name, :start_time, :end_time, :description])
    |> validate_required([:name, :start_time, :end_time, :description])
  end
end
