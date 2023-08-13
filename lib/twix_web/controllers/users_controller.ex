defmodule TwixWeb.UsersController do
  use TwixWeb, :controller
  use Absinthe.Phoenix.Controller, schema: TwixWeb.Schema, action: [mode: :internal]

  @graphql """
    query {
      users {
        id
        nickname
        age
        email
      }
    }
  """
  def index(conn, %{data: data}) do
    conn
    |> put_status(:ok)
    |> render(:index, data: data)
  end
end
