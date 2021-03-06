defmodule Og.Mixfile do
  use Mix.Project

  def project do
    [
     app: :og,
     name: "Óg",
     version: "0.1.0",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     source_url: "https://github.com/stephenmoloney/og",
     description: "Og is a small collection of logger helper functions in elixir",
     package: package(),
     deps: deps(),
     docs: [
       main: "Og",
       extra_section: ""
     ]
    ]
  end

  def application do
    [applications: [:logger]]
  end

  def deps() do
    [
      {:plug,  "~> 1.0", only: [:dev, :test]},
      {:earmark, "~> 0.2.1", only: :dev},
      {:ex_doc,  "~> 0.11", only: :dev}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["Stephen Moloney"],
      links: %{ "GitHub" => "https://github.com/stephenmoloney/og"},
      files: ~w(lib mix.exs README* LICENSE* CHANGELOG*)
     }
  end


  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

end
