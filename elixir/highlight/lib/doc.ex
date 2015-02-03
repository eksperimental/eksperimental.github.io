defmodule Doc do
  @moduledoc false
  def read!(file_path, heredoc_quote \\ <<?", ?", ?">>) do
    File.read!( file_path )
      |> escape_heredoc_quotes( heredoc_quote )
  end

  def escape_heredoc_quotes(string, heredoc_quote \\ <<?", ?", ?">>) do
    case heredoc_quote do
      #<<?", ?", ?">> -> String.replace(string, <<?", ?", ?">>, <<?\\, ?", ?\\, ?", ?\\, ?">>)
      <<?", ?", ?">> -> String.replace(string, <<?", ?", ?">>, '\"\"\"')
      <<?', ?', ?'>> -> String.replace(string, <<?', ?', ?'>>, <<?\\, ?', ?\\, ?', ?\\, ?'>>)
    end
  end


  def load!( file_name ) do
    File.read!( "./test/src/" <> "#{file_name}" <> ".txt" )
  end

end
