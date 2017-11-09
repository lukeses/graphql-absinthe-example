defmodule Core.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Core.Accounts.User


  schema "user" do
    field :first_name, :string
    field :intro, :string
    field :second_name, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :second_name, :intro])
    |> validate_required([:first_name, :second_name, :intro])
  end
end