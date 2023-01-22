defmodule CocktailIndexWeb.Sources.DeleteSourceTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user deletes a source successfully", %{session: session} do
    [source1, source2] = insert_pair(:source)

    session
    |> visit(index_page())
    |> click(manage_sources_link())
    |> delete_source(source1)
    |> refute_has(source_name(source1.name))
    |> assert_has(source_name(source2.name))
  end

  defp delete_source(session, source) do
    accept_confirm(session, fn s ->
      s
      |> find(Query.data("source-id", source.id))
      |> find(Query.link("Delete"))
      |> Element.click()
    end)

    session
  end

  defp source_name(name), do: Query.data("role", "source-name", text: name)
end
