defmodule Calculation.Server do
  use GenServer

  def handle_call({:reset}, _pid, state) do
    state = Map.put(state, :current, Map.get(state, :baseline))
    { :reply, state, state }
  end

  def handle_call({:reset, value}, _pid, state) do
    state = Map.put(state, :current, value)
    state = Map.put(state, :baseline, value)
    { :reply, state, state }
  end

  def handle_call({:add, value}, _pid, state) do
    state = added(state, value)
    { :reply, state, state }
  end

  def handle_call({:subtract, value}, _pid, state) do
    state = subtracted(state, value)
    { :reply, state, state }
  end

  def handle_call({:multiply, value}, _pid, state) do
    state = multiplied(state, value)
    { :reply, state, state }
  end

  # def handle_call({:multiply, first, second}, _pid, current_value) do
  #   { :reply, first * second, first * second }
  # end

  def handle_call({:divide, value}, _pid, state) do
    state = divided(state, value)
    { :reply, state, state }
  end

  def handle_call(:current_value, _pid, state) do
    # current_value = Map.get(state, :current)
    { :reply, state, state }
  end

  defp added(state, value) do
    Map.put( state, :current, Map.get( state, :current ) + value )
  end
  defp subtracted(state, value) do
    Map.put( state, :current, Map.get( state, :current ) - value )
  end
  defp multiplied(state, value) do
    Map.put( state, :current, Map.get( state, :current ) * value )
  end
  defp divided(state, value) do
    Map.put( state, :current, Map.get( state, :current ) / value )
  end




end
