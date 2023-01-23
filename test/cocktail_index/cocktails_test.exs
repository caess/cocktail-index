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

  describe "all_glasses/0" do
    test "return all glasses available" do
      [glass1, glass2] = insert_pair(:glass)

      glasses = Cocktails.all_glasses()

      assert glass1 in glasses
      assert glass2 in glasses
    end
  end

  describe "new_glass/0" do
    test "prepare a changeset for a new glass" do
      assert %Ecto.Changeset{} = Cocktails.new_glass()
    end
  end

  describe "create_glass/1" do
    test "creates a glass with valid params" do
      params = string_params_for(:glass)

      {:ok, glass} = Cocktails.create_glass(params)

      assert %Cocktails.Glass{} = glass
      assert glass.name == params["name"]
    end
  end

  describe "get_glass/1" do
    test "retrieves a glass by id" do
      glass = insert(:glass)

      found_glass = Cocktails.get_glass(glass.id)

      assert glass == found_glass
    end
  end

  describe "get_glass!/1" do
    test "retrieves a glass by id" do
      glass = insert(:glass)

      found_glass = Cocktails.get_glass!(glass.id)

      assert glass == found_glass
    end
  end

  describe "edit_glass/1" do
    test "prepare a changeset to edit a glass" do
      glass = insert(:glass)

      assert %Ecto.Changeset{} = Cocktails.edit_glass(glass)
    end
  end

  describe "update_glass/2" do
    test "updates a glass with valid params" do
      glass = insert(:glass)
      params = string_params_for(:glass)

      {:ok, glass} = Cocktails.update_glass(glass, params)

      assert %Cocktails.Glass{} = glass
      assert glass.name == params["name"]
    end

    test "returns an error tuple if params are invalid" do
      insert(:glass, name: "elixir")
      glass = insert(:glass)
      params = string_params_for(:glass, name: "elixir")

      {:error, changeset} = Cocktails.update_glass(glass, params)

      refute changeset.valid?
      assert "has already been taken" in errors_on(changeset).name
    end
  end

  describe "delete_glass/1" do
    test "deletes a glass" do
      glass = insert(:glass)

      {:ok, _} = Cocktails.delete_glass(glass)

      refute Cocktails.get_glass(glass.id)
    end
  end

  describe "glass_form_options/0" do
    test "return options for all glasses available" do
      [glass1, glass2] = insert_pair(:glass)

      glasses = Cocktails.glass_form_options()

      assert glasses == [{glass1.name, glass1.id}, {glass2.name, glass2.id}]
    end
  end

  describe "all_sources/0" do
    test "return all sources available" do
      [source1, source2] = insert_pair(:source)

      sources = Cocktails.all_sources()

      assert source1 in sources
      assert source2 in sources
    end
  end

  describe "new_source/0" do
    test "prepare a changeset for a new source" do
      assert %Ecto.Changeset{} = Cocktails.new_source()
    end
  end

  describe "create_source/1" do
    test "creates a source with valid params" do
      params = string_params_for(:source)

      {:ok, source} = Cocktails.create_source(params)

      assert %Cocktails.Source{} = source
      assert source.name == params["name"]
    end
  end

  describe "get_source/1" do
    test "retrieves a source by id" do
      source = insert(:source)

      found_source = Cocktails.get_source(source.id)

      assert source == found_source
    end
  end

  describe "get_source!/1" do
    test "retrieves a source by id" do
      source = insert(:source)

      found_source = Cocktails.get_source!(source.id)

      assert source == found_source
    end
  end

  describe "edit_source/1" do
    test "prepare a changeset to edit a source" do
      source = insert(:source)

      assert %Ecto.Changeset{} = Cocktails.edit_source(source)
    end
  end

  describe "update_source/2" do
    test "updates a source with valid params" do
      source = insert(:source)
      params = string_params_for(:source)

      {:ok, source} = Cocktails.update_source(source, params)

      assert %Cocktails.Source{} = source
      assert source.name == params["name"]
    end

    test "returns an error tuple if params are invalid" do
      insert(:source, name: "elixir")
      source = insert(:source)
      params = string_params_for(:source, name: "elixir")

      {:error, changeset} = Cocktails.update_source(source, params)

      refute changeset.valid?
      assert "has already been taken" in errors_on(changeset).name
    end
  end

  describe "delete_source/1" do
    test "deletes a source" do
      source = insert(:source)

      {:ok, _} = Cocktails.delete_source(source)

      refute Cocktails.get_source(source.id)
    end
  end

  describe "source_form_options/0" do
    test "return options for all sources available" do
      [source1, source2] = insert_pair(:source)

      sources = Cocktails.source_form_options()

      assert sources == [{source1.name, source1.id}, {source2.name, source2.id}]
    end
  end
end
