defmodule CiscoConfigCopy.Mixfile do
  use Mix.Project

  def project do
    [app: :cisco_config_copy_ex,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:snmp_mib_ex, git: "https://gitlab.com/jonnystorm/snmp-mib-elixir"}]
  end
end
