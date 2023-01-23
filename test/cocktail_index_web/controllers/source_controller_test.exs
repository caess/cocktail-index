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

  describe "delete/2" do
    test "show error when source cannot be deleted", %{conn: conn} do
      source = insert(:source)
      _cocktail = insert(:cocktail, source: source)

      conn =
        conn
        |> delete(Routes.source_path(conn, :delete, source))
        |> fetch_flash()

      assert get_flash(conn, :error) == "Cocktails are still associated with this source."
    end
  end
end
