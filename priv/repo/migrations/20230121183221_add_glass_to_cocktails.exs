defmodule CocktailIndex.Repo.Migrations.AddGlassToCocktails do
  use Ecto.Migration

  def change do
    alter table("cocktails") do
      add :glass_id, references(:glasses, on_delete: :restrict)
    end
  end
end
