defmodule Fun.Handler do
  def handle(request) do
    request
      |>parse()
      |>route()
      |>format_response()

  end

  def parse(request) do
    [method, path, _] = request
      |>String.split("\n")
      |>List.first()
      |>String.split(" ")
    %{method: method, path: path, response: ""}
  end

  def route(request) do
    conv = %{method: "GET", path: "/wildthings", response: "Bears, Lions, Tigers"}
  end

  def format_response(request) do
    """
    HTTP/1.1 200 OK
    Content-Type: text/html
    Content-Length: 20

    Bears, Lions, Tigers
    """
  end

end

request = """
GET /wildthings HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Fun.Handler.handle(request)
IO.puts(response)
