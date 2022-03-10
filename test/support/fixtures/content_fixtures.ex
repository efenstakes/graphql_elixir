defmodule Grp.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Grp.Content` context.
  """

  @doc """
  Generate a posts.
  """
  def posts_fixture(attrs \\ %{}) do
    {:ok, posts} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Grp.Content.create_posts()

    posts
  end
end
