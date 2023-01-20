defmodule CocktailIndexWeb.PageController do
  use CocktailIndexWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:moved_permanently)
    |> redirect(to: Routes.cocktail_path(conn, :index))
  end
end
