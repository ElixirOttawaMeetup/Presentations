defmodule Bank do
  @spec open_account(String.t, String.t, non_neg_integer()) :: :ok | 
    {:error, :account_already_exists} | 
    {:error, :invalid_initial_balance}
  def open_account(account_id, client_id, initial_balance) do
    cmd = %Bank.OpenAccount{account_id: account_id, 
                             client_id: client_id, 
                       initial_balance: initial_balance}
    Bank.Router.dispatch(cmd)
  end

  @spec deposit_money(String.t, non_neg_integer()) :: :ok | 
    {:error, :invalid_amount}
  def deposit_money(account_id, amount) do
    cmd = %Bank.DepositMoney{account_id: account_id, amount: amount}
    Bank.Router.dispatch(cmd)
  end

  @spec withdraw_money(String.t, non_neg_integer()) :: :ok | 
    {:error, :insufficient_funds} | 
    {:error, :invalid_amount}
  def withdraw_money(account_id, amount) do
    cmd = %Bank.WithdrawMoney{account_id: account_id, amount: amount}
    Bank.Router.dispatch(cmd)
  end
end