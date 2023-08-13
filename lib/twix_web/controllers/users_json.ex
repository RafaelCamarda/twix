defmodule TwixWeb.UsersJSON do
  def index(%{data: %{users: users}}) do
    %{users: for(user <- users, do: user(user))}
  end

  defp user(user) do
    %{
      nickname: user.nickname,
      email: user.email,
      age: user.age,
      id: user.id
    }
  end
end
