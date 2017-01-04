defmodule Storyer.StoryController do
  use Storyer.Web, :controller
  alias Storyer.Story

  def index(conn, _params) do
    query = from s in Story,
      where: s.active == true,
      select: s

    storys = Repo.all(query)
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
    IO.puts "panda"
    IO.inspect changeset
    IO.puts "panda"

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

    render(conn, "edit.html", story: story, changeset: changeset)
  end

  def update(conn, %{"id" => story_id, "story" => story}) do
    old_story = Repo.get!(Story, story_id)
    changeset = Story.changeset(old_story, story)

    case Repo.update(changeset) do
      {:ok, _story} ->
        conn
        |> put_flash(:info, "Story Saved")
        |> redirect(to: story_path(conn, :show, story_id))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset
    end
  end

  def set_inactive(conn, %{"id" => story_id}) do
    story = Repo.get!(Story, story_id)

    changeset = Story.changeset(story)
    |> put_change(:active, false)

    Repo.update(changeset)
    conn
    |> put_flash(:info, "Story Deleted")
    |> redirect(to: story_path(conn, :index))
  end
end
