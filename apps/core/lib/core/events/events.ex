defmodule Core.Events do
  import Ecto.Query, warn: false
  alias Core.Repo

  alias Core.Events.Conference

  def list_conferences do
    Repo.all(Conference)
  end

  def get_conference!(id), do: Repo.get!(Conference, id)

  def create_conference(attrs \\ %{}) do
    IO.inspect attrs, label: "CONF"
    %Conference{}
    |> Conference.changeset(attrs)
    |> Repo.insert()
  end

  def update_conference(%Conference{} = conference, attrs) do
    conference
    |> Conference.changeset(attrs)
    |> Repo.update()
  end

  def delete_conference(%Conference{} = conference) do
    Repo.delete(conference)
  end

  def change_conference(%Conference{} = conference) do
    Conference.changeset(conference, %{})
  end

  alias Core.Events.Meetup

  def list_meetups do
    Repo.all(Meetup)
  end

  def get_meetup!(id), do: Repo.get!(Meetup, id)

  def create_meetup(attrs \\ %{}) do
    %Meetup{}
    |> Meetup.changeset(attrs)
    |> Repo.insert()
  end

  def update_meetup(%Meetup{} = meetup, attrs) do
    meetup
    |> Meetup.changeset(attrs)
    |> Repo.update()
  end

  def delete_meetup(%Meetup{} = meetup) do
    Repo.delete(meetup)
  end

  def change_meetup(%Meetup{} = meetup) do
    Meetup.changeset(meetup, %{})
  end

  def assign_user(%Conference{} = conference, %Core.Accounts.User{} = user) do
    conference
    |> Repo.preload(:users)
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:users, [user])
    |> Repo.update()
  end
end
