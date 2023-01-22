defmodule CocktailIndexWeb.GlassController do
  use CocktailIndexWeb, :controller

  alias CocktailIndex.Cocktails

  def index(conn, _params) do
    glasses = Cocktails.all_glasses()

    render(conn, "index.html", glasses: glasses)
  end

  def new(conn, _params) do
    changeset = Cocktails.new_glass()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"glass" => glass_params}) do
    case Cocktails.create_glass(glass_params) do
      {:ok, _glass} ->
        redirect(conn, to: Routes.glass_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    glass = Cocktails.get_glass!(id)
    changeset = Cocktails.edit_glass(glass)

    render(conn, "edit.html", changeset: changeset, glass: glass)
  end

  def update(conn, %{"glass" => glass_params, "id" => id}) do
    glass = Cocktails.get_glass!(id)

    case Cocktails.update_glass(glass, glass_params) do
      {:ok, _glass} ->
        redirect(conn, to: Routes.glass_path(conn, :index))

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, glass: glass)
    end
  end

  def delete(conn, %{"id" => id}) do
    glass = Cocktails.get_glass!(id)

    case Cocktails.delete_glass(glass) do
      {:ok, _glass} ->
        redirect(conn, to: Routes.glass_path(conn, :index))

      {:error, changeset} ->
        error_message =
          if Keyword.has_key?(changeset.errors, :cocktails) do
            error = elem(changeset.errors[:cocktails], 0)

            "Cocktails #{error}."
          end

        conn
        |> put_flash(:error, error_message)
        |> redirect(to: Routes.glass_path(conn, :index))
    end
  end
end
