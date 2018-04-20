# ElixirConcurrentCmdSandbox

```shell
$ cd /path/to/elixir_concurrent_cmd_sandbox
$ mix deps.get
$ iex -S mix
Erlang/OTP 20 [erts-9.2.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.6.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 
```

```elixir
iex(1)> import ElixirConcurrentCmdSandbox.{Support, Subject}
[ElixirConcurrentCmdSandbox.Support, ElixirConcurrentCmdSandbox.Subject]
iex(2)> test do identify(:eager) end
Finished in 30945 milliseconds
...
iex(3)> test do identify(:flow) end
Finished in 13256 milliseconds
...
```
