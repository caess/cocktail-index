defmodule CocktailIndexWeb.Glasses.DeleteGlassTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user deletes a glass successfully", %{session: session} do
    [glass1, glass2] = insert_pair(:glass)

    session
    |> visit(index_page())
    |> click(manage_glasses_link())
    |> delete_glass(glass1)
    |> refute_has(glass_name(glass1.name))
    |> assert_has(glass_name(glass2.name))
  end

  defp delete_glass(session, glass) do
    accept_confirm(session, fn s ->
      s
      |> find(Query.data("glass-id", glass.id))
      |> find(Query.link("Delete"))
      |> Element.click()
    end)

    session
  end

  defp glass_name(name), do: Query.data("role", "glass-name", text: name)
end
