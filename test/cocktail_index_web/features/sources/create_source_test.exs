defmodule CocktailIndexWeb.Sources.CreateSourceTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user creates a new source successfully", %{session: session} do
    session
    |> visit(index_page())
    |> click(manage_sources_link())
    |> click(new_source_link())
    |> create_source(name: "sample source")
    |> assert_has(source_name("sample source"))
  end

  defp new_source_link(), do: Query.link("New source")

  defp create_source(session, name: name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Add source"))
  end

  defp source_name(name), do: Query.data("role", "source-name", text: name)
end
