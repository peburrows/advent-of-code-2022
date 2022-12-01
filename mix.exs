defmodule Advent22.MixProject do
  use Mix.Project

  def project do
    [
      app: :advent22,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:math, "~> 0.3.0"}
    ]
  end
end
