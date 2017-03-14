defmodule Rumbl.Video do
  use Rumbl.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    field :view_count, :integer
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Category

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    cast(model, params, ~w(url title description view_count category_id))
    |> assoc_constraint(:category)
    |> validate_required([:url, :title, :description, :view_count])

  end
end
