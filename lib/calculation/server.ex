defmodule Calculation.Server do
  use GenServer

  def handle_call({:reset, value}, _pid, current_value) do
    { :reply, value, value }
  end

  def handle_call({:add, value}, _pid, current_value) do
    { :reply, current_value + value, current_value + value }
  end

  def handle_call({:subtract, value}, _pid, current_value) do
    { :reply, current_value - value, current_value - value }
  end

  def handle_call({:multiply, value}, _pid, current_value) do
    { :reply, current_value * value, current_value * value }
  end

  # def handle_call({:multiply, first, second}, _pid, current_value) do
  #   { :reply, first * second, first * second }
  # end

  def handle_call({:divide, value}, _pid, current_value) do
    { :reply, current_value / value, current_value / value }
  end

  def handle_call(:value, _pid, current_value) do
    { :reply, current_value, current_value }
  end

end
