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

  mutation do
    @desc "Create a new order"
    field :create_order, :order do
      arg(:description, non_null(:string))
      arg(:total, :float)
      arg(:balance_due, :float)

      resolve(&OrdersResolver.create_order/3)
    end
  end
end
