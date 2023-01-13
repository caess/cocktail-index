defmodule CocktailIndex.CocktailsTest do
  use CocktailIndex.DataCase, async: true

  import CocktailIndex.Factory

  alias CocktailIndex.Cocktails

  describe "all_cocktails/0" do
    test "return all cocktails available" do
      [cocktail1, cocktail2] = insert_pair(:cocktail)

      cocktails = Cocktails.all_cocktails()

      assert cocktail1 in cocktails
      assert cocktail2 in cocktails
    end
  end
end
