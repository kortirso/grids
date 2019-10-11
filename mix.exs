defmodule Grids.MixProject do
  use Mix.Project

  @description """
  Application for building grids and perform some actions
  """

  def project do
    [
      app: :grids,
      version: "0.1.0",
      elixir: "~> 1.9",
      name: "Grids",
      description: @description,
      source_url: "https://github.com/kortirso/grids",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Anton Bogdanov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/kortirso/grids"}
    ]
  end
end
