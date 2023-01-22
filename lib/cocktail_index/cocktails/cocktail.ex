defmodule CocktailIndex.Cocktails.Cocktail do
  use Ecto.Schema

  import Ecto.Changeset

  alias CocktailIndex.Cocktails.Glass

  schema "cocktails" do
    field(:name, :string)

    belongs_to(:glass, Glass)

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:name, :glass_id])
    |> validate_required([:name, :glass_id])
    |> unique_constraint(:name)
    |> assoc_constraint(:glass)
  end
end
