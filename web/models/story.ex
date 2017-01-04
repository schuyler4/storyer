defmodule Storyer.Story do
  use Storyer.Web, :model

  schema "storys" do
    field :title, :string
    field :content, :string
    field :rating, :integer, default: 0
    field :active, :boolean, default: true

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :content])
    |> validate_required([:title, :content])
  end
end
