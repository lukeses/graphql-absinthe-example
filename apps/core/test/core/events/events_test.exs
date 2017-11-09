defmodule Core.EventsTest do
  use Core.DataCase

  alias Core.Events

  describe "conferences" do
    alias Core.Events.Conference

    @valid_attrs %{description: "some description", end_time: ~N[2010-04-17 14:00:00.000000], name: "some name", start_time: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{description: "some updated description", end_time: ~N[2011-05-18 15:01:01.000000], name: "some updated name", start_time: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{description: nil, end_time: nil, name: nil, start_time: nil}

    def conference_fixture(attrs \\ %{}) do
      {:ok, conference} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_conference()

      conference
    end

    test "list_conferences/0 returns all conferences" do
      conference = conference_fixture()
      assert Events.list_conferences() == [conference]
    end

    test "get_conference!/1 returns the conference with given id" do
      conference = conference_fixture()
      assert Events.get_conference!(conference.id) == conference
    end

    test "create_conference/1 with valid data creates a conference" do
      assert {:ok, %Conference{} = conference} = Events.create_conference(@valid_attrs)
      assert conference.description == "some description"
      assert conference.end_time == ~N[2010-04-17 14:00:00.000000]
      assert conference.name == "some name"
      assert conference.start_time == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_conference/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_conference(@invalid_attrs)
    end

    test "update_conference/2 with valid data updates the conference" do
      conference = conference_fixture()
      assert {:ok, conference} = Events.update_conference(conference, @update_attrs)
      assert %Conference{} = conference
      assert conference.description == "some updated description"
      assert conference.end_time == ~N[2011-05-18 15:01:01.000000]
      assert conference.name == "some updated name"
      assert conference.start_time == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_conference/2 with invalid data returns error changeset" do
      conference = conference_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_conference(conference, @invalid_attrs)
      assert conference == Events.get_conference!(conference.id)
    end

    test "delete_conference/1 deletes the conference" do
      conference = conference_fixture()
      assert {:ok, %Conference{}} = Events.delete_conference(conference)
      assert_raise Ecto.NoResultsError, fn -> Events.get_conference!(conference.id) end
    end

    test "change_conference/1 returns a conference changeset" do
      conference = conference_fixture()
      assert %Ecto.Changeset{} = Events.change_conference(conference)
    end
  end

  describe "meetups" do
    alias Core.Events.Meetup

    @valid_attrs %{description: "some description", end_time: ~N[2010-04-17 14:00:00.000000], name: "some name", start_time: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{description: "some updated description", end_time: ~N[2011-05-18 15:01:01.000000], name: "some updated name", start_time: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{description: nil, end_time: nil, name: nil, start_time: nil}

    def meetup_fixture(attrs \\ %{}) do
      {:ok, meetup} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_meetup()

      meetup
    end

    test "list_meetups/0 returns all meetups" do
      meetup = meetup_fixture()
      assert Events.list_meetups() == [meetup]
    end

    test "get_meetup!/1 returns the meetup with given id" do
      meetup = meetup_fixture()
      assert Events.get_meetup!(meetup.id) == meetup
    end

    test "create_meetup/1 with valid data creates a meetup" do
      assert {:ok, %Meetup{} = meetup} = Events.create_meetup(@valid_attrs)
      assert meetup.description == "some description"
      assert meetup.end_time == ~N[2010-04-17 14:00:00.000000]
      assert meetup.name == "some name"
      assert meetup.start_time == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_meetup/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_meetup(@invalid_attrs)
    end

    test "update_meetup/2 with valid data updates the meetup" do
      meetup = meetup_fixture()
      assert {:ok, meetup} = Events.update_meetup(meetup, @update_attrs)
      assert %Meetup{} = meetup
      assert meetup.description == "some updated description"
      assert meetup.end_time == ~N[2011-05-18 15:01:01.000000]
      assert meetup.name == "some updated name"
      assert meetup.start_time == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_meetup/2 with invalid data returns error changeset" do
      meetup = meetup_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_meetup(meetup, @invalid_attrs)
      assert meetup == Events.get_meetup!(meetup.id)
    end

    test "delete_meetup/1 deletes the meetup" do
      meetup = meetup_fixture()
      assert {:ok, %Meetup{}} = Events.delete_meetup(meetup)
      assert_raise Ecto.NoResultsError, fn -> Events.get_meetup!(meetup.id) end
    end

    test "change_meetup/1 returns a meetup changeset" do
      meetup = meetup_fixture()
      assert %Ecto.Changeset{} = Events.change_meetup(meetup)
    end
  end
end
