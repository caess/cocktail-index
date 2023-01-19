defmodule CocktailIndexWeb.Cocktails.UpdateCocktailTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user updates a cocktail successfully", %{session: session} do
    cocktail = insert(:cocktail)

    session
    |> visit(cocktails_index())
    |> click_cocktail_edit_link(cocktail)
    |> update_cocktail(name: "renamed cocktail")
    |> assert_has(cocktail_name("renamed cocktail"))
  end

  defp cocktails_index(), do: Routes.cocktail_path(@endpoint, :index)

  defp click_cocktail_edit_link(session, cocktail) do
    session
    |> find(Query.data("cocktail-id", cocktail.id))
    |> find(Query.link("Edit"))
    |> Element.click()

    session
  end

  defp update_cocktail(session, name: name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Update cocktail"))
  end

  defp cocktail_name(name), do: Query.data("role", "cocktail-name", text: name)
end
