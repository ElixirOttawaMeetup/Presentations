defmodule Bank.Account do
  @moduledoc"""
  Account Aggregate Root.
  Accepts or rejects commands based on domain logic.
  """
  alias Bank.Events.AccountOpened
  alias Bank.Events.MoneyDeposited
  alias Bank.Events.MoneyWithdrawn

  defstruct [account_id: nil, client_id: nil, balance: 0]

  # Public API
  @doc """
  Open a new account.
  """
  def open(%Bank.Account{}=account, account_id, client_id, initial_balance) do
    open_if_doesnt_exist(account, account_id, client_id, initial_balance)
  end

  def open_if_doesnt_exist(%Bank.Account{account_id: nil}, account_id, client_id, initial_balance) do
    open_if_correct_balance(account_id, client_id, initial_balance)
  end
  def open_if_doesnt_exist(_, _, _, _) do
    {:error, :account_already_exists}
  end

  defp open_if_correct_balance(account_id, client_id, b) when is_number(b) and b >= 0 do
    %AccountOpened{account_id: account_id, client_id: client_id, 
                   initial_balance: b, timestamp_utc: timestamp_utc()}
  end

  defp open_if_correct_balance(_, _, _) do
    {:error, :invalid_initial_balance}
  end

  @doc """
  Withdraw some money from an account.
  """
  def withdraw(%Bank.Account{account_id: nil}, _, _) do
    {:error, :account_does_not_exist}
  end
  def withdraw(%Bank.Account{balance: balance}, account_id, amount)  do
    withdraw_if_valid_amount(account_id, amount, balance)
  end

  def withdraw_if_valid_amount(account_id, m, balance) when is_number(m) and m > 0 do
    withdraw_if_sufficient_funds(account_id, m, balance)
  end
  def withdraw_if_valid_amount(_, _, _) do
    {:error, :invalid_amount}
  end

  defp withdraw_if_sufficient_funds(account_id, m, b) do
    case (b - m) < 0 do
      true -> {:error, :insufficient_funds}
      false -> %MoneyWithdrawn{account_id: account_id, 
                           amount: m, 
                           timestamp_utc: timestamp_utc()}
    end
  end

  @doc """
  Deposit some money to an account.
  """
  def deposit(%Bank.Account{account_id: nil}, _, _) do
    {:error, :account_does_not_exist}
  end
  def deposit(%Bank.Account{balance: balance}, account_id, amount) do
    deposit_if_valid_amount(account_id, amount, balance)
  end

  def deposit_if_valid_amount(account_id, m, _) when is_number(m) and m > 0 do
    %MoneyDeposited{account_id: account_id, amount: m, timestamp_utc: timestamp_utc()}
  end
  def deposit_if_valid_amount(_, _, _) do
    {:error, :invalid_amount}
  end

  # Helper functions
  defp timestamp_utc() do
    System.system_time(:second)
  end

  # Callbacks
  def apply(%Bank.Account{}=account, %AccountOpened{account_id: a, client_id: c, initial_balance: b}) do
    %Bank.Account{account | account_id: a, client_id: c, balance: b}
  end
  def apply(%Bank.Account{balance: balance}=account, %MoneyWithdrawn{amount: amount}) do
    %Bank.Account{account | balance: balance - amount}
  end
  def apply(%Bank.Account{balance: balance}=account, %MoneyDeposited{amount: amount}) do
    %Bank.Account{account | balance: balance + amount}
  end
end
