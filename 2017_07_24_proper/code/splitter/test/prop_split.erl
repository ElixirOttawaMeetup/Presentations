-module(prop_split).
-include_lib("proper/include/proper.hrl").

%%% If we first split and then unsplit with the same delimiter, 
%%% we should get back the original string
prop_test() ->
    ?FORALL({Char, String}, {char(), string()},
        begin
            Strings = splitter:split(Char, String),
            String =:= string:join(Strings, [Char])
        end).

