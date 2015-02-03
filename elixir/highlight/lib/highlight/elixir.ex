defmodule Highlight.Elixir do
  require Doc
  
	@moduledoc """  
  Load all the test files for different highlighting, validation and language feature showcases.
  """

  @doc """
  [Learn X in Y Minutes](http://learnxinyminutes.com). Take a whirlwind tour of your next favorite language.

  Source: http://learnxinyminutes.com/docs/files/learnelixir.ex

	```elixir
	  #{Doc.load! :"elixir.learnxinyminutes"}
	```
  """
  def learnxinyminutes do
  end

  @doc """
  [Pygments](http://pygments.org). Python sintax highlighter
  
  Generic syntax highlighter suitable for use in code hosting, forums, wikis or other applications that need to prettify source code

  Source: https://bitbucket.org/birkenfeld/pygments-main/src/tip/tests/examplefiles/example_elixir.ex

	```elixir
	  #{Doc.load! :"elixir.pygments"}
	```
  """
  def pygments do
  end

end
