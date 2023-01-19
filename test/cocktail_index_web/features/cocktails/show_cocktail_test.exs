defmodule CocktailIndexWeb.Cocktails.ShowCocktailTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user views a cocktail", %{session: session} do
    cocktail = insert(:cocktail)

    session
    |> visit(cocktails_index())
    |> click_cocktail_show_link(cocktail)
    |> assert_has(cocktail_name(cocktail.name))
  end

  defp cocktails_index(), do: Routes.cocktail_path(@endpoint, :index)

  defp click_cocktail_show_link(session, cocktail) do
    session
    |> find(Query.data("cocktail-id", cocktail.id))
    |> find(Query.link(cocktail.name))
    |> Element.click()

    session
  end

  defp cocktail_name(name), do: Query.data("role", "cocktail-name", text: name)
end
