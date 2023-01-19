defmodule CocktailIndex.CocktailsTest do
  use CocktailIndex.DataCase, async: true

  alias CocktailIndex.Cocktails

  describe "all_cocktails/0" do
    test "return all cocktails available" do
      [cocktail1, cocktail2] = insert_pair(:cocktail)

      cocktails = Cocktails.all_cocktails()

      assert cocktail1 in cocktails
      assert cocktail2 in cocktails
    end
  end

  describe "new_cocktail/0" do
    test "prepare a changeset for a new cocktail" do
      assert %Ecto.Changeset{} = Cocktails.new_cocktail()
    end
  end

  describe "create_cocktail/1" do
    test "creates a cocktail with valid params" do
      params = string_params_for(:cocktail)

      {:ok, cocktail} = Cocktails.create_cocktail(params)

      assert %Cocktails.Cocktail{} = cocktail
      assert cocktail.name == params["name"]
    end

    test "returns an error tuple if params are invalid" do
      insert(:cocktail, name: "elixir")
      params = string_params_for(:cocktail, name: "elixir")

      {:error, changeset} = Cocktails.create_cocktail(params)

      refute changeset.valid?
      assert "has already been taken" in errors_on(changeset).name
    end
  end

  describe "get_cocktail/1" do
    test "retrieves a cocktail by id" do
      cocktail = insert(:cocktail)

      found_cocktail = Cocktails.get_cocktail(cocktail.id)

      assert cocktail == found_cocktail
    end
  end

  describe "get_cocktail!/1" do
    test "retrieves a cocktail by id" do
      cocktail = insert(:cocktail)

      found_cocktail = Cocktails.get_cocktail!(cocktail.id)

      assert cocktail == found_cocktail
    end
  end

  describe "edit_cocktail/1" do
    test "prepare a changeset to edit a cocktail" do
      cocktail = insert(:cocktail)

      assert %Ecto.Changeset{} = Cocktails.edit_cocktail(cocktail)
    end
  end

  describe "update_cocktail/2" do
    test "updates a cocktail with valid params" do
      cocktail = insert(:cocktail)
      params = string_params_for(:cocktail)

      {:ok, cocktail} = Cocktails.update_cocktail(cocktail, params)

      assert %Cocktails.Cocktail{} = cocktail
      assert cocktail.name == params["name"]
    end

    test "returns an error tuple if params are invalid" do
      insert(:cocktail, name: "elixir")
      cocktail = insert(:cocktail)
      params = string_params_for(:cocktail, name: "elixir")

      {:error, changeset} = Cocktails.update_cocktail(cocktail, params)

      refute changeset.valid?
      assert "has already been taken" in errors_on(changeset).name
    end
  end

  describe "delete_cocktail/1" do
    test "deletes a cocktail" do
      cocktail = insert(:cocktail)

      {:ok, _} = Cocktails.delete_cocktail(cocktail)

      refute Cocktails.get_cocktail(cocktail.id)
    end
  end
end
