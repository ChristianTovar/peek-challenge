defmodule PeekChallenge.OrdersResolver do
  @moduledoc "Orders resolver module."

  alias PeekChallenge.Orders

  def list_orders(_root, _args, _info), do: {:ok, Orders.list_orders()}

  def create_order(_root, args, _info) do
    case Orders.create_order(args) do
      {:ok, order} ->
        {:ok, order}

      _error ->
        {:error, "Could not create order."}
    end
  end

  def update_order(_root, %{order_id: id} = args, _info) do
    case Orders.update_order_by_id(id, args) do
      {:ok, order} ->
        {:ok, order}

      _error ->
        {:error, "Could not create order."}
    end
  end
end
