defmodule CocktailIndexWeb.CocktailController do
  use CocktailIndexWeb, :controller

  def index(conn, _params) do
    cocktails = CocktailIndex.Cocktails.all_cocktails()

    render(conn, "index.html", cocktails: cocktails)
  end
end
