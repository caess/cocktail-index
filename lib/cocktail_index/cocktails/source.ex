defmodule CocktailIndex.Cocktails.Source do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sources" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(source, attrs) do
    source
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
