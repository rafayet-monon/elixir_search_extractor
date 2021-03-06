defmodule ElixirSearchExtractorWeb.AuthenticationPage.LoginPageTest do
  use ElixirSearchExtractorWeb.FeatureCase, async: true

  feature "view log in page", %{session: session} do
    session
    |> visit(Routes.user_session_path(ElixirSearchExtractorWeb.Endpoint, :new))
    |> assert_has(Query.text("Log in to Extractor!"))
  end

  feature "view dashboard after successful log in", %{session: session} do
    session
    |> register_and_login()
    |> assert_has(Query.text("Keyword Report"))
  end
end
