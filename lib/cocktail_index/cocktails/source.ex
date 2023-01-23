defmodule CocktailIndex.Cocktails.Source do
  use Ecto.Schema

  import Ecto.Changeset

  alias CocktailIndex.Cocktails.Cocktail

  schema "sources" do
    field :name, :string

    has_many(:cocktails, Cocktail)

    timestamps()
  end

  @doc false
  def changeset(source, attrs) do
    source
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

  def delete_changeset(source) do
    source
    |> change()
    |> no_assoc_constraint(:cocktails, message: "are still associated with this source")
  end
end
