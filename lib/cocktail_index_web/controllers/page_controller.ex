defmodule CocktailIndexWeb.PageController do
  use CocktailIndexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
