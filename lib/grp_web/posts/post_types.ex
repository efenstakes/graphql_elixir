defmodule GrpWeb.Posts.Types do
  use Absinthe.Schema.Notation


  alias GrpWeb.Posts.Types


  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
  end

end
