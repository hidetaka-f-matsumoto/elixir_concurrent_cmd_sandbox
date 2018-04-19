defmodule ElixirConcurrentCmdSandboxTest do
  use ExUnit.Case
  doctest ElixirConcurrentCmdSandbox

  test "greets the world" do
    assert ElixirConcurrentCmdSandbox.hello() == :world
  end
end
