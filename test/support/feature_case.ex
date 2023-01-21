defmodule CocktailIndexWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.Feature

      import CocktailIndex.Factory

      alias CocktailIndexWeb.Router.Helpers, as: Routes

      @endpoint CocktailIndexWeb.Endpoint

      defp index_page(), do: Routes.page_path(@endpoint, :index)
    end
  end
end
