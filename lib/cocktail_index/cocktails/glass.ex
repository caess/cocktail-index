defmodule CocktailIndex.Cocktails.Glass do
  use Ecto.Schema
  import Ecto.Changeset

  schema "glasses" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(glass, attrs) do
    glass
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
