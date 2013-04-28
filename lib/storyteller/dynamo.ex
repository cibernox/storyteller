defmodule Storyteller.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated to this Dynamo
    otp_app: :storyteller,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from where static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/static"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_storyteller_session",
  #       secret: "pBny3UrgW2nDfGDQkx1Q9pugZUxoJCGbUR1+48gCBmy2ORkrX0xbeI8xK0LJstJF"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
