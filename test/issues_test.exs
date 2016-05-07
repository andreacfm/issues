defmodule IssuesTest do
  use ExUnit.Case
  import Issues.CLI, only: [ parse_args: 1 ]

  test ":help returned by options parsing with -h and --help" do
    assert parse_args([]) == :help
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "3 values are returned if they are given" do
    assert parse_args(["user", "project", "99"]) == { "user", "project", 99 }
  end

  test "default count if only 2 options are given" do
    assert parse_args(["user", "project"]) == { "user", "project", 4 }
  end

end
