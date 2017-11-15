defmodule Core.Repo.Migrations.CreateConferencesUsersTable do
  use Ecto.Migration

  def change do
    create table(:conferences_users, primary_key: false) do
      add :conference_id, references(:conferences)
      add :user_id, references(:users)
    end
  end
end
