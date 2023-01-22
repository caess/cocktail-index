defmodule CocktailIndexWeb.Glasses.UpdateSourceTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user updates a source successfully", %{session: session} do
    source = insert(:source)

    session
    |> visit(index_page())
    |> click(manage_sources_link())
    |> click_source_edit_link(source)
    |> update_source(name: "renamed source")
    |> assert_has(source_name("renamed source"))
  end

  defp click_source_edit_link(session, source) do
    session
    |> find(Query.data("source-id", source.id))
    |> find(Query.link("Edit"))
    |> Element.click()

    session
  end

  defp update_source(session, name: name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Update source"))
  end

  defp source_name(name), do: Query.data("role", "source-name", text: name)
end
