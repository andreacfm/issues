defmodule Issues.CLI do
  @moduledoc """
    Handle CLI parsing
  """

  @default_count 4

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv,
      switches: [help: :boolean],
      aliases: [h: :help]
    )

    case parse do
      {[ help: true ], _, _}
        -> :help
      {_, [user, project, count], _}
        -> { user, project, String.to_integer(count) }
      {_, [user, project], _}
        -> { user, project, @default_count }
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
      usage: issues <user> <project> [count | #{@default_count}]
    """
    System.halt(0)
  end

end