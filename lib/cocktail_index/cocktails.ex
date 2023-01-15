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

  def find_cocktail(id) do
    Cocktails.Cocktail |> Repo.get!(id)
  end
end
