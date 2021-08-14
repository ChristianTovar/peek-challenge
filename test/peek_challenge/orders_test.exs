defmodule PeekChallenge.OrdersTest do
  use PeekChallenge.DataCase
  import PeekChallenge.Factory
  alias PeekChallenge.Orders

  describe "orders" do
    alias PeekChallenge.Orders.Order

    test "list_orders/0 returns all orders" do
      orders = insert_list(10, :order)
      assert Enum.count(Orders.list_orders()) == Enum.count(orders)
    end

    test "get_order/1 returns the order with given id" do
      order = insert(:order)
      assert Orders.get_order(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      attrs = params_for(:order)
      assert {:ok, %Order{} = _order} = Orders.create_order(attrs)
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(%{description: 11})
    end

    test "update_order/2 with valid data updates the order" do
      order = insert(:order)

      assert {:ok, %Order{} = updated_order} =
               Orders.update_order(order, %{description: "updated"})

      refute order == updated_order
      assert updated_order.description == "updated"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = insert(:order)
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, %{description: 64})
      assert order == Orders.get_order(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = insert(:order)
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert is_nil(Orders.get_order(order.id))
    end

    test "change_order/1 returns a order changeset" do
      order = insert(:order)
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end
end
