defmodule Core.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :second_name, :string
      add :intro, :string

      timestamps()
    end

  end
end
