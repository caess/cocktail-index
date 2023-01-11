defmodule CocktailIndex.Repo do
  use Ecto.Repo,
    otp_app: :cocktail_index,
    adapter: Ecto.Adapters.MyXQL
end
