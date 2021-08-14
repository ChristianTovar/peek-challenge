defmodule PeekChallengeWeb.Schema do
  @moduledoc "GraphQl schema module."
  use Absinthe.Schema

  alias PeekChallenge.OrdersResolver

  import_types(Absinthe.Type.Custom)

  object :order do
    field :id, non_null(:id)
    field :description, :string
    field :total, :float
    field :balance_due, :float
    field :payment, list_of(:payment)
  end

  object :payment do
    field :note, :string
    field :amount, :float
    field :applied_at, :datetime
  end

  input_object :payments do
    field :note, :string
    field :amount, :float
    field :applied_at, :datetime
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
      arg(:payments, list_of(:payments))

      resolve(&OrdersResolver.create_order/3)
    end
  end
end
