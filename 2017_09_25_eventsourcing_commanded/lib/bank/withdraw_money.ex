defmodule Bank.WithdrawMoney do
  @moduledoc """
  Withdraw money command.
  """
  @enforce_keys [:account_id, :amount]
  defstruct [:account_id, :amount]
end
