defmodule ElixirConcurrentCmdSandbox.Subject do
  def exiftool(:eager) do
    test_files()
    |> Enum.map(&call_exiftool/1)
  end

  def exiftool(:flow) do
    test_files()
    |> Flow.from_enumerable(max_demand: 1)
    |> Flow.map(&call_exiftool/1)
    |> Enum.to_list
  end

  def identify(:eager) do
    test_files()
    |> Enum.map(&call_identify/1)
  end

  def identify(:flow) do
    test_files()
    |> Flow.from_enumerable(max_demand: 1)
    |> Flow.map(&call_identify/1)
    |> Enum.to_list
  end

  def sleep(:eager) do
    1..10
    |> Enum.map(&call_sleep/1)
  end

  def sleep(:flow) do
    1..10
    |> Flow.from_enumerable(max_demand: 1)
    |> Flow.map(&call_sleep/1)
    |> Enum.to_list
  end

  defp test_files do
    File.ls!("test_data/")
    |> Enum.reject(fn file -> String.starts_with?(file, ".") end)
    |> Enum.map(fn file -> "test_data/#{file}" end)
  end

  defp call_exiftool(path) do
    {info, 0} = System.cmd("exiftool", [path])
    info |> String.split("\n") |> List.first
  end

  defp call_identify(path) do
    {info, 0} = System.cmd("identify", ["-verbose", path])
    info |> String.split("\n") |> List.first
  end

  defp call_sleep(_arg) do
    {_, 0} = System.cmd("sleep", ["1"])
    :ok
  end
end
