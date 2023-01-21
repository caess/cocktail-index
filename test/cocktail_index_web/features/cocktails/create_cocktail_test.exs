defmodule CocktailIndexWeb.Cocktails.CreateCocktailTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user creates a new cocktail successfully", %{session: session} do
    session
    |> visit(index_page())
    |> click(new_cocktail_link())
    |> create_cocktail(name: "sample cocktail")
    |> assert_has(cocktail_name("sample cocktail"))
  end

  defp new_cocktail_link(), do: Query.link("New cocktail")

  defp create_cocktail(session, name: name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Add cocktail"))
  end

  defp cocktail_name(name), do: Query.data("role", "cocktail-name", text: name)
end
