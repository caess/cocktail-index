defmodule CocktailIndex.Repo.Migrations.AddSourceToCocktails do
  use Ecto.Migration

  def change do
    alter table("cocktails") do
      add :source_id, references(:sources, on_delete: :restrict)
      add :source_detail, :string, default: ""
    end
  end
end
