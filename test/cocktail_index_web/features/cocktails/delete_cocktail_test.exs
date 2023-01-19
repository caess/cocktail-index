defmodule CocktailIndexWeb.Cocktails.DeleteCocktailTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user deletes a cocktail successfully", %{session: session} do
    [cocktail1, cocktail2] = insert_pair(:cocktail)

    session
    |> visit(cocktails_index())
    |> delete_cocktail(cocktail1)
    |> refute_has(cocktail_name(cocktail1.name))
    |> assert_has(cocktail_name(cocktail2.name))
  end

  defp cocktails_index(), do: Routes.cocktail_path(@endpoint, :index)

  defp delete_cocktail(session, cocktail) do
    accept_confirm(session, fn s ->
      s
      |> find(Query.data("cocktail-id", cocktail.id))
      |> find(Query.link("Delete"))
      |> Element.click()
    end)

    session
  end

  defp cocktail_name(name), do: Query.data("role", "cocktail-name", text: name)
end
