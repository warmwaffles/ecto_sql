if Code.ensure_loaded?(Sqlitex.Server) do
  defmodule Ecto.Adapters.Sqlite.Connection do
    @moduledoc false

    @behaviour Ecto.Adapters.SQL.Connection

    @impl true
    def child_spec(opts) do
      Sqlitex.Server.child_spec(opts)
    end

    @impl true
    def prepare_execute(conn, name, sql, params, opts) do
      Postgrex.prepare_execute(conn, name, sql, params, opts)
    end
  end
end
