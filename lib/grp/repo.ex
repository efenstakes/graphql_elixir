defmodule Grp.Repo do
  use Ecto.Repo,
    otp_app: :grp,
    adapter: Ecto.Adapters.MyXQL
end
