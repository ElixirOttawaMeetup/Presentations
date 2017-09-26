# String Splitter

Example code for writing PropEr test.

## Problem

Define a recursive function:

    split(Char, String) -> [String] 
    
that breaks a string into substrings delimited by a given character. 

Some usage examples:

    > split("@", "pbv@dcc.fc.up.pt")
    ["pbv","dcc.fc.up.pt"]

    > split("/","/usr/include")
    ["", "usr", "include"]


## How to run?

Make sure Docker is installed. Tested on Docker Community Edition Version 17.06.0-ce-win19 
(stable).

Execute `dev.sh` (or dev.bat if you're on windows) to log into the docker container.
You will be placed in the `/app/splitter` directory. From here,
execute rebar3 commands.

To run eunit tests:

    rebar3 eunit

To run proper tests:

    rebar3 proper

To run shell:

    rebar3 shell

