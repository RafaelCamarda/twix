defmodule Twix.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nickname, :string
      add :email, :string
      add :age, :integer

      timestamps()
    end

    create unique_index(:users, [:nickname])
    create unique_index(:users, [:email])
  end
end
