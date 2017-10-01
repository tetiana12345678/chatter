defmodule Bot do
  @moduledoc """
  Documentation for Bot.
  """

  @doc """
  Here we would write a documentation for our answer function.
  Also Examples section is a documentation and a test
  all together.

  ## Examples

      iex> Bot.answer(%{"user" => "tanya", "body" => "hello"})
      %{"user" => "bot", "body" => "hello tanya"}

  """
  def answer(%{"user" => user, "body" => "hello" <> _rest}) do
    %{"user" => "bot", "body" => "hello #{user}"}
  end
end
