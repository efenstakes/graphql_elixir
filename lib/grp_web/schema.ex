defmodule GrpWeb.Schema do
  use Absinthe.Schema

  import_types GrpWeb.Posts.Types

  alias GrpWeb.Posts.Resolvers, as: PostResolvers



  query do

    @desc "Get all posts"
    field :all_posts, list_of(:post) do
      resolve &PostResolvers.list_posts/3
    end

  end


end
