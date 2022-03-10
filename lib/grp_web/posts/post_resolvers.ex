defmodule GrpWeb.Posts.Resolvers do

  def list_posts(_parent, _args, _resolution) do
    {:ok, Grp.Content.list_posts()}
  end


end
