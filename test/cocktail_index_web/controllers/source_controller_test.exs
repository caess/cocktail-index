defmodule CocktailIndexWeb.SourceControllerTest do
  use CocktailIndexWeb.ConnCase

  describe "create/2" do
    test "renders new page with errors when data is invalid", %{conn: conn} do
      insert(:source, name: "elixir")
      params = string_params_for(:source, name: "elixir")

      response =
        conn
        |> post(Routes.source_path(conn, :create), %{"source" => params})
        |> html_response(200)

      assert response =~ "has already been taken"
    end
  end

  describe "update/2" do
    test "renders edit page with errors when data is invalid", %{conn: conn} do
      insert(:source, name: "elixir")
      source = insert(:source)
      params = string_params_for(:source, name: "elixir")

      response =
        conn
        |> put(Routes.source_path(conn, :update, source), %{"source" => params})
        |> html_response(200)

      assert response =~ "has already been taken"
    end
  end
end
