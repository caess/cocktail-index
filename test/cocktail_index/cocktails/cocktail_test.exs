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

    test "validates that a glass ID is provided" do
      changeset = Cocktail.changeset(%Cocktail{}, %{})

      assert "can't be blank" in errors_on(changeset).glass_id
    end

    test "validates that the glass ID matches an existing glass" do
      params = params_for(:cocktail, name: "elixir", glass_id: 5, glass: nil)

      {:error, changeset} =
        %Cocktail{}
        |> Cocktail.changeset(params)
        |> Repo.insert()

      assert "does not exist" in errors_on(changeset).glass
    end

    test "validates that a source ID is provided" do
      changeset = Cocktail.changeset(%Cocktail{}, %{})

      assert "can't be blank" in errors_on(changeset).source_id
    end

    test "validates that the source ID matches an existing source" do
      params = params_for(:cocktail, name: "elixir", source_id: 5, source: nil)

      {:error, changeset} =
        %Cocktail{}
        |> Cocktail.changeset(params)
        |> Repo.insert()

      assert "does not exist" in errors_on(changeset).source
    end
  end
end
