defmodule Grp.ContentTest do
  use Grp.DataCase

  alias Grp.Content

  describe "posts" do
    alias Grp.Content.Posts

    import Grp.ContentFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_posts/0 returns all posts" do
      posts = posts_fixture()
      assert Content.list_posts() == [posts]
    end

    test "get_posts!/1 returns the posts with given id" do
      posts = posts_fixture()
      assert Content.get_posts!(posts.id) == posts
    end

    test "create_posts/1 with valid data creates a posts" do
      valid_attrs = %{body: "some body", title: "some title"}

      assert {:ok, %Posts{} = posts} = Content.create_posts(valid_attrs)
      assert posts.body == "some body"
      assert posts.title == "some title"
    end

    test "create_posts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_posts(@invalid_attrs)
    end

    test "update_posts/2 with valid data updates the posts" do
      posts = posts_fixture()
      update_attrs = %{body: "some updated body", title: "some updated title"}

      assert {:ok, %Posts{} = posts} = Content.update_posts(posts, update_attrs)
      assert posts.body == "some updated body"
      assert posts.title == "some updated title"
    end

    test "update_posts/2 with invalid data returns error changeset" do
      posts = posts_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_posts(posts, @invalid_attrs)
      assert posts == Content.get_posts!(posts.id)
    end

    test "delete_posts/1 deletes the posts" do
      posts = posts_fixture()
      assert {:ok, %Posts{}} = Content.delete_posts(posts)
      assert_raise Ecto.NoResultsError, fn -> Content.get_posts!(posts.id) end
    end

    test "change_posts/1 returns a posts changeset" do
      posts = posts_fixture()
      assert %Ecto.Changeset{} = Content.change_posts(posts)
    end
  end
end
