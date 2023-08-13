defmodule Twix.Posts.Create do
  alias Twix.Repo
  alias Twix.Posts.Post

  def call(params) do
    params
    |> Post.changeset()
    |> Repo.insert()
  end
end
