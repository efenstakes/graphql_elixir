defmodule GrpWeb.Posts.Resolvers do

  def list_posts(_parent, _args, _resolution) do
    {:ok, Grp.Content.list_posts()}
  end

  def add_post(_parent, %{ title: title, body: body }, _resolution) do
    Grp.Content.create_post(%{ title: title, body: body })
  end

end
