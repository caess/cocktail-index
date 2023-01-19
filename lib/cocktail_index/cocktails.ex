defmodule CocktailIndex.Cocktails do
  alias __MODULE__, as: Cocktails
  alias CocktailIndex.Repo

  def all_cocktails do
    Cocktails.Cocktail |> Repo.all()
  end

  def new_cocktail do
    %Cocktails.Cocktail{}
    |> Cocktails.Cocktail.changeset(%{})
  end

  def create_cocktail(params) do
    %Cocktails.Cocktail{}
    |> Cocktails.Cocktail.changeset(params)
    |> Repo.insert()
  end

  def get_cocktail(id) do
    Cocktails.Cocktail |> Repo.get(id)
  end

  def get_cocktail!(id) do
    Cocktails.Cocktail |> Repo.get!(id)
  end

  def edit_cocktail(%Cocktails.Cocktail{} = cocktail) do
    Cocktails.Cocktail.changeset(cocktail, %{})
  end

  def update_cocktail(%Cocktails.Cocktail{} = cocktail, params) do
    cocktail
    |> Cocktails.Cocktail.changeset(params)
    |> Repo.update()
  end

  def delete_cocktail(%Cocktails.Cocktail{} = cocktail) do
    Repo.delete(cocktail)
  end
end
