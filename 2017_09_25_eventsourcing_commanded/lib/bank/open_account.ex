defmodule Bank.OpenAccount do
  @moduledoc """
  Open an account command.
  """
  @enforce_keys [:account_id, :client_id, :initial_balance]
  defstruct [:account_id, :client_id, :initial_balance]
end
