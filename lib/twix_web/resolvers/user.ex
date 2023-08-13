defmodule TwixWeb.Resolvers.User do
  def add_follower(%{input: %{user_id: user_id, follower_id: follower_id}}, _context) do
    Twix.add_follower(user_id, follower_id)
    # with {:ok, result} <- Twix.add_follower(user_id, follower_id) do
    #   Absinthe.Subscription.publish(TwixWeb.Endpoint, result, new_follow: "new_follow_topic")
    #   {:ok, result}
    # end
  end

  def create(%{input: params}, _context), do: Twix.create_user(params)
  def get(%{id: id}, _context), do: Twix.get_user(id)

  def get_user_posts(user, %{page: page, per_page: per_page}, _context) do
    Twix.get_user_posts(user, page, per_page)
  end

  def update(%{input: params}, _context), do: Twix.update_user(params)
end
