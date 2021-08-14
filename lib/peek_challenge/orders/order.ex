defmodule PeekChallenge.Orders.Order do
  @moduledoc "Order schema module."

  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          id: String.t(),
          balance_due: float(),
          description: String.t(),
          total: float()
        }

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orders" do
    field :balance_due, :float
    field :description, :string
    field :total, :float

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:description, :total, :balance_due])
    |> validate_required([:total, :balance_due])
  end
end
