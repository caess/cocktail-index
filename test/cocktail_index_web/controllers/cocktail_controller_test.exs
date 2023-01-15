defmodule CocktailIndexWeb.CocktailControllerTest do
  use CocktailIndexWeb.ConnCase

  describe "create/2" do
    test "renders new page with errors when data is invalid", %{conn: conn} do
      insert(:cocktail, name: "elixir")
      params = string_params_for(:cocktail, name: "elixir")

      response =
        conn
        |> post(Routes.cocktail_path(conn, :create), %{"cocktail" => params})
        |> html_response(200)

      assert response =~ "has already been taken"
    end
  end
end
