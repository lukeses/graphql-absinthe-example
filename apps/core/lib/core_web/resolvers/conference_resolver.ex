defmodule CoreWeb.Resolvers.ConferenceResolver do
  def all(_args, _info) do
    {:ok, Core.Events.list_conferences}
  end

  def create(args, _info) do
    Core.Events.create_conference(args)
  end

  def update(%{id: id} = args, _info) do
    conference = Core.Events.get_conference!(id)
    Core.Events.update_conference(conference, args)
  end

  def get(%{id: id} = args, _info) do
    {:ok, Core.Events.get_conference!(id)}
  end
end