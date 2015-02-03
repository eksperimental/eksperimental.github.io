defmodule Highlight.All do
  require Doc
	
  @moduledoc """  
  Load all the test files for different highlighting, validation and language feature showcases.
  """
  
  @doc """
  All languages.

  Source files:
  * Pygments: https://bitbucket.org/birkenfeld/pygments-main/src/tip/tests/examplefiles/?at=default
  * Learn X in Y minutes: https://github.com/adambard/learnxinyminutes-docs/
  * Highlight.js: https://highlightjs.org/static/demo/
  

  ## Main Languages

  """

  @doc """
  IEx 

  ### IEx (by default, with no language definition )
  ```
    #{Doc.load! :"iex.sample"}
  ```

  ### IEx
  ```iex
    #{Doc.load! :"iex.pygments"}
  ```
  """
  def iex do end


  @doc """  
  Elixir

  ### Elixir
  ```
    #{Doc.load! :"elixir.pygments"}
  ```

  ### Elixir
  ```
    #{Doc.load! :"elixir.learnxinyminutes"}
  ```
  """
  def elixir do end


  @doc """  
  Erlang

  ### Erlang
  ```erlang
    #{Doc.load! :"erlang.highlightjs"}
  ```

  ```erl
    #{Doc.load! :"erlang.pygments"}
  ```
  """
  def erlang do end


  @doc """
  Erlang-REPL

  ### Erlang REPL
  ```erlang-repl
    #{Doc.load! :"erlang-repl.highlightjs"}
  ```

  ```erlang-repl
    #{Doc.load! :"erlang-repl.pygments"}
  ```

  ```erlang-repl
    #{Doc.load! :"erlang-repl.sample"}
  ```  
  """
  def erlang_repl do end


  @doc """
  Markdown

  ### Markdown
  ```markdown
    #{Doc.load! :"markdown.highlightjs"}
  ```
  """
  def markdown do end


  @doc """
  Bash 

  ### Bash
  ```bash
    #{Doc.load! :"bash.highlightjs"}
  ```

  ```bash
    #{Doc.load! :"bash.pygments"}
  ```
  
  ```sh
    #{Doc.load! :"sh-session.pygments"}
  ```

  ```bash
    #{Doc.load! :"shell-session.pygments"}
  ```
  """
  def bash do end


  @doc """
  CoffeeScript

  ### CoffeeScript
  ```coffeescript
    #{Doc.load! :"coffeescript.highlightjs"}
  ```

  ```coffeescript
    #{Doc.load! :"coffeescript.pygments"}
  ```
  """
  def coffeescript do end


  @doc """
  CSS

  ### CSS
  ```css
    #{Doc.load! :"css.highlightjs"}
  ```

  ```css
    #{Doc.load! :"css.pygments"}
  ```
  """
  def css do end


  @doc """
  Diff

  ### Diff
  ```diff
    #{Doc.load! :"diff.sample"}
  ```

  ```diff
    #{Doc.load! :"diff.sample2"}
  ```
  """
  def diff do end


  @doc """
  Javascript

  ### JavaScript
  ```javascript
    #{Doc.load! :"javascript.sample"}
  ```

  ```js
    // This is js
    #{Doc.load! :"javascript.sample2"}
  ```
  """
  def javascript do end


  @doc """
  JSON

  ### JSON
  ```json
    #{Doc.load! :"json.sample"}
  ```

  ```json
    #{Doc.load! :"json.sample2"}
  ```
  """
  def json do end


  @doc """
  HTML/XML

  ### HTML
  ```html
    #{Doc.load! :"html.sample"}
  ```

  ### XML
  ```xml
    #{Doc.load! :"xml.highlightjs"}
  ```
  """
  def html do end


  @doc """
  HTTP

  ### HTTP
  ```http
    #{Doc.load! :"http.sample"}
  ```

  ```http
    #{Doc.load! :"http_request.pygments"}
  ```

  ```http
    #{Doc.load! :"http_response.pygments"}
  ```
  """
  def http do end


  @doc """
  SQL

  ### SQL
  ```sql
    #{Doc.load! :"sql.highlightjs"}
  ```

  ```sql
    #{Doc.load! :"postgresql.pygments"}
  ```
  """
  def sql do end


  @doc """
  No Highlighting

  ### Language Not Defined
  ```
    #{Doc.load! :"json.sample"}
  ```

  ### Language Not Supported
  ```nosupportedlanguage
    #{Doc.load! :"json.sample"}
  ```

  ### No Highlight (explicitely called)
  ```nohighlight
  #This should not be higligthed at all
  #{Doc.load! :"elixir.sample"}
  ```
  """
  def no_highlighting do end

end