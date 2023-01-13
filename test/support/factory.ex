defmodule CocktailIndex.Factory do
  use ExMachina.Ecto, repo: CocktailIndex.Repo

  def cocktail_factory do
    %CocktailIndex.Cocktails.Cocktail{
      name: sequence(:name, &"cocktail #{&1}")
    }
  end
end
