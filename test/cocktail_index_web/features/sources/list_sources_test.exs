defmodule CocktailIndexWeb.Sources.ListSourcesTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user visits sources page to see a list of sources", %{session: session} do
    [source1, source2] = insert_pair(:source)

    session
    |> visit(index_page())
    |> click(manage_sources_link())
    |> assert_has(source_name(source1.name))
    |> assert_has(source_name(source2.name))
  end

  defp source_name(name), do: Query.data("role", "source-name", text: name)
end
