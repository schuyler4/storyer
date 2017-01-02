defmodule Storyer.StoryController do
  use Storyer.Web, :controller
  alias Storyer.Story

  def index(conn, _params) do
    storys = Repo.all(Story)
    render conn, "index.html", storys: storys
  end

  def new(conn, _params) do
    changeset = Story.changeset(%Story{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def show(conn, %{"id" => story_id}) do
    story = Repo.get!(Story, story_id)
    render conn, "show.html", story: story
  end

  def create(conn, %{"story" => story}) do
    changeset = Story.changeset(%Story{}, story)

    case Repo.insert(changeset) do
      {:ok, _story} ->
        conn
        |> put_flash(:info, "Story Saved")
        |> redirect(to: story_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => story_id}) do
    story = Repo.get!(Story, story_id)
    changeset = Story.changeset(story)

    render(conn, "")
  end

  #def rate_up(conn, %{"id" => story_id}) do
  #  old_story = Repo.get(Story, story_id)
  #  changeset = Story.changeset(%Story{})
  #end
end
