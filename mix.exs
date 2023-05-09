defmodule LiveMonacoEditor.MixProject do
  use Mix.Project

  def project do
    [
      app: :live_monaco_editor,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7"},
      {:phoenix_live_view, "~> 0.18.18"},
      {:phoenix_live_reload, "~> 1.4", only: :dev},
      {:plug_cowboy, "~> 2.6", only: :dev},
      {:jason, "~> 1.4"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "assets.setup"],
      format: ["format", "cmd npm run format --prefix ./assets"],
      dev: "run --no-halt dev.exs",
      "assets.setup": ["cmd --cd assets npm install"],
      "assets.build": ["cmd --cd assets npm run build"],
      "assets.build.watch": ["cmd --cd assets npm run build.watch"]
    ]
  end
end
