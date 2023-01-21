defmodule CocktailIndex.Repo.Migrations.AddUniqueIndexToGlassName do
  use Ecto.Migration

  def change do
    create unique_index(:glasses, [:name])
  end
end
