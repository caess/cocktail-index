defmodule CocktailIndexWeb.Cocktails.UpdateCocktailTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user updates a cocktail successfully", %{session: session} do
    [glass1, glass2] = insert_pair(:glass)
    [source1, source2] = insert_pair(:source)
    cocktail = insert(:cocktail, glass: glass1, source: source1)

    session
    |> visit(index_page())
    |> click_cocktail_edit_link(cocktail)
    |> update_cocktail(
      name: "renamed cocktail",
      glass: glass2,
      source: source2,
      source_detail: "updated detail"
    )
    |> assert_has(cocktail_name("renamed cocktail"))
    |> assert_has(glass_name(glass2.name))
    |> assert_has(source_name(source2.name))
    |> assert_has(cocktail_source_detail("updated detail"))
  end

  defp click_cocktail_edit_link(session, cocktail) do
    session
    |> find(Query.data("cocktail-id", cocktail.id))
    |> find(Query.link("Edit"))
    |> Element.click()

    session
  end

  defp update_cocktail(session,
         name: name,
         glass: glass,
         source: source,
         source_detail: source_detail
       ) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> fill_in(Query.select("Glass"), with: glass.name)
    |> fill_in(Query.select("Source"), with: source.name)
    |> fill_in(Query.text_field("Source Page/Episode"), with: source_detail)
    |> click(Query.button("Update cocktail"))
  end

  defp cocktail_name(name), do: Query.data("role", "cocktail-name", text: name)
  defp glass_name(name), do: Query.data("role", "glass-name", text: name)
  defp source_name(name), do: Query.data("role", "source-name", text: name)
  defp cocktail_source_detail(detail), do: Query.data("role", "source-detail", text: detail)
end
