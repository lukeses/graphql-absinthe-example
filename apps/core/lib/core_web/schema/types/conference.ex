defmodule CoreWeb.Schema.Types.Conference do
  use Absinthe.Schema.Notation

  @desc "A conference"
  object :conference do

    field :id, :id

    @desc "A name"
    field :name, :string
  end
end
