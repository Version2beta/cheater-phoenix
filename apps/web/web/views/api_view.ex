defmodule Cheater.Web.APIView do
  use Cheater.Web.Web, :view

  def render("index.json", %{suggestions: suggestions}) do
    suggestions
  end
end
