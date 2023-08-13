defmodule TwixWeb.Schema do
  use Absinthe.Schema

  import_types TwixWeb.Schema.Types.Root

  query do
    import_fields :root_query
  end

  mutation do
    import_fields :root_mutation
  end

  subscription do
    import_fields :root_subscription
  end
end
