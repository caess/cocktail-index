defmodule CocktailIndexWeb.Cocktails.CreateCocktailTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user creates a new cocktail successfully", %{session: session} do
    glass = insert(:glass)
    source = insert(:source)

    session
    |> visit(index_page())
    |> click(new_cocktail_link())
    |> create_cocktail(
      name: "sample cocktail",
      glass: glass,
      source: source,
      source_detail: "sample detail"
    )
    |> assert_has(cocktail_name("sample cocktail"))
    |> assert_has(glass_name(glass.name))
    |> assert_has(source_name(source.name))
    |> assert_has(cocktail_source_detail("sample detail"))
  end

  defp new_cocktail_link(), do: Query.link("New cocktail")

  defp create_cocktail(session,
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
    |> click(Query.button("Add cocktail"))
  end

  defp cocktail_name(name), do: Query.data("role", "cocktail-name", text: name)
  defp glass_name(name), do: Query.data("role", "glass-name", text: name)
  defp source_name(name), do: Query.data("role", "source-name", text: name)
  defp cocktail_source_detail(detail), do: Query.data("role", "source-detail", text: detail)
end
