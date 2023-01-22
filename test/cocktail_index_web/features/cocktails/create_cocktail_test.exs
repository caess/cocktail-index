defmodule CocktailIndexWeb.Cocktails.CreateCocktailTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user creates a new cocktail successfully", %{session: session} do
    glass = insert(:glass)

    session
    |> visit(index_page())
    |> click(new_cocktail_link())
    |> create_cocktail(name: "sample cocktail", glass: glass)
    |> assert_has(cocktail_name("sample cocktail"))
    |> assert_has(glass_name(glass.name))
  end

  defp new_cocktail_link(), do: Query.link("New cocktail")

  defp create_cocktail(session, name: name, glass: glass) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> fill_in(Query.select("Glass"), with: glass.name)
    |> click(Query.button("Add cocktail"))
  end

  defp cocktail_name(name), do: Query.data("role", "cocktail-name", text: name)
  defp glass_name(name), do: Query.data("role", "glass-name", text: name)
end
