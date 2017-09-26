defmodule Bank.DepositMoney do
  @moduledoc """
  Deposit Money command.
  """
  @enforce_keys [:account_id, :amount]
  defstruct [:account_id, :amount]
end
