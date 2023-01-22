defmodule CocktailIndexWeb.GlassControllerTest do
  use CocktailIndexWeb.ConnCase

  describe "create/2" do
    test "renders new page with errors when data is invalid", %{conn: conn} do
      insert(:glass, name: "elixir")
      params = string_params_for(:glass, name: "elixir")

      response =
        conn
        |> post(Routes.glass_path(conn, :create), %{"glass" => params})
        |> html_response(200)

      assert response =~ "has already been taken"
    end
  end

  describe "update/2" do
    test "renders edit page with errors when data is invalid", %{conn: conn} do
      insert(:glass, name: "elixir")
      glass = insert(:glass)
      params = string_params_for(:glass, name: "elixir")

      response =
        conn
        |> put(Routes.glass_path(conn, :update, glass), %{"glass" => params})
        |> html_response(200)

      assert response =~ "has already been taken"
    end
  end

  describe "delete/2" do
    test "show error when glass cannot be deleted", %{conn: conn} do
      glass = insert(:glass)
      _cocktail = insert(:cocktail, glass: glass)

      conn =
        conn
        |> delete(Routes.glass_path(conn, :delete, glass))
        |> fetch_flash()

      assert get_flash(conn, :error) == "Cocktails are still associated with this glass."
    end
  end
end
