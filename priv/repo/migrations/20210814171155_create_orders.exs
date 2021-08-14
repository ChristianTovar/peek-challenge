defmodule PeekChallenge.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :description, :string
      add :total, :float
      add :balance_due, :float
      add :payments, :jsonb, default: "[]"

      timestamps()
    end
  end
end
