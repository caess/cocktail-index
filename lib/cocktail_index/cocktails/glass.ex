defmodule CocktailIndex.Cocktails.Glass do
  use Ecto.Schema

  import Ecto.Changeset

  alias CocktailIndex.Cocktails.Cocktail

  schema "glasses" do
    field :name, :string

    has_many(:cocktails, Cocktail)

    timestamps()
  end

  @doc false
  def changeset(glass, attrs) do
    glass
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

  @doc false
  def delete_changeset(glass) do
    glass
    |> change()
    |> no_assoc_constraint(:cocktails, message: "are still associated with this glass")
  end
end
