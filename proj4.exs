defmodule Proj4 do
  def off() do
    off()
  end

  def main(arg) do
    noofusers = Enum.at(arg,0)
    noofmsgs = Enum.at(arg,1)
    IO.puts "noofusers"
    IO.inspect noofusers
    IO.puts "noofmsgs"
    IO.inspect noofmsgs
    noofusers = String.to_integer(noofusers)
    noofmsgs = String.to_integer(noofmsgs)

    Twitter.starteverything(noofusers, noofmsgs)
    Twitter.registerusers(noofusers)

  end



end

Proj4.main(System.argv())
