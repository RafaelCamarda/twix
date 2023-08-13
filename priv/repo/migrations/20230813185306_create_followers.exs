defmodule Twix.Repo.Migrations.CreateFollowers do
  use Ecto.Migration

  def change do
    create table(:followers, primary_key: false) do
      add :follower_id, references(:users, on_delete: :delete_all)
      add :following_id, references(:users, on_delete: :delete_all)
    end

    create unique_index(:followers, [:following_id, :follower_id])
  end
end
