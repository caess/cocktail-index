defmodule CocktailIndexWeb.CocktailController do
  use CocktailIndexWeb, :controller

  alias CocktailIndex.Cocktails

  def index(conn, _params) do
    cocktails = Cocktails.all_cocktails()

    render(conn, "index.html", cocktails: cocktails)
  end

  def new(conn, _params) do
    changeset = Cocktails.new_cocktail()
    glasses = Cocktails.glass_form_options()
    sources = Cocktails.source_form_options()

    render(conn, "new.html", changeset: changeset, glasses: glasses, sources: sources)
  end

  def create(conn, %{"cocktail" => cocktail_params}) do
    case Cocktails.create_cocktail(cocktail_params) do
      {:ok, cocktail} ->
        redirect(conn, to: Routes.cocktail_path(conn, :show, cocktail))

      {:error, changeset} ->
        glasses = Cocktails.glass_form_options()
        sources = Cocktails.source_form_options()
        render(conn, "new.html", changeset: changeset, glasses: glasses, sources: sources)
    end
  end

  def show(conn, %{"id" => id}) do
    cocktail = Cocktails.get_cocktail!(id)

    render(conn, "show.html", cocktail: cocktail)
  end

  def edit(conn, %{"id" => id}) do
    cocktail = Cocktails.get_cocktail!(id)
    changeset = Cocktails.edit_cocktail(cocktail)
    glasses = Cocktails.glass_form_options()
    sources = Cocktails.source_form_options()

    render(conn, "edit.html",
      changeset: changeset,
      cocktail: cocktail,
      glasses: glasses,
      sources: sources
    )
  end

  def update(conn, %{"cocktail" => cocktail_params, "id" => id}) do
    cocktail = Cocktails.get_cocktail!(id)

    case Cocktails.update_cocktail(cocktail, cocktail_params) do
      {:ok, cocktail} ->
        redirect(conn, to: Routes.cocktail_path(conn, :show, cocktail))

      {:error, changeset} ->
        glasses = Cocktails.glass_form_options()
        sources = Cocktails.source_form_options()

        render(conn, "edit.html",
          changeset: changeset,
          cocktail: cocktail,
          glasses: glasses,
          sources: sources
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    cocktail = Cocktails.get_cocktail!(id)
    {:ok, _cocktail} = Cocktails.delete_cocktail(cocktail)

    redirect(conn, to: Routes.cocktail_path(conn, :index))
  end
end
