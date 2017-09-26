defmodule Bank.Router do
  use Commanded.Commands.Router

  dispatch Bank.OpenAccount,   to: Bank.OpenAccountHandler,   aggregate: Bank.Account, identity: :account_id
  dispatch Bank.DepositMoney,  to: Bank.DepositMoneyHandler,  aggregate: Bank.Account, identity: :account_id
  dispatch Bank.WithdrawMoney, to: Bank.WithdrawMoneyHandler, aggregate: Bank.Account, identity: :account_id
end
