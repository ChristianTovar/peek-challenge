defmodule PeekChallenge.Orders do
  @moduledoc """
  The Orders context.
  """

  import Ecto.Query, warn: false
  alias PeekChallenge.Repo

  alias PeekChallenge.Orders.Order

  @doc "Returns the list of orders."
  @spec list_orders :: [Order.t()]
  def list_orders, do: Repo.all(Order)

  @doc "Gets a single order."
  @spec get_order(String.t()) :: Order.t() | nil
  def get_order(id), do: Repo.get(Order, id)

  @doc "Creates an order."
  @spec create_order :: {:ok, Order.t()} | {:error, Ecto.Changeset.t()}
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc "Updates an order."
  @spec update_order(Order.t(), map()) :: {:ok, Order.t()} | {:error, Ecto.Changeset.t()}
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc "Updates order by id."
  @spec update_order_by_id(String.t(), map()) :: {:ok, Order.t()} | {:error, Ecto.Changeset.t()}
  def update_order_by_id(id, attrs) do
    id
    |> get_order()
    |> Order.payment_changeset(attrs)
    |> Repo.update()
  end

  @doc "Deletes an order."
  @spec delete_order(Order.t()) :: {:ok, Order.t()} | {:error, Ecto.Changeset.t()}
  def delete_order(%Order{} = order), do: Repo.delete(order)

  @doc "Returns an `%Ecto.Changeset{}` for tracking user changes."
  @spec change_order(User.t(), map()) :: Ecto.Changeset.t()
  def change_order(%Order{} = order, attrs \\ %{}), do: Order.changeset(order, attrs)
end
