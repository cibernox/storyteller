Dynamo.under_test(Storyteller.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Storyteller.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup_all do
    Dynamo.Loader.enable
    :ok
  end
end
