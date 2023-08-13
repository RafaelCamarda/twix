defmodule Twix.Users.Follower do
  use Ecto.Schema
  import Ecto.Changeset

  alias Twix.Users.User

  @required_params [:follower_id, :following_id]

  @primary_key false
  schema "followers" do
    belongs_to :follower, User
    belongs_to :following, User
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:following_id, :follower_id])
  end
end
