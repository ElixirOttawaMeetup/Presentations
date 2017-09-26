defmodule Bank.WithdrawMoneyHandler do
  @behaviour Commanded.Commands.Handler

  def handle(%Bank.Account{}=aggregate, %Bank.WithdrawMoney{account_id: account_id, amount: amount}) do
    aggregate |> Bank.Account.withdraw(account_id, amount)
  end
end
