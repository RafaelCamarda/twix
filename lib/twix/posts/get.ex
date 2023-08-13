defmodule Twix.Posts.Get do
  alias Twix.Posts.Post
  alias Twix.Repo

  import Ecto.Query

  def call(user, page, per_page) do
    posts_query =
      from p in Post,
        where: p.user_id == ^user.id,
        order_by: [asc: p.id],
        offset: (^page - 1) * ^per_page,
        limit: ^per_page

    {:ok, Repo.all(posts_query)}
  end
end
