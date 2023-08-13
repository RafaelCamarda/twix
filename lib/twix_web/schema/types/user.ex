defmodule TwixWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  alias TwixWeb.Resolvers.User, as: UserResolver

  @desc "User logic representation. Banana Description"
  object :user do
    field :id, non_null(:id)
    field :nickname, non_null(:string)
    field :age, non_null(:integer), description: "Needs to be greater than or equal to 18"
    field :email, non_null(:string)

    field :posts, list_of(:post),
      description: "Returns posts paginated. The default values are page: 1 and per_page: 10" do
      arg :page, :integer, default_value: 1
      arg :per_page, :integer, default_value: 10

      resolve &UserResolver.get_user_posts/3
    end

    field :followers, list_of(:follower)
    field :followings, list_of(:following)
  end

  object :follower do
    field :follower_id, non_null(:id)
    field :follower, non_null(:user)
  end

  object :following do
    field :following_id, non_null(:id)
    field :following, non_null(:user)
  end

  object :add_follower_response do
    field :following_id, non_null(:id)
    field :follower_id, non_null(:id)
  end

  input_object :add_follower_input do
    field :user_id, non_null(:id)
    field :follower_id, non_null(:id)
  end

  input_object :create_user_input do
    field :nickname, non_null(:string)
    field :age, non_null(:integer)
    field :email, non_null(:string)
  end

  input_object :update_user_input do
    field :id, non_null(:id)
    field :nickname, :string
    field :age, :integer
    field :email, :string
  end
end
