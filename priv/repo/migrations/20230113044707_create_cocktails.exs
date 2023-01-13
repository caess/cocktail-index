defmodule CocktailIndex.Repo.Migrations.CreateCocktails do
  use Ecto.Migration

  def change do
    create table(:cocktails) do
      add :name, :string

      timestamps()
    end

    create unique_index(:cocktails, [:name])
  end
end
