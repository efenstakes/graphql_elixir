defmodule GrpWeb.PostsControllerTest do
  use GrpWeb.ConnCase

  import Grp.ContentFixtures

  alias Grp.Content.Posts

  @create_attrs %{
    body: "some body",
    title: "some title"
  }
  @update_attrs %{
    body: "some updated body",
    title: "some updated title"
  }
  @invalid_attrs %{body: nil, title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get(conn, Routes.posts_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create posts" do
    test "renders posts when data is valid", %{conn: conn} do
      conn = post(conn, Routes.posts_path(conn, :create), posts: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.posts_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "body" => "some body",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.posts_path(conn, :create), posts: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update posts" do
    setup [:create_posts]

    test "renders posts when data is valid", %{conn: conn, posts: %Posts{id: id} = posts} do
      conn = put(conn, Routes.posts_path(conn, :update, posts), posts: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.posts_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "body" => "some updated body",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, posts: posts} do
      conn = put(conn, Routes.posts_path(conn, :update, posts), posts: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete posts" do
    setup [:create_posts]

    test "deletes chosen posts", %{conn: conn, posts: posts} do
      conn = delete(conn, Routes.posts_path(conn, :delete, posts))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.posts_path(conn, :show, posts))
      end
    end
  end

  defp create_posts(_) do
    posts = posts_fixture()
    %{posts: posts}
  end
end
