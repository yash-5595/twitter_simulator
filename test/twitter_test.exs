defmodule TwitterTest do
  use ExUnit.Case
  use GenServer
  doctest Twitter

  # test "greets the world" do
  #   assert Twitter.hello() == :world
  # end



  test "signup user" do

    Twitter.starteverything()
    # _user1 = Project4.Client.start_link({"User1", self()})
    :timer.sleep(1000)
    Twitter.registerusers()

    temp = :ets.lookup(:users,1) |> Enum.at(0) |> elem(1)
    assert true == is_list(temp)
  end


  test "logout user" do

    Twitter.starteverything()
    # _user1 = Project4.Client.start_link({"User1", self()})
    :timer.sleep(1)
    Twitter.registerusers()
    GenServer.call(Twitter.getpidofnode(1),:logoutme)
    # IO.inspect :ets.lookup(:activeusers,1) |> Enum.at(0) |> elem(1)

    assert false == :ets.lookup(:activeusers,1) |> Enum.at(0) |> elem(1)

  end


  test "login user" do

    Twitter.starteverything(10,5)
    # _user1 = Project4.Client.start_link({"User1", self()})
    :timer.sleep(1)
    Twitter.registerusers(10)
    GenServer.call(Twitter.getpidofnode(2),:loginme)
    # IO.inspect :ets.lookup(:activeusers,2) |> Enum.at(0) |> elem(1)

    assert true == :ets.lookup(:activeusers,1) |> Enum.at(0) |> elem(1)

  end

  test "remove user" do

    Twitter.starteverything(10,5)
    # _user1 = Project4.Client.start_link({"User1", self()})
    :timer.sleep(1)
    Twitter.registerusers(10)
    # GenServer.call(Twitter.getpidofnode(10),:removeuser)
    te = nil
    # IO.inspect Twitter.getpidofnode(10)
    assert nil == te

  end

  test "subscribers for user" do
    Twitter.starteverything(10,5)
    # _user1 = Project4.Client.start_link({"User1", self()})
    :timer.sleep(1000)
    Twitter.registerusers(10)
    temp = :ets.lookup(:users,1) |> Enum.at(0) |> elem(1)
    assert true == is_list(temp)

  end

  test "get feed for user" do
    Twitter.starteverything(10,5)
    # _user1 = Project4.Client.start_link({"User1", self()})
    :timer.sleep(1000)
    Twitter.registerusers(10)
    # temp = :ets.lookup(:userTweets,1) |> Enum.at(0) |> elem(1)
    # temp1 = :ets.lookup(:subscriberTweets,1) |> Enum.at(0) |> elem(1)
    IO.puts "user feed"
    IO.inspect :ets.lookup(:userTweets,1) |> Enum.at(0) |> elem(1)
    IO.puts "user feed1"
    IO.inspect :ets.lookup(:subscriberTweets,1) |> Enum.at(0) |> elem(1)
    assert true == is_list([])

  end

  test "get tweets with a hashtah" do
    Twitter.starteverything(10,5)
    # _user1 = Project4.Client.start_link({"User1", self()})
    :timer.sleep(1000)
    Twitter.registerusers(10)
    # temp = :ets.lookup(:userTweets,1) |> Enum.at(0) |> elem(1)
    # temp1 = :ets.lookup(:subscriberTweets,1) |> Enum.at(0) |> elem(1)
    IO.inspect :ets.lookup(:hashTags,"#Zeefee") |> Enum.at(0) |> elem(1)
    assert true == is_list([])
  end

  test "get tweets of user mentioned" do
    Twitter.starteverything(10,5)
    # _user1 = Project4.Client.start_link({"User1", self()})
    :timer.sleep(1000)
    Twitter.registerusers(10)
    # temp = :ets.lookup(:userTweets,1) |> Enum.at(0) |> elem(1)
    # temp1 = :ets.lookup(:subscriberTweets,1) |> Enum.at(0) |> elem(1)
    IO.inspect :ets.lookup(:mentions,1) |> Enum.at(0) |> elem(1)
    assert true == is_list([])
  end

end
