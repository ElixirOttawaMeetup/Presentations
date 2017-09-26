-include_lib("eunit/include/eunit.hrl").
-module(test_splitter).

basic_test_() ->
    Expected = ["pbv","dcc.fc.up.pt"],
    ?_assertEqual(Expected, splitter:split($@, "pbv@dcc.fc.up.pt")).

empty_test_() ->
    Expected = ["", ""],
    ?_assertEqual(Expected, splitter:split($a, "a")).
