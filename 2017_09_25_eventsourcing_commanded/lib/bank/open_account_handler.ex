defmodule Bank.OpenAccountHandler do
  @behaviour Commanded.Commands.Handler

  def handle(%Bank.Account{}=aggregate, %Bank.OpenAccount{account_id: account_id, 
    client_id: client_id, 
    initial_balance: initial_balance}) do

    aggregate |> Bank.Account.open(account_id, client_id, initial_balance)
  end
end
