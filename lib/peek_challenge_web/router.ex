defmodule PeekChallengeWeb.Router do
  use PeekChallengeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PeekChallengeWeb do
    pipe_through :api
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PeekChallengeWeb.Schema,
      interface: :simple,
      context: %{pubsub: PeekChallengeWeb.Endpoint}
  end
end
