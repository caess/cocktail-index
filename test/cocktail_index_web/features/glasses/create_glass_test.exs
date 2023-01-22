defmodule CocktailIndexWeb.Glasses.CreateGlassTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user creates a new glass successfully", %{session: session} do
    session
    |> visit(index_page())
    |> click(manage_glasses_link())
    |> click(new_glass_link())
    |> create_glass(name: "sample glass")
    |> assert_has(glass_name("sample glass"))
  end

  defp new_glass_link(), do: Query.link("New glass")

  defp create_glass(session, name: name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Add glass"))
  end

  defp glass_name(name), do: Query.data("role", "glass-name", text: name)
end
