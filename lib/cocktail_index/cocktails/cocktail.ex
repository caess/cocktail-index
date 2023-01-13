defmodule CocktailIndex.Cocktails.Cocktail do
  use Ecto.Schema

  schema "cocktails" do
    field(:name, :string)

    timestamps()
  end
end
