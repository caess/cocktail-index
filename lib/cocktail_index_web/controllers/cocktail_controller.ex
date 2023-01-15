defmodule CocktailIndexWeb.CocktailController do
  use CocktailIndexWeb, :controller

  def index(conn, _params) do
    cocktails = CocktailIndex.Cocktails.all_cocktails()

    render(conn, "index.html", cocktails: cocktails)
  end

  def new(conn, _params) do
    changeset = CocktailIndex.Cocktails.new_cocktail()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cocktail" => cocktail_params}) do
    case CocktailIndex.Cocktails.create_cocktail(cocktail_params) do
      {:ok, cocktail} ->
        redirect(conn, to: Routes.cocktail_path(conn, :show, cocktail))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cocktail = CocktailIndex.Cocktails.find_cocktail(id)

    render(conn, "show.html", cocktail: cocktail)
  end
end
