defmodule GrpWeb.Posts.Resolvers do

  def list_posts(_parent, _args, _resolution) do
    {:ok, Grp.Content.list_posts()}
  end

  def add_post(_parent, %{ title: title, body: body }, _resolution) do
    Grp.Content.create_post(%{ title: title, body: body })
  end

  def get_post(_parent, %{ id: id }, _resolution) do
    { :ok, Grp.Content.get_post(id) }
  end

end
