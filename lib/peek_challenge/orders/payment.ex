defmodule PeekChallenge.Orders.Payment do
  @moduledoc "Payment embedded schema module."

  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          amount: float(),
          applied_at: NaiveDateTime.t(),
          note: String.t()
        }

  @primary_key false
  embedded_schema do
    field :amount, :float
    field :applied_at, :naive_datetime
    field :note, :string
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:amount, :note])
    |> set_application_date()
    |> validate_required([:amount, :applied_at])
  end

  defp set_application_date(%{changes: changes} = changeset),
    do: %{changeset | changes: Map.put(changes, :applied_at, NaiveDateTime.utc_now())}
end
