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

  def assign_user(%{id: id, user_id: user_id} = args, _info) do
    conference = Core.Events.get_conference!(id)
    user = Core.Accounts.get_user!(user_id)
    
    Core.Events.assign_user(conference, user)
    {:ok, Core.Events.get_conference!(id)}
  end
end