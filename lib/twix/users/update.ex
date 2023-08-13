defmodule Twix.Users.Update do
  alias Twix.Repo
  alias Twix.Users.User

  def call(%{id: id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
