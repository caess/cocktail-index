defmodule CocktailIndex.Cocktails.CocktailTest do
  use CocktailIndex.DataCase, async: true

  alias CocktailIndex.Cocktails.Cocktail

  describe "changeset/2" do
    test "validates that a name is provided" do
      changeset = Cocktail.changeset(%Cocktail{}, %{})

      assert "can't be blank" in errors_on(changeset).name
    end

    test "validates that name is unique" do
      insert(:cocktail, name: "elixir")
      params = params_for(:cocktail, name: "elixir")

      {:error, changeset} =
        %Cocktail{}
        |> Cocktail.changeset(params)
        |> Repo.insert()

      assert "has already been taken" in errors_on(changeset).name
    end
  end
end
