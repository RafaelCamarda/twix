defmodule Twix.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Twix.Posts.Post
  alias Twix.Users.Follower

  @required_params [:nickname, :email, :age]

  schema "users" do
    field :nickname, :string
    field :email, :string
    field :age, :integer
    has_many :posts, Post
    has_many :followers, Follower, foreign_key: :following_id
    has_many :followings, Follower, foreign_key: :follower_id

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:nickname, min: 1)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> unique_constraint(:nickname)
    |> unique_constraint(:email)
  end
end
