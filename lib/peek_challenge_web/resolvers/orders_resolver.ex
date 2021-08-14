defmodule PeekChallenge.OrdersResolver do
  @moduledoc "Orders resolver module."

  alias PeekChallenge.Orders

  def list_orders(_root, _args, _info), do: {:ok, Orders.list_orders()}
end
