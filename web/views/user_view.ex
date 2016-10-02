defmodule PhoenixSample.UserView do
  use PhoenixSample.Web, :view
  alias PhoenixSample.{User, Gravatar}

  def get_gravatar_url(%User{email: email}) do
    Gravatar.get_gravatar_url(email)
  end
end
