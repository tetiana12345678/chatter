defmodule BotTest do
  use ExUnit.Case
  doctest Bot

  test "bot says hello to the user" do
    payload = %{"user" => "tanya", "body" => "hello"}
    expected_payload = %{"user" => "bot", "body" => "hello tanya"}
    assert Bot.answer(payload) == expected_payload
  end
end
