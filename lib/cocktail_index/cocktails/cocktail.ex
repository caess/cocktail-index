defmodule CocktailIndex.Cocktails.Cocktail do
  use Ecto.Schema

  import Ecto.Changeset

  alias CocktailIndex.Cocktails.{Glass, Source}

  schema "cocktails" do
    field(:name, :string)
    field(:source_detail, :string)

    belongs_to(:glass, Glass)
    belongs_to(:source, Source)

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:name, :glass_id, :source_id, :source_detail])
    |> validate_required([:name, :glass_id, :source_id])
    |> unique_constraint(:name)
    |> assoc_constraint(:glass)
    |> assoc_constraint(:source)
  end
end
