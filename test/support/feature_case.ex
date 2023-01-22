defmodule CocktailIndexWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.Feature

      import CocktailIndex.Factory

      alias CocktailIndexWeb.Router.Helpers, as: Routes

      @endpoint CocktailIndexWeb.Endpoint

      defp index_page(), do: Routes.page_path(@endpoint, :index)

      defp manage_glasses_link(), do: Wallaby.Query.link("Manage glasses")
      defp manage_sources_link(), do: Wallaby.Query.link("Manage sources")
    end
  end
end
