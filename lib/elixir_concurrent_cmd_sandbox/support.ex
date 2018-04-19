defmodule ElixirConcurrentCmdSandbox.Support do
  defmacro test(units \\ :milliseconds, do: yield) do
    quote do
      start = Time.utc_now
      result = unquote(yield)
      finish = Time.utc_now
      time_passed = Time.diff(finish, start, unquote(units))
      IO.puts("Finished in #{time_passed} #{unquote(units)}")
      result
    end
  end
end
