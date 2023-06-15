defmodule FunOTP do
  def hello(name) do
    "Hello, #{name}"
  end
end

IO.puts(FunOTP.hello("Elixir"))
