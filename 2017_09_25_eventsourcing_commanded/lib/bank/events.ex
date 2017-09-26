defmodule Bank.Events do
  defmodule AccountOpened do
    defstruct [:account_id, :client_id, :initial_balance, :timestamp_utc]
  end

  defmodule MoneyDeposited do
    defstruct [:account_id, :amount, :timestamp_utc]
  end

  defmodule MoneyWithdrawn do
    defstruct [:account_id, :amount, :timestamp_utc]
  end
end
