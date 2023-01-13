defmodule CocktailIndex.Cocktails do
  alias __MODULE__, as: Cocktails
  alias CocktailIndex.Repo

  def all_cocktails do
    Cocktails.Cocktail |> Repo.all()
  end
end
