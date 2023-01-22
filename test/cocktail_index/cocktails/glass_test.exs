defmodule CocktailIndex.Cocktails.GlassTest do
  use CocktailIndex.DataCase, async: true

  alias CocktailIndex.Cocktails.Glass

  describe "changeset/2" do
    test "validates that a name is provided" do
      changeset = Glass.changeset(%Glass{}, %{})

      assert "can't be blank" in errors_on(changeset).name
    end

    test "validates that name is unique" do
      insert(:glass, name: "elixir")
      params = params_for(:glass, name: "elixir")

      {:error, changeset} =
        %Glass{}
        |> Glass.changeset(params)
        |> Repo.insert()

      assert "has already been taken" in errors_on(changeset).name
    end
  end

  describe "delete_changeset/1" do
    test "validates that record is not in use" do
      glass = insert(:glass)
      insert(:cocktail, glass: glass)

      {:error, changeset} =
        glass
        |> Glass.delete_changeset()
        |> Repo.delete()

      assert "are still associated with this glass" in errors_on(changeset).cocktails
    end
  end
end
