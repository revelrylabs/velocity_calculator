# Velocity

Calculates velocity of a sprint

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `velocity` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:velocity, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/velocity](https://hexdocs.pm/velocity).

## Configuration

```elixir
config :velocity, :github_api_key, "<my_github_api_key>"
```

Make sure the api key has enough permissions to look at repo data

## Usage

```elixir
owner = "revelrylabs"
repo = "velocity"
milestone_number = 1
{:ok, start_time, _} = DateTime.from_iso8601("2018-03-19T00:00:00Z")
sprint_length_in_days = 6 # optional. defaults to 6

{:ok, data} = Velocity.calculate_sprint_velocity(owner, repo, milestone_number, start_time, sprint_length_in_days)
```
