# Sample Bank Application

## Runing
To run follow these steps:
    
    docker-compose up -d
    sh dev.sh

The first line starts Event Store, and the second compiles and starts
Elixir project, putting you into IEx shell.

From here you can issue commands to the aggregate, e.g.:

    iex(1)> Bank.open_account("333-121-568-3245", "3324-john.oliver", 0)
    iex(2)> Bank.deposit_money("333-121-568-3245", 1000)

## Checking Balance

To check balance:

1. Navigate to EventStore, which should be running at:

   http://localhost:2113

   and login with username "admin" and password "changeit".

2. Create a new projection in EventStore called "balance" with the
   code from `projection.js`.

3. Open a (non-elixir) shell from your host and execute curl as follows:

   `curl -i http://localhost:2113/projection/balance/state\?partition\=account=333-121-568-3245`
