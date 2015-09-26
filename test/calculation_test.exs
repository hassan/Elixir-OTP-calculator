defmodule CalculationTest do
  use ExUnit.Case, async: true
  # doctest Calculation

  test "it starts" do
    {:ok, pid} = GenServer.start_link(Calculation.Server, %{baseline: 1000, current: 1000})
    {:links, links} = Process.info(self, :links)
    assert pid in links
  end
  test "it adds" do
    {:ok, pid} = GenServer.start_link(Calculation.Server, %{baseline: 1000, current: 1000})
    assert GenServer.call(pid, { :add, 100 }) == %{baseline: 1000, current: 1100}
  end
  test "it subtracts" do
    {:ok, pid} = GenServer.start_link(Calculation.Server, %{baseline: 1000, current: 1000})
    assert GenServer.call(pid, { :subtract, 100 }) == %{baseline: 1000, current: 900}
  end
  test "it multiplies" do
    {:ok, pid} = GenServer.start_link(Calculation.Server, %{baseline: 1000, current: 1000})
    assert GenServer.call(pid, { :multiply, 2 }) == %{baseline: 1000, current: 2000}
  end
  test "it divides" do
    {:ok, pid} = GenServer.start_link(Calculation.Server, %{baseline: 1000, current: 1000})
    assert GenServer.call(pid, { :divide, 2 }) == %{baseline: 1000, current: 500}
  end
  test "it handles multiple calls" do
    {:ok, pid} = GenServer.start_link(Calculation.Server, %{baseline: 1000, current: 1000})
    assert GenServer.call(pid, { :add, 100 })  == %{baseline: 1000, current: 1100}
    assert GenServer.call(pid, { :add, 100 })  == %{baseline: 1000, current: 1200}
    assert GenServer.call(pid, { :divide, 2 }) == %{baseline: 1000, current: 600}
  end

end
