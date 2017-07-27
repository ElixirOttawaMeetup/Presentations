-module(splitter).
-export([split/2]).

split(Char, String) ->
    split(Char, String, [], []).

split(_, [], Run, Acc) ->
    Acc2 = [lists:reverse(Run) | Acc], 
    lists:reverse(Acc2);

% We encountered the delimiter, and we have some chars saved
% up in the current run. Add the string (reverse) to the acc.
split(C, [C|Rest], Run, Acc) ->
    split(C, Rest, [], [lists:reverse(Run) | Acc]);

% We did not encounter a delimiter, save the current char
% to the current run of chars.
split(C, [X|Rest], Run, Acc) ->
    split(C, Rest, [X|Run], Acc).
