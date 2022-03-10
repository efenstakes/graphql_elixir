defmodule GrpWeb.Schema do
  use Absinthe.Schema

  import_types GrpWeb.Posts.Types

  alias GrpWeb.Posts.Resolvers, as: PostResolvers



  query do

    @desc "Get all posts"
    field :all_posts, list_of(:post) do
      resolve &PostResolvers.list_posts/3
    end

    @desc "Get posts details"
    field :get_post_details, :post do
      arg( :id, non_null(:id) )

      resolve &PostResolvers.get_post/3
    end

  end


  mutation do

    @desc "Add a post"
    field :add_post, :post do
      arg( :title, non_null(:string) )
      arg( :body, non_null(:string) )

      resolve( &PostResolvers.add_post/3 )
    end

  end

end
