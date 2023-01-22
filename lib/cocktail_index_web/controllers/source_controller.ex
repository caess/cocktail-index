defmodule CocktailIndexWeb.SourceController do
  use CocktailIndexWeb, :controller

  alias CocktailIndex.Cocktails

  def index(conn, _params) do
    sources = Cocktails.all_sources()

    render(conn, "index.html", sources: sources)
  end

  def new(conn, _params) do
    changeset = Cocktails.new_source()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"source" => source_params}) do
    case Cocktails.create_source(source_params) do
      {:ok, _glass} ->
        redirect(conn, to: Routes.source_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    source = Cocktails.get_source!(id)
    changeset = Cocktails.edit_source(source)

    render(conn, "edit.html", changeset: changeset, source: source)
  end

  def update(conn, %{"source" => source_params, "id" => id}) do
    source = Cocktails.get_source!(id)

    case Cocktails.update_source(source, source_params) do
      {:ok, _glass} ->
        redirect(conn, to: Routes.source_path(conn, :index))

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, source: source)
    end
  end

  def delete(conn, %{"id" => id}) do
    cocktail = Cocktails.get_source!(id)
    {:ok, _source} = Cocktails.delete_source(cocktail)

    redirect(conn, to: Routes.source_path(conn, :index))
  end
end
