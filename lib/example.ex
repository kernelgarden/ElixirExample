defmodule Example do
  @moduledoc """
  Documentation for Example.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Example.hello
      :world

  """
  def hello do
    :world
  end

  def add(a, b) do
    IO.puts(a + b)
  end

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("World")
    end

    listen()
  end

  def explode, do: exit(:kaboom)

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Example, :explode, [])

    receive do
      {:EXIT, from_pid, reason} -> IO.puts("Exit reason: #{reason}")
    end
  end

  def double(x) do
    :timer.sleep(2000)
    x * 2
  end
end
