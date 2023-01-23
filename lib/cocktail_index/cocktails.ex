defmodule CocktailIndex.Cocktails do
  alias __MODULE__, as: Cocktails
  alias CocktailIndex.Repo

  def all_cocktails do
    Cocktails.Cocktail |> Repo.all() |> Repo.preload([:glass, :source])
  end

  def new_cocktail do
    %Cocktails.Cocktail{}
    |> Cocktails.Cocktail.changeset(%{})
  end

  def create_cocktail(params) do
    %Cocktails.Cocktail{}
    |> Cocktails.Cocktail.changeset(params)
    |> Repo.insert()
  end

  def get_cocktail(id) do
    Cocktails.Cocktail |> Repo.get(id) |> Repo.preload([:glass, :source])
  end

  def get_cocktail!(id) do
    Cocktails.Cocktail |> Repo.get!(id) |> Repo.preload([:glass, :source])
  end

  def edit_cocktail(%Cocktails.Cocktail{} = cocktail) do
    Cocktails.Cocktail.changeset(cocktail, %{})
  end

  def update_cocktail(%Cocktails.Cocktail{} = cocktail, params) do
    cocktail
    |> Cocktails.Cocktail.changeset(params)
    |> Repo.update()
  end

  def delete_cocktail(%Cocktails.Cocktail{} = cocktail) do
    Repo.delete(cocktail)
  end

  def all_glasses do
    Cocktails.Glass |> Repo.all()
  end

  def new_glass do
    %Cocktails.Glass{}
    |> Cocktails.Glass.changeset(%{})
  end

  def create_glass(params) do
    %Cocktails.Glass{}
    |> Cocktails.Glass.changeset(params)
    |> Repo.insert()
  end

  def get_glass(id) do
    Cocktails.Glass |> Repo.get(id)
  end

  def get_glass!(id) do
    Cocktails.Glass |> Repo.get!(id)
  end

  def edit_glass(%Cocktails.Glass{} = glass) do
    Cocktails.Glass.changeset(glass, %{})
  end

  def update_glass(%Cocktails.Glass{} = glass, params) do
    glass
    |> Cocktails.Glass.changeset(params)
    |> Repo.update()
  end

  def delete_glass(%Cocktails.Glass{} = glass) do
    glass
    |> Cocktails.Glass.delete_changeset()
    |> Repo.delete()
  end

  def glass_form_options do
    Enum.map(all_glasses(), fn x -> {x.name, x.id} end)
  end

  def all_sources do
    Cocktails.Source |> Repo.all()
  end

  def new_source do
    %Cocktails.Source{}
    |> Cocktails.Source.changeset(%{})
  end

  def create_source(params) do
    %Cocktails.Source{}
    |> Cocktails.Source.changeset(params)
    |> Repo.insert()
  end

  def get_source(id) do
    Cocktails.Source |> Repo.get(id)
  end

  def get_source!(id) do
    Cocktails.Source |> Repo.get!(id)
  end

  def edit_source(%Cocktails.Source{} = source) do
    Cocktails.Source.changeset(source, %{})
  end

  def update_source(%Cocktails.Source{} = source, params) do
    source
    |> Cocktails.Source.changeset(params)
    |> Repo.update()
  end

  def delete_source(%Cocktails.Source{} = source) do
    source
    |> Cocktails.Source.delete_changeset()
    |> Repo.delete()
  end

  def source_form_options do
    Enum.map(all_sources(), fn x -> {x.name, x.id} end)
  end
end
