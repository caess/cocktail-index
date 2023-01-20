defmodule CocktailIndexWeb.PageControllerTest do
  use CocktailIndexWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert redirected_to(conn, :moved_permanently) == Routes.cocktail_path(conn, :index)
  end
end
