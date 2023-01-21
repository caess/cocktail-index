defmodule CocktailIndexWeb.Glasses.UpdateGlassTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user updates a glass successfully", %{session: session} do
    glass = insert(:glass)

    session
    |> visit(index_page())
    |> click(manage_glasses_link())
    |> click_glass_edit_link(glass)
    |> update_glass(name: "renamed glass")
    |> assert_has(glass_name("renamed glass"))
  end

  defp click_glass_edit_link(session, glass) do
    session
    |> find(Query.data("glass-id", glass.id))
    |> find(Query.link("Edit"))
    |> Element.click()

    session
  end

  defp update_glass(session, name: name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Update glass"))
  end

  defp glass_name(name), do: Query.data("role", "glass-name", text: name)
end
