defmodule CocktailIndexWeb.CocktailControllerTest do
  use CocktailIndexWeb.ConnCase

  describe "create/2" do
    test "renders new page with errors when data is invalid", %{conn: conn} do
      glass = insert(:glass)
      insert(:cocktail, name: "elixir")
      params = string_params_for(:cocktail, name: "elixir", glass_id: glass.id)

      response =
        conn
        |> post(Routes.cocktail_path(conn, :create), %{"cocktail" => params})
        |> html_response(200)

      assert response =~ "has already been taken"
    end

    test "renders new page with errors if glass does not exist", %{conn: conn} do
      params = string_params_for(:cocktail, name: "elixir", glass_id: 5, glass: nil)

      response =
        conn
        |> post(Routes.cocktail_path(conn, :create), %{"cocktail" => params})
        |> html_response(200)

      assert response =~ "does not exist"
    end

    test "renders new page with errors if sourc does not exist", %{conn: conn} do
      params = string_params_for(:cocktail, name: "elixir", source_id: 5, source: nil)

      response =
        conn
        |> post(Routes.cocktail_path(conn, :create), %{"cocktail" => params})
        |> html_response(200)

      assert response =~ "does not exist"
    end
  end

  describe "update/2" do
    test "renders edit page with errors when data is invalid", %{conn: conn} do
      glass = insert(:glass)
      insert(:cocktail, name: "elixir", glass: glass)
      cocktail = insert(:cocktail)
      params = string_params_for(:cocktail, name: "elixir", glass_id: glass.id)

      response =
        conn
        |> put(Routes.cocktail_path(conn, :update, cocktail), %{"cocktail" => params})
        |> html_response(200)

      assert response =~ "has already been taken"
    end

    test "renders edit page with errors if glass does not exist", %{conn: conn} do
      cocktail = insert(:cocktail, name: "elixir")
      params = string_params_for(:cocktail, name: "elixir", glass_id: 5, glass: nil)

      response =
        conn
        |> put(Routes.cocktail_path(conn, :update, cocktail), %{"cocktail" => params})
        |> html_response(200)

      assert response =~ "does not exist"
    end

    test "renders edit page with errors if source does not exist", %{conn: conn} do
      cocktail = insert(:cocktail, name: "elixir")
      params = string_params_for(:cocktail, name: "elixir", source_id: 5, source: nil)

      response =
        conn
        |> put(Routes.cocktail_path(conn, :update, cocktail), %{"cocktail" => params})
        |> html_response(200)

      assert response =~ "does not exist"
    end
  end
end
