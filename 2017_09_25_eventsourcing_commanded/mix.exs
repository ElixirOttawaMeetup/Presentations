defmodule Bank.Mixfile do
  use Mix.Project

  def project do
    [app: :bank,
     version: "1.0.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :inets],
     mod: {Bank.Application, []}]
  end

  defp deps do
    [
      {:commanded, "~> 0.9"},
      {:commanded_extreme_adapter, "~> 0.1"},
      {:uuid, "~> 1.1.7" },
      {:dialyxir, "~> 0.4", only: [:dev], runtime: false},
      {:distillery, "~> 1.0"}
    ]
  end
end
