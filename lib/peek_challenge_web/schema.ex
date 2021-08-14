defmodule PeekChallengeWeb.Schema do
  @moduledoc "GraphQl schema module."
  use Absinthe.Schema

  alias PeekChallenge.OrdersResolver

  object :order do
    field :id, non_null(:id)
    field :description, :string
    field :total, :float
    field :balance_due, :float
  end

  query do
    @desc "List all orders"
    field :list_orders, non_null(list_of(non_null(:order))) do
      resolve(&OrdersResolver.list_orders/3)
    end
  end
end
