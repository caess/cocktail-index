defmodule CocktailIndexWeb.Cocktails.ShowCocktailTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user views a cocktail", %{session: session} do
    glass = insert(:glass)
    cocktail = insert(:cocktail, glass: glass)

    session
    |> visit(index_page())
    |> click_cocktail_show_link(cocktail)
    |> assert_has(cocktail_name(cocktail.name))
    |> assert_has(glass_name(glass.name))
  end

  defp click_cocktail_show_link(session, cocktail) do
    session
    |> find(Query.data("cocktail-id", cocktail.id))
    |> find(Query.link(cocktail.name))
    |> Element.click()

    session
  end

  defp cocktail_name(name), do: Query.data("role", "cocktail-name", text: name)
  defp glass_name(name), do: Query.data("role", "glass-name", text: name)
end
