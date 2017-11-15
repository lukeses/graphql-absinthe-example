defmodule Core.Events.Conference do
  use Ecto.Schema
  import Ecto.Changeset
  alias Core.Events.Conference


  schema "conferences" do
    field :description, :string
    field :end_time, :naive_datetime
    field :name, :string
    field :start_time, :naive_datetime

    timestamps()
  end

  def changeset(%Conference{} = conference, attrs) do
    conference
    |> cast(attrs, [:name, :start_time, :end_time, :description])
    |> validate_required([:name])
  end
end
