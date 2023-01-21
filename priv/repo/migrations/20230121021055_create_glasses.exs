defmodule CocktailIndex.Repo.Migrations.CreateGlasses do
  use Ecto.Migration

  def change do
    create table(:glasses) do
      add :name, :string

      timestamps()
    end
  end
end
