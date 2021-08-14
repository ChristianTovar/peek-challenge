defmodule PeekChallenge.Orders.Order do
  @moduledoc "Order schema module."

  use Ecto.Schema
  import Ecto.Changeset
  alias PeekChallenge.Orders.Payment

  @type t :: %__MODULE__{
          id: String.t(),
          balance_due: float(),
          description: String.t(),
          total: float(),
          payments: [Payment.t()]
        }

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orders" do
    field :balance_due, :float
    field :description, :string
    field :total, :float
    embeds_many :payments, Payment

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:description, :total])
    |> cast_embed(:payments)
    |> validate_required([:total, :payments])
    |> validate_payments()
  end

  defp validate_payments(%{changes: %{payments: payments}} = changeset) do
    payments
    |> Enum.map(fn %{changes: %{amount: amount}} -> amount end)
    |> Enum.sum()
    |> set_balance(changeset)
  end

  defp validate_payments(changeset), do: changeset

  defp set_balance(total_amount, %{changes: %{total: total} = changes} = changeset)
       when total - total_amount >= 0 do
    %{changeset | changes: Map.put(changes, :balance_due, total - total_amount)}
  end

  defp set_balance(total_amount, %{changes: %{total: total}} = changeset)
       when total - total_amount < 0 do
    %{changeset | valid?: false}
  end

  defp set_balance(_total_amount, changeset), do: changeset
end
