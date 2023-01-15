defmodule CocktailIndex.Cocktails.Cocktail do
  use Ecto.Schema

  import Ecto.Changeset

  schema "cocktails" do
    field(:name, :string)

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
