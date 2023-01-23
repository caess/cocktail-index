defmodule CocktailIndex.Factory do
  use ExMachina.Ecto, repo: CocktailIndex.Repo

  def cocktail_factory do
    %CocktailIndex.Cocktails.Cocktail{
      name: sequence(:name, &"cocktail #{&1}"),
      glass: insert(:glass),
      source: insert(:source),
      source_detail: ""
    }
  end

  def glass_factory do
    %CocktailIndex.Cocktails.Glass{
      name: sequence(:name, &"glass #{&1}")
    }
  end

  def source_factory do
    %CocktailIndex.Cocktails.Source{
      name: sequence(:name, &"source #{&1}")
    }
  end
end
