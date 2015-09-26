defmodule CalculationTest do
  use ExUnit.Case, async: true

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

  test "it resets to the baseline value" do
    {:ok, pid} = GenServer.start_link(Calculation.Server, %{baseline: 1000, current: 1000})
    assert GenServer.call(pid, { :add, 100 })  == %{baseline: 1000, current: 1100}
    assert GenServer.call(pid, {:reset}) == %{baseline: 1000, current: 1000}
  end

  test "it resets to a new baseline value" do
    {:ok, pid} = GenServer.start_link(Calculation.Server, %{baseline: 1000, current: 1000})
    assert GenServer.call(pid, { :add, 100 })  == %{baseline: 1000, current: 1100}
    assert GenServer.call(pid, {:reset, 2000}) == %{baseline: 2000, current: 2000}
  end

end
