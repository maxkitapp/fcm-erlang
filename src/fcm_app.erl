-module(fcm_app).

-behaviour(application).

-export([start/2, stop/1]).

-spec start(_, _) -> {ok, pid()}.
start(_StartType, _StartArgs) ->
    {ok, Pid} = fcm_sup:start_link(),
    Pools = application:get_env(fcm, pools, []),
    lists:foreach(
        fun({PoolName, PoolKey}) -> fcm_sup:start_child(PoolName, PoolKey) end,
        Pools
    ),
    {ok, Pid}.

-spec stop(_) -> ok.
stop(_State) ->
    ok.
