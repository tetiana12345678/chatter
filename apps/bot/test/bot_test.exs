defmodule BotTest do
  use ExUnit.Case
  doctest Bot

  test "bot says hello to the user" do
    payload = %{"user" => "tanya", "body" => "hello"}
    assert Bot.answer(payload) == "hello tanya"
  end
end
