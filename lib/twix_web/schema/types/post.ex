defmodule TwixWeb.Schema.Types.Post do
  use Absinthe.Schema.Notation

  object :post do
    field :id, non_null(:id)
    field :text, non_null(:string)
    field :likes, non_null(:integer)
  end

  input_object :create_post_input do
    field :user_id, non_null(:id)
    field :text, non_null(:string)
  end
end
