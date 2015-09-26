# Calculation

A simple Elixir/OTP calculation server, created as an exercise following the Erlang/OTP/Elixir/Phoenix class taught by Norberto Ortigoza ([@hiphoox](https://twitter.com/hiphoox)) hosted by [@HackerFounderSV](https://twitter.com/HackerFounderSV) at [@hackerdojo](https://twitter.com/hackgerdojo).

It maintains state so each operation works on the current value, rather than passing in two values. 

Since the above approach needs to start somewhere, a "baseline" value is set on server instance creation. The current value can be reset to the baseline, or the current and baseline can be reset to a new value.

Next in line: 

* exploring the `doctest` macro
* eliminate the explicit `GenServer.call()`s 
