defmodule CocktailIndexWeb.Glasses.ListGlassesTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user visits glasses page to see a list of glasses", %{session: session} do
    [glass1, glass2] = insert_pair(:glass)

    session
    |> visit(index_page())
    |> click(manage_glasses_link())
    |> assert_has(glass_name(glass1.name))
    |> assert_has(glass_name(glass2.name))
  end

  defp glass_name(name), do: Query.data("role", "glass-name", text: name)
end
