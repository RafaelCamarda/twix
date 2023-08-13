defmodule Twix.Users.Create do
  alias Twix.Repo
  alias Twix.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
