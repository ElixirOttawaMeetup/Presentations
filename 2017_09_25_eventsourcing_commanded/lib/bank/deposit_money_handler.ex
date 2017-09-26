defmodule Bank.DepositMoneyHandler do
  @behaviour Commanded.Commands.Handler

  def handle(%Bank.Account{}=aggregate, %Bank.DepositMoney{account_id: account_id, amount: amount}) do
    aggregate |> Bank.Account.deposit(account_id, amount)
  end
end
