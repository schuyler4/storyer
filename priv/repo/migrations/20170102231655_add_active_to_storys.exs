defmodule Storyer.Repo.Migrations.AddActiveToStorys do
  use Ecto.Migration

  def change do
    alter table(:storys) do
      add :active, :boolean
    end
  end
end
