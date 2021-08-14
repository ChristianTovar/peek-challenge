defmodule PeekChallenge.Factory do
  @moduledoc """
  Factories module for testing purposes. 
  """

  use ExMachina.Ecto, repo: PeekChallenge.Repo

  alias PeekChallenge.Orders.Order

  def order_factory do
    %Order{
      description: sequence(:descrption, &"description-#{&1}"),
      total: 0,
      balance_due: 0
    }
  end
end
