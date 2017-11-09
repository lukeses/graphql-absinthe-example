defmodule Core.Repo.Migrations.CreateConferences do
  use Ecto.Migration

  def change do
    create table(:conferences) do
      add :name, :string
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :description, :string

      timestamps()
    end

  end
end
