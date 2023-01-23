defmodule CocktailIndex.Cocktails.SourceTest do
  use CocktailIndex.DataCase, async: true

  alias CocktailIndex.Cocktails.Source

  describe "changeset/2" do
    test "validates that a name is provided" do
      changeset = Source.changeset(%Source{}, %{})

      assert "can't be blank" in errors_on(changeset).name
    end

    test "validates that name is unique" do
      insert(:source, name: "elixir")
      params = params_for(:source, name: "elixir")

      {:error, changeset} =
        %Source{}
        |> Source.changeset(params)
        |> Repo.insert()

      assert "has already been taken" in errors_on(changeset).name
    end
  end

  describe "delete_changeset/1" do
    test "validates that record is not in use" do
      source = insert(:source)
      insert(:cocktail, source: source)

      {:error, changeset} =
        source
        |> Source.delete_changeset()
        |> Repo.delete()

      assert "are still associated with this source" in errors_on(changeset).cocktails
    end
  end
end
