defmodule DockbitPhoenixExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :dockbit_phoenix_example,
      version: get_version(),
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {DockbitPhoenixExample, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.0-rc"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:distillery, "~> 1.4", runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  defp version_from_file(file \\ "VERSION") do
    File.read(file)
  end

  defp handle_file_version({:ok, content}) do
    content
  end
  defp handle_file_version({:error, _}) do
    retrieve_version_from_git()
  end
  defp retrieve_version_from_git do
    require Logger
    Logger.warn "Calling out to `git describe` for the version number. This is slow! You should think about a hook to set the VERSION file"
    System.cmd("git", ["describe", "--always", "--tags"])
    |> Tuple.to_list
    |> List.first
    |> String.strip
  end

  defp get_version do
    version_from_file()
    |> handle_file_version()
    |> String.split("-")
    |> case do
      [tag] -> tag
      [tag, num_commits, commit] -> "#{tag}-#{num_commits}-#{commit}"
    end
    |> String.replace_leading("v", "")
  end
end
