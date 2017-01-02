defmodule Storyer.Repo.Migrations.AddStorys do
  use Ecto.Migration

  def change do
    create table(:storys) do
      add :title, :string
      add :content, :string
      add :rating, :integer

      timestamps()
    end
  end
end
