defmodule CoreWeb.Schema.Types.Conference do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Core.Repo

  import_types Absinthe.Type.Custom

  @desc "A conference"
  object :conference do

    field :id, :id

    @desc "A name"
    field :name, :string

    @desc "A description"
    field :description, :string

    @desc "A start_time"
    field :start_time, :naive_datetime

    @desc "An end_time"
    field :end_time, :naive_datetime

    @desc "Users associated with conference"
    field :users, list_of(:user), resolve: assoc(:users)
  end
end
