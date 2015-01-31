defmodule FooBar do
  @moduledoc """
  Agents are a simple abstraction around state.

  Often in Elixir there is a need to share or store state that
  must be accessed from different processes or by the same process
  at different points in time.

  The Agent module provides a basic server implementation that
  allows state to be retrieved and updated via a simple API.

  ## Examples

  Iex (by default, with no language definition )
  ```
  iex> Base.decode16("666F6F626172")
  {:ok, "foobar"}

  iex> Base.decode16("666f6f626172", case: :lower)
  {:ok, "foobar"}

  iex> Base.decode16("666f6F626172", case: :mixed)
  {:ok, "foobar"}
  ```
  """
end

defmodule FooBar2 do
  @moduledoc ~S'''
  Agents are a simple abstraction around state.

  Often in Elixir there is a need to share or store state that
  must be accessed from different processes or by the same process
  at different points in time.

  The Agent module provides a basic server implementation that
  allows state to be retrieved and updated via a simple API.

  ## Examples

  Iex (by default, with no language definition )
  ```
  iex> Base.decode16("666F6F626172")
  {:ok, "foobar"}

  iex> Base.decode16("666f6f626172", case: :lower)
  {:ok, "foobar"}

  iex> Base.decode16("666f6F626172", case: :mixed)
  {:ok, "foobar"}
  ```

  Iex
  ```iex
  iex> Base.decode16("666F6F626172")
  {:ok, "foobar"}

  iex> Base.decode16("666f6f626172", case: :lower)
  {:ok, "foobar"}

  iex> Base.decode16("666f6F626172", case: :mixed)
  {:ok, "foobar"}
  ```
  
  Elixir
  ```
  #This should be highlighted as elixir
  # Numbers
  0b0101011
  1234 ; 0x1A ; 0xbeef ; 0763 ; 0o123
  3.14 ; 5.0e21 ; 0.5e-12
  100_000_000

  # these are not valid numbers
  0b012 ; 0xboar ; 0o888
  0B01 ; 0XAF ; 0O123

  # Characters
  ?a ; ?1 ; ?\n ; ?\s ; ?\c ; ? ; ?,
  ?\x{12} ; ?\x{abcd}
  ?\x34 ; ?\xF

  # these show that only the first digit is part of the character
  ?\123 ; ?\12 ; ?\7

  # Atoms
  :this ; :that
  :'complex atom'
  :"with' \"\" 'quotes"
  :" multi
   line ' \s \123 \xff
  atom"
  :... ; :<<>> ; :%{} ; :% ; :{}
  :++; :--; :*; :~~~; :::
  :% ; :. ; :<-

  # Strings
  "Hello world"
  "Interspersed \x{ff} codes \7 \8 \65 \016 and \t\s\\s\z\+ \\ escapes"
  "Quotes ' inside \" \123 the \"\" \xF \\xF string \\\" end"
  "Multiline
     string"

  # Char lists
  'this is a list'
  'escapes \' \t \\\''
  'Multiline
      char
    list
  '

  # Binaries
  <<1, 2, 3>>
  <<"hello"::binary, c :: utf8, x::[4, unit(2)]>> = "hello™1"

  # Sigils
  ~r/this + i\s "a" regex/
  ~R'this + i\s "a" regex too'
  ~w(hello #{ ["has" <> "123", '\c\d', "\123 interpol" | []] } world)s
  ~W(hello #{no "123" \c\d \123 interpol} world)s

  ~s{Escapes terminators \{ and \}, but no {balancing} # outside of sigil here }

  ~S"No escapes \s\t\n and no #{interpolation}"

  :"atoms work #{"to" <> "o"}"

  # Operators
  x = 1 + 2.0 * 3
  y = true and false; z = false or true
  ... = 144
  ... == !x && y || z
  "hello" |> String.upcase |> String.downcase()
  {^z, a} = {true, x}

  # Free operators (added in 1.0.0)
  p  ~>> f  = bind(p, f)
  p1 ~>  p2 = pair_right(p1, p2)
  p1 <~  p2 = pair_left(p1, p2)
  p1 <~> p2 = pair_both(p1, p2)
  p  |~> f  = map(p, f)
  p1 <|> p2 = either(p1, p2)

  # Lists, tuples, maps, keywords
  [1, :a, 'hello'] ++ [2, 3]
  [:head | [?t, ?a, ?i, ?l]]

  {:one, 2.0, "three"}

  [...: "this", <<>>: "is", %{}: "a keyword", %: "list", {}: "too"]
  ["this is an atom too": 1, "so is this": 2]
  [option: "value", key: :word]
  [++: "operator", ~~~: :&&&]

  map = %{shortcut: "syntax"}
  %{map | "update" => "me"}
  %{ 12 => 13, :weird => ['thing'] }

  # Comprehensions
  for x <- 1..10, x < 5, do: {x, x}
  pixels = "12345678"
  for << <<r::4, g::4, b::4, a::size(4)>> <- pixels >> do
    [r, {g, %{"b" => a}}]
  end

  # String interpolation
  "String #{inspect "interpolation"} is quite #{1+4+7} difficult"

  # Identifiers
  abc_123 = 1
  _018OP = 2
  A__0 == 3

  # Modules
  defmodule Long.Module.Name do
    @moduledoc "Simple module docstring"

    @doc """
    Multiline docstring
    "with quotes"
    and #{ inspect %{"interpolation" => "in" <> "action"} }
    now with #{ {:a, 'tuple'} }
    and #{ inspect {
        :tuple,
        %{ with: "nested #{ inspect %{ :interpolation => %{} } }" }
    } }
    """
    defstruct [:a, :name, :height]

    @doc ~S"""
    No #{interpolation} of any kind.
    \000 \x{ff}

    \n #{\x{ff}}
    """
    def func(a, b \\ []), do: :ok

    @doc false
    def __before_compile__(_) do
      :ok
    end
  end

  # Structs
  defmodule Second.Module do
    s = %Long.Module.Name{name: "Silly"}
    %Long.Module.Name{s | height: {192, :cm}}
    ".. #{%Long.Module.Name{s | height: {192, :cm}}} .."
  end

  # Types, pseudo-vars, attributes
  defmodule M do
    @custom_attr :some_constant

    @before_compile Long.Module.Name

    @typedoc "This is a type"
    @type typ :: integer

    @typedoc """
    Another type
    """
    @opaque typtyp :: 1..10

    @spec func(typ, typtyp) :: :ok | :fail
    def func(a, b) do
      a || b || :ok || :fail
      Path.expand("..", __DIR__)
      IO.inspect __ENV__
      __NOTAPSEUDOVAR__ = 11
      __MODULE__.func(b, a)
    end

    defmacro m() do
      __CALLER__
    end
  end

  # Functions
  anon = fn x, y, z ->
    fn(a, b, c) ->
      &(x + y - z * a / &1 + b + div(&2, c))
    end
  end

  &Set.put(&1, &2) ; & Set.put(&1, &2) ; &( Set.put(&1, &1) )

  # Function calls
  anon.(1, 2, 3); self; hd([1,2,3])
  Kernel.spawn(fn -> :ok end)
  IO.ANSI.black

  # Control flow
  if :this do
    :that
  else
    :otherwise
  end

  pid = self
  receive do
    {:EXIT, _} -> :done
    {^pid, :_} -> nil
    after 100 -> :no_luck
  end

  case __ENV__.line do
    x when is_integer(x) -> x
    x when x in 1..12 -> -x
  end

  cond do
    false -> "too bad"
    4 > 5 -> "oops"
    true -> nil
  end

  # Lexical scope modifiers
  import Kernel, except: [spawn: 1, +: 2, /: 2, Unless: 2]
  alias Long.Module.Name, as: N0men123_and4
  use Bitwise

  4 &&& 5
  2 <<< 3

  # Protocols
  defprotocol Useless do
    def func1(this)
    def func2(that)
  end

  defimpl Useless, for: Atom do
  end

  # Exceptions
  defmodule NotAnError do
    defexception [:message]
  end

  raise NotAnError, message: "This is not an error"
  ```

  SQL
  ```sql
  BEGIN;
  CREATE TABLE "topic" (
      -- This is the greatest table of all time
      "id" serial NOT NULL PRIMARY KEY,
      "forum_id" integer NOT NULL,
      "subject" varchar(255) NOT NULL -- Because nobody likes an empty subject
  );
  ALTER TABLE "topic" ADD CONSTRAINT forum_id FOREIGN KEY ("forum_id") REFERENCES "forum" ("id");

  -- Initials
  insert into "topic" ("forum_id", "subject") values (2, 'D''artagnian');

  select /* comment */ count(*) from cicero_forum;

  -- this line lacks ; at the end to allow people to be sloppy and omit it in one-liners
  /*
  but who cares?
  */
  COMMIT 
  ```

  Markdown
  ```markdown
  # hello world

  you can write text [with links](http://example.com) inline or [link references][1].

  * one _thing_ has *em*phasis
  * two __things__ are **bold**

  [1]: http://example.com

  ---

  hello world
  ===========

  <this_is inline="xml"></this_is>

  > markdown is so cool

      so are code segments

  1. one thing (yeah!)
  2. two thing `i can write code`, and `more` wipee!
  ```

  Erlang
  ```erlang
  -module(ssh_cli).

  -behaviour(ssh_channel).

  -include("ssh.hrl").
  %% backwards compatibility
  -export([listen/1, listen/2, listen/3, listen/4, stop/1]).

  if L =/= [] ->      % If L is not empty
      sum(L) / count(L);
  true ->
      error
  end.

  %% state
  -record(state, {
      cm,
      channel
     }).

  -spec foo(integer()) -> integer().
  foo(X) -> 1 + X.

  test(Foo)->Foo.

  init([Shell, Exec]) ->
      {ok, #state{shell = Shell, exec = Exec}};
  init([Shell]) ->
      false = not true,
      io:format("Hello, \"~p!~n", [atom_to_list('World')]),
      {ok, #state{shell = Shell}}.

  concat([Single]) -> Single;
  concat(RList) ->
      EpsilonFree = lists:filter(
          fun (Element) ->
              case Element of
                  epsilon -> false;
                  _ -> true
              end
          end,
          RList),
      case EpsilonFree of
          [Single] -> Single;
          Other -> {concat, Other}
      end.

  union_dot_union({union, _}=U1, {union, _}=U2) ->
      union(lists:flatten(
          lists:map(
              fun (X1) ->
                  lists:map(
                      fun (X2) ->
                          concat([X1, X2])
                      end,
                      union_to_list(U2)
                  )
              end,
              union_to_list(U1)
          ))).
  ```
  
  Erlang REPL
  ```erlang-repl
  Eshell V6.3  (abort with ^G)
  1> A=2;
  1> .
  * 2: syntax error before: '.'
  1> A = 2.
  2
  2> A = 3.
  ** exception error: no match of right hand side value 3
  3> 
  ```

  ```erlang-repl
  1> Str = "abcd".
  "abcd"
  2> L = test:length(Str).
  4
  3> Descriptor = {L, list_to_atom(Str)}.
  {4,abcd}
  4> L.
  4
  5> b().
  Descriptor = {4,abcd}
  L = 4
  Str = "abcd"
  ok
  6> f(L).
  ok
  7> b().
  Descriptor = {4,abcd}
  Str = "abcd"
  ok
  8> {L, _} = Descriptor.
  {4,abcd}
  9> L.
  4
  10> 2#101.
  5
  11> 1.85e+3.
  1850
  ```  

  JavaScript
  ```javascript
  function $initHighlight(block, flags) {
    try {
      if (block.className.search(/\bno\-highlight\b/) != -1)
        return processBlock(block.function, true, 0x0F) + ' class=""';
    } catch (e) {
      /* handle exception */
      var e4x =
          <div>Example
              <p>1234</p></div>;
    }
    for (var i = 0 / 2; i < classes.length; i++) { // "0 / 2" should not be parsed as regexp
      if (checkCondition(classes[i]) === undefined)
        return /\d+[\s/]/g;
    }
    console.log(Array.every(classes, Boolean));
  }
  ```

  ```js
  // This is js
  function fixOutsideWorldLinks() {
    $('a').each(function() {
      if (window.location.host != this.host) this.target = '_parent';
    });
  }

  $(fixOutsideWorldLinks);
  ```

  Bash
  ```bash
  #!/bin/bash

  ###### BEGIN CONFIG
  ACCEPTED_HOSTS="/root/.hag_accepted.conf"
  BE_VERBOSE=false
  ###### END CONFIG

  if [ "$UID" -ne 0 ]
  then
   echo "Superuser rights is required"
   echo 'Printing the # sign'
   exit 2
  fi

  if test $# -eq 0
  then
  elif test [ $1 == 'start' ]
  else
  fi

  genApacheConf(){
   if [[ "$2" = "www" ]]
   then
    full_domain=$1
   else
    full_domain=$2.$1
   fi
   host_root="${APACHE_HOME_DIR}$1/$2/$(title)"
   echo -e "# Host $1/$2 :"
  }
  ```

  JSON
  ```json
  {
      "glossary": {
          "title": "example glossary",
      "GlossDiv": {
              "title": "S",
        "GlossList": {
                  "GlossEntry": {
                      "ID": "SGML",
            "SortAs": "SGML",
            "GlossTerm": "Standard Generalized Markup Language",
            "Acronym": "SGML",
            "Abbrev": "ISO 8879:1986",
            "GlossDef": {
                          "para": "A meta-markup language, used to create markup languages such as DocBook.",
              "GlossSeeAlso": ["GML", "XML"]
                      },
            "GlossSee": "markup"
                  }
              }
          }
      }
  }
  ```

  ```JSON
  [
    {
      "title": "apples",
      "count": [12000, 20000],
      "description": {"text": "...", "sensitive": false}
    },
    {
      "title": "oranges",
      "count": [17500, null],
      "description": {"text": "...", "sensitive": false}
    }
  ]
  ```

  NOT DEFINED
  ```
  [
    {
      "title": "apples",
      "count": [12000, 20000],
      "description": {"text": "...", "sensitive": false}
    },
    {
      "title": "oranges",
      "count": [17500, null],
      "description": {"text": "...", "sensitive": false}
    }
  ]
  ```

  LANGUAGE NOT SUPPORTED
  ```nosupportedlanguage
  [
    {
      "title": "apples",
      "count": [12000, 20000],
      "description": {"text": "...", "sensitive": false}
    },
    {
      "title": "oranges",
      "count": [17500, null],
      "description": {"text": "...", "sensitive": false}
    }
  ]
  ```

  HTTP
  ```http
  GET /tutorials/other/top-20-mysql-best-practices/ HTTP/1.1
  HTTP/1.x 200 OK
  Transfer-Encoding: chunked
  Date: Sat, 28 Nov 2009 04:36:25 GMT
  Server: LiteSpeed
  Connection: close
  X-Powered-By: W3 Total Cache/0.8
  Pragma: public
  Expires: Sat, 28 Nov 2009 05:36:25 GMT
  Etag: "pub1259380237;gz"
  Cache-Control: max-age=3600, public
  Content-Type: text/html; charset=UTF-8
  Last-Modified: Sat, 28 Nov 2009 03:50:37 GMT
  X-Pingback: http://net.tutsplus.com/xmlrpc.php
  Content-Encoding: gzip
  Vary: Accept-Encoding, Cookie, User-Agent
  Host: net.tutsplus.com
  User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 (.NET CLR 3.5.30729)
  Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
  Accept-Language: en-us,en;q=0.5
  Accept-Encoding: gzip,deflate
  Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
  Keep-Alive: 300
  Connection: keep-alive
  Cookie: PHPSESSID=r2t5uvjq435r4q7ib3vtdjq120
  Pragma: no-cache
  Cache-Control: no-cache
  Content-Type: application/json; charset=utf-8
  Content-Length: 19

  {"status": "ok", "extended": true}
   
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Top 20+ MySQL Best Practices - Nettuts+</title>
  <!-- ... rest of the html ... -->  
  ```

  CoffeeScript
  ```coffeescript
  grade = (student, period=(if b? then 7 else 6), messages={"A": "Excellent"}) ->
    if student.excellentWork
      "A+"
    else if student.okayStuff
      if student.triedHard then "B" else "B-"
    else
      "C"

  square = (x) -> x * x

  two = -> 2

  math =
    root:   Math.sqrt
    square: square
    cube:   (x) -> x * square x

  race = (winner, runners...) ->
    print winner, runners

  class Animal extends Being
    constructor: (@name) ->

    move: (meters) ->
      alert @name + " moved #{meters}m."

  hi = `function() {
    return [document.title, "Hello JavaScript"].join(": ");
  }`

  heredoc = """
  CoffeeScript subst test #{ 010 + 0xf / 0b10 + "nested string #{ /\n/ }"}
  """

  ###
  CoffeeScript Compiler v1.2.0
  Released under the MIT License
  ###

  OPERATOR = /// ^ (
  ?: [-=]>             # function
  ) ///
  ```
  
  ```coffeescript
  class GiftModel
      constructor: (gifts) ->
          @gifts = ko.observableArray gifts

          @addGift = =>
              @gifts.push
                  name: ""
                  price: ""

          @removeGift = (gift) =>
              @gifts.remove gift

          @save = (form) =>
              alert "Could now transmit to server: #{ko.utils.stringifyJson @gifts}"

  $ ->  
  ```
  
  Diff
  ```diff
  Index: languages/ini.js
  ===================================================================
  --- languages/ini.js    (revision 199)
  +++ languages/ini.js    (revision 200)
  @@ -1,8 +1,7 @@
   hljs.LANGUAGES.ini =
   {
     case_insensitive: true,
  -  defaultMode:
  -  {
  +  defaultMode: {
       contains: ['comment', 'title', 'setting'],
       illegal: '[^\\s]'
     },

  *** /path/to/original timestamp
  --- /path/to/new      timestamp
  ***************
  *** 1,3 ****
  --- 1,9 ----
  + This is an important
  + notice! It should
  + therefore be located at
  + the beginning of this
  + document!

  ! compress the size of the
  ! changes.

    It is important to spell
  ```

  ```diff
  *** lao Sat Jan 26 23:30:39 1991
  --- tzu Sat Jan 26 23:30:50 1991
  ***************
  *** 1,7 ****
  - The Way that can be told of is not the eternal Way;
  - The name that can be named is not the eternal name.
    The Nameless is the origin of Heaven and Earth;
  ! The Named is the mother of all things.
    Therefore let there always be non-being,
      so we may see their subtlety,
    And let there always be being,
  --- 1,6 ----

  11a
  They both may be called deep and profound.
  Deeper and more profound,
  The door of all subtleties!
  .
  4c
  The named is the mother of all things.

  .
  1,2d

  @@ -1 +1,15 @@
  -!function(e){"undefined"!=typeof exports?e(exports):(window.hljs=e({}),"function"==typeof define&&define.amd&&define([],function(){return window.hljs}))}(function(e){function n(e){return e.replace(/&/gm,"&amp;").replace(/</gm,"&lt;").replace(/>/gm,"&gt;")}function t(e){return e.nodeName.toLowerCase()}function r(e,n){var t=e&&e.exec(n);return t&&0==t.index}function a(e){var n=(e.className+" "+(e.parentNode?e.parentNode.className:"")).split(/\s+/);return n=n.map(function(e){return e.replace(/^lang(uage)?-/,"")}),n.filter(function(e){return N(e)||/no(-?)highlight/.test(e)})[0]}function o(e,n){var t={};for(var r in e)t[r]=e[r];if(n)for(var r in n)t[r]=n[r];return t}function i(e){var n=[];return function r(e,a){for(var o=e.firstChild;o;o=o.nextSibling)3==o.nodeType?a+=o.nodeValue.length:1==o.nodeType&&(n.push({event:"start",offset:a,node:o}),a=r(o,a),t(o).match(/br|hr|img|input/)||n.push({event:"stop",offset:a,node:o}));return a}(e,0),n}function c(e,r,a){function o(){return e.length&&r.length?e[0].offset!=r[0].offset?e[0].offset<r[0].offset?e:r:"start"==r[0].event?e:r:e.length?e:r}function i(e){function r(e){return" "+e.nodeName+'="'+n(e.value)+'"'}l+="<"+t(e)+Array.prototype.map.call(e.attributes,r).join("")+">"}function c(e){l+="</"+t(e)+">"}function u(e){("start"==e.event?i:c)(e.node)}for(var s=0,l="",f=[];e.length||r.length;){var g=o();if(l+=n(a.substr(s,g[0].offset-s)),s=g[0].offset,g==e){f.reverse().forEach(c);do u(g.splice(0,1)[0]),g=o();while(g==e&&g.length&&g[0].offset==s);f.reverse().forEach(i)}else"start"==g[0].event?f.push(g[0].node):f.pop(),u(g.splice(0,1)[0])}return l+n(a.substr(s))}function u(e){function n(e){return e&&e.source||e}function t(t,r){return RegExp(n(t),"m"+(e.cI?"i":"")+(r?"g":""))}function r(a,i){if(!a.compiled){if(a.compiled=!0,a.k=a.k||a.bK,a.k){var c={},u=function(n,t){e.cI&&(t=t.toLowerCase()),t.split(" ").forEach(function(e){var t=e.split("|");c[t[0]]=[n,t[1]?Number(t[1]):1]})};"string"==typeof a.k?u("keyword",a.k):Object.keys(a.k).forEach(function(e){u(e,a.k[e])}),a.k=c}a.lR=t(a.l||/\b[A-Za-z0-9_]+\b/,!0),i&&(a.bK&&(a.b="\\b("+a.bK.split(" ").join("|")+")\\b"),a.b||(a.b=/\B|\b/),a.bR=t(a.b),a.e||a.eW||(a.e=/\B|\b/),a.e&&(a.eR=t(a.e)),a.tE=n(a.e)||"",a.eW&&i.tE&&(a.tE+=(a.e?"|":"")+i.tE)),a.i&&(a.iR=t(a.i)),void 0===a.r&&(a.r=1),a.c||(a.c=[]);var s=[];a.c.forEach(function(e){e.v?e.v.forEach(function(n){s.push(o(e,n))}):s.push("self"==e?a:e)}),a.c=s,a.c.forEach(function(e){r(e,a)}),a.starts&&r(a.starts,i);var l=a.c.map(function(e){return e.bK?"\\.?("+e.b+")\\.?":e.b}).concat([a.tE,a.i]).map(n).filter(Boolean);a.t=l.length?t(l.join("|"),!0):{exec:function(){return null}}}}r(e)}function s(e,t,a,o){function i(e,n){for(var t=0;t<n.c.length;t++)if(r(n.c[t].bR,e))return n.c[t]}function c(e,n){return r(e.eR,n)?e:e.eW?c(e.parent,n):void 0}function f(e,n){return!a&&r(n.iR,e)}function g(e,n){var t=x.cI?n[0].toLowerCase():n[0];return e.k.hasOwnProperty(t)&&e.k[t]}function p(e,n,t,r){var a=r?"":E.classPrefix,o='<span class="'+a,i=t?"":"</span>";return o+=e+'">',o+n+i}function d(){if(!w.k)return n(y);var e="",t=0;w.lR.lastIndex=0;for(var r=w.lR.exec(y);r;){e+=n(y.substr(t,r.index-t));var a=g(w,r);a?(B+=a[1],e+=p(a[0],n(r[0]))):e+=n(r[0]),t=w.lR.lastIndex,r=w.lR.exec(y)}return e+n(y.substr(t))}function h(){if(w.sL&&!R[w.sL])return n(y);var e=w.sL?s(w.sL,y,!0,L[w.sL]):l(y);return w.r>0&&(B+=e.r),"continuous"==w.subLanguageMode&&(L[w.sL]=e.top),p(e.language,e.value,!1,!0)}function v(){return void 0!==w.sL?h():d()}function b(e,t){var r=e.cN?p(e.cN,"",!0):"";e.rB?(M+=r,y=""):e.eB?(M+=n(t)+r,y=""):(M+=r,y=t),w=Object.create(e,{parent:{value:w}})}function m(e,t){if(y+=e,void 0===t)return M+=v(),0;var r=i(t,w);if(r)return M+=v(),b(r,t),r.rB?0:t.length;var a=c(w,t);if(a){var o=w;o.rE||o.eE||(y+=t),M+=v();do w.cN&&(M+="</span>"),B+=w.r,w=w.parent;while(w!=a.parent);return o.eE&&(M+=n(t)),y="",a.starts&&b(a.starts,""),o.rE?0:t.length}if(f(t,w))throw new Error('Illegal lexeme "'+t+'" for mode "'+(w.cN||"<unnamed>")+'"');return y+=t,t.length||1}var x=N(e);if(!x)throw new Error('Unknown language: "'+e+'"');u(x);for(var w=o||x,L={},M="",k=w;k!=x;k=k.parent)k.cN&&(M=p(k.cN,"",!0)+M);var y="",B=0;try{for(var C,j,I=0;;){if(w.t.lastIndex=I,C=w.t.exec(t),!C)break;j=m(t.substr(I,C.index-I),C[0]),I=C.index+j}m(t.substr(I));for(var k=w;k.parent;k=k.parent)k.cN&&(M+="</span>");return{r:B,value:M,language:e,top:w}}catch(A){if(-1!=A.message.indexOf("Illegal"))return{r:0,value:n(t)};throw A}}function l(e,t){t=t||E.languages||Object.keys(R);var r={r:0,value:n(e)},a=r;return t.forEach(function(n){if(N(n)){var t=s(n,e,!1);t.language=n,t.r>a.r&&(a=t),t.r>r.r&&(a=r,r=t)}}),a.language&&(r.second_best=a),r}function f(e){return E.tabReplace&&(e=e.replace(/^((<[^>]+>|\t)+)/gm,function(e,n){return n.replace(/\t/g,E.tabReplace)})),E.useBR&&(e=e.replace(/\n/g,"<br>")),e}function g(e,n,t){var r=n?x[n]:t,a=[e.trim()];return e.match(/(\s|^)hljs(\s|$)/)||a.push("hljs"),r&&a.push(r),a.join(" ").trim()}function p(e){var n=a(e);if(!/no(-?)highlight/.test(n)){var t;E.useBR?(t=document.createElementNS("http://www.w3.org/1999/xhtml","div"),t.innerHTML=e.innerHTML.replace(/\n/g,"").replace(/<br[ \/]*>/g,"\n")):t=e;var r=t.textContent,o=n?s(n,r,!0):l(r),u=i(t);if(u.length){var p=document.createElementNS("http://www.w3.org/1999/xhtml","div");p.innerHTML=o.value,o.value=c(u,i(p),r)}o.value=f(o.value),e.innerHTML=o.value,e.className=g(e.className,n,o.language),e.result={language:o.language,re:o.r},o.second_best&&(e.second_best={language:o.second_best.language,re:o.second_best.r})}}function d(e){E=o(E,e)}function h(){if(!h.called){h.called=!0;var e=document.querySelectorAll("pre code");Array.prototype.forEach.call(e,p)}}function v(){addEventListener("DOMContentLoaded",h,!1),addEventListener("load",h,!1)}function b(n,t){var r=R[n]=t(e);r.aliases&&r.aliases.forEach(function(e){x[e]=n})}function m(){return Object.keys(R)}function N(e){return R[e]||R[x[e]]}var E={classPrefix:"hljs-",tabReplace:null,useBR:!1,languages:void 0},R={},x={};return e.highlight=s,e.highlightAuto=l,e.fixMarkup=f,e.highlightBlock=p,e.configure=d,e.initHighlighting=h,e.initHighlightingOnLoad=v,e.registerLanguage=b,e.listLanguages=m,e.getLanguage=N,e.inherit=o,e.IR="[a-zA-Z][a-zA-Z0-9_]*",e.UIR="[a-zA-Z_][a-zA-Z0-9_]*",e.NR="\\b\\d+(\\.\\d+)?",e.CNR="(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)",e.BNR="\\b(0b[01]+)",e.RSR="!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~",e.BE={b:"\\\\[\\s\\S]",r:0},e.ASM={cN:"string",b:"'",e:"'",i:"\\n",c:[e.BE]},e.QSM={cN:"string",b:'"',e:'"',i:"\\n",c:[e.BE]},e.PWM={b:/\b(a|an|the|are|I|I'm|isn't|don't|doesn't|won't|but|just|should|pretty|simply|enough|gonna|going|wtf|so|such)\b/},e.CLCM={cN:"comment",b:"//",e:"$",c:[e.PWM]},e.CBCM={cN:"comment",b:"/\\*",e:"\\*/",c:[e.PWM]},e.HCM={cN:"comment",b:"#",e:"$",c:[e.PWM]},e.NM={cN:"number",b:e.NR,r:0},e.CNM={cN:"number",b:e.CNR,r:0},e.BNM={cN:"number",b:e.BNR,r:0},e.CSSNM={cN:"number",b:e.NR+"(%|em|ex|ch|rem|vw|vh|vmin|vmax|cm|mm|in|pt|pc|px|deg|grad|rad|turn|s|ms|Hz|kHz|dpi|dpcm|dppx)?",r:0},e.RM={cN:"regexp",b:/\//,e:/\/[gimuy]*/,i:/\n/,c:[e.BE,{b:/\[/,e:/\]/,r:0,c:[e.BE]}]},e.TM={cN:"title",b:e.IR,r:0},e.UTM={cN:"title",b:e.UIR,r:0},e});hljs.registerLanguage("xml",function(){var t="[A-Za-z0-9\\._:-]+",e={b:/<\?(php)?(?!\w)/,e:/\?>/,sL:"php",subLanguageMode:"continuous"},c={eW:!0,i:/</,r:0,c:[e,{cN:"attribute",b:t,r:0},{b:"=",r:0,c:[{cN:"value",c:[e],v:[{b:/"/,e:/"/},{b:/'/,e:/'/},{b:/[^\s\/>]+/}]}]}]};return{aliases:["html","xhtml","rss","atom","xsl","plist"],cI:!0,c:[{cN:"doctype",b:"<!DOCTYPE",e:">",r:10,c:[{b:"\\[",e:"\\]"}]},{cN:"comment",b:"<!--",e:"-->",r:10},{cN:"cdata",b:"<\\!\\[CDATA\\[",e:"\\]\\]>",r:10},{cN:"tag",b:"<style(?=\\s|>|$)",e:">",k:{title:"style"},c:[c],starts:{e:"</style>",rE:!0,sL:"css"}},{cN:"tag",b:"<script(?=\\s|>|$)",e:">",k:{title:"script"},c:[c],starts:{e:"</script>",rE:!0,sL:"javascript"}},e,{cN:"pi",b:/<\?\w+/,e:/\?>/,r:10},{cN:"tag",b:"</?",e:"/?>",c:[{cN:"title",b:/[^ \/><\n\t]+/,r:0},c]}]}});hljs.registerLanguage("elixir",function(e){var r="[a-zA-Z_][a-zA-Z0-9_]*(\\!|\\?)?",b="[a-zA-Z_]\\w*[!?=]?|[-+~]\\@|<<|>>|=~|===?|<=>|[<>]=?|\\*\\*|[-/+%^&*~`|]|\\[\\]=?",n="and false then defined module in return redo retry end for true self when next until do begin unless nil break not case cond alias while ensure or include use alias fn quote",c={cN:"subst",b:"#\\{",e:"}",l:r,k:n},a={cN:"string",c:[e.BE,c],v:[{b:/'/,e:/'/},{b:/"/,e:/"/}]},s={eW:!0,rE:!0,l:r,k:n,r:0},i={cN:"function",bK:"def defmacro",e:/\bdo\b/,c:[e.inherit(e.TM,{b:b,starts:s})]},l=e.inherit(i,{cN:"class",bK:"defmodule defrecord",e:/\bdo\b|$|;/}),t=[a,e.HCM,l,i,{cN:"constant",b:"(\\b[A-Z_]\\w*(.)?)+",r:0},{cN:"symbol",b:":",c:[a,{b:b}],r:0},{cN:"symbol",b:r+":",r:0},{cN:"number",b:"(\\b0[0-7_]+)|(\\b0x[0-9a-fA-F_]+)|(\\b[1-9][0-9_]*(\\.[0-9_]+)?)|[0_]\\b",r:0},{cN:"variable",b:"(\\$\\W)|((\\$|\\@\\@?)(\\w+))"},{b:"->"},{b:"("+e.RSR+")\\s*",c:[e.HCM,{cN:"regexp",i:"\\n",c:[e.BE,c],v:[{b:"/",e:"/[a-z]*"},{b:"%r\\[",e:"\\][a-z]*"}]}],r:0}];return c.c=t,s.c=t,{l:r,k:n,c:t}});hljs.registerLanguage("erlang",function(e){var r="[a-z'][a-zA-Z0-9_']*",c="("+r+":"+r+"|"+r+")",a={keyword:"after and andalso|10 band begin bnot bor bsl bzr bxor case catch cond div end fun if let not of orelse|10 query receive rem try when xor",literal:"false true"},n={cN:"comment",b:"%",e:"$"},b={cN:"number",b:"\\b(\\d+#[a-fA-F0-9]+|\\d+(\\.\\d+)?([eE][-+]?\\d+)?)",r:0},i={b:"fun\\s+"+r+"/\\d+"},o={b:c+"\\(",e:"\\)",rB:!0,r:0,c:[{cN:"function_name",b:c,r:0},{b:"\\(",e:"\\)",eW:!0,rE:!0,r:0}]},d={cN:"tuple",b:"{",e:"}",r:0},t={cN:"variable",b:"\\b_([A-Z][A-Za-z0-9_]*)?",r:0},l={cN:"variable",b:"[A-Z][a-zA-Z0-9_]*",r:0},f={b:"#"+e.UIR,r:0,rB:!0,c:[{cN:"record_name",b:"#"+e.UIR,r:0},{b:"{",e:"}",r:0}]},s={bK:"fun receive if try case",e:"end",k:a};s.c=[n,i,e.inherit(e.ASM,{cN:""}),s,o,e.QSM,b,d,t,l,f];var u=[n,i,s,o,e.QSM,b,d,t,l,f];o.c[1].c=u,d.c=u,f.c[1].c=u;var v={cN:"params",b:"\\(",e:"\\)",c:u};return{aliases:["erl"],k:a,i:"(</|\\*=|\\+=|-=|/\\*|\\*/|\\(\\*|\\*\\))",c:[{cN:"function",b:"^"+r+"\\s*\\(",e:"->",rB:!0,i:"\\(|#|//|/\\*|\\\\|:|;",c:[v,e.inherit(e.TM,{b:r})],starts:{e:";|\\.",k:a,c:u}},n,{cN:"pp",b:"^-",e:"\\.",r:0,eE:!0,rB:!0,l:"-"+e.IR,k:"-module -record -undef -export -ifdef -ifndef -author -copyright -doc -vsn -import -include -include_lib -compile -define -else -endif -file -behaviour -behavior -spec",c:[v]},b,e.QSM,f,t,l,d,{b:/\.$/}]}});
  +/*!
  + * highlight.js v8.4
  + * https://highlightjs.org/ 

  $ git status
  # On branch master
  # Changes to be committed:
  #   (use "git reset HEAD ..." to unstage)
  #
  #       modified:   README
  #

  diff --git a/README b/README
  index bccdfbd..b0ed415 100644
  --- a/README
  +++ b/README
  @@ -1 +1,2 @@
   This is the README file.
   +One more line. 
  ```

  CSS
  ```css
  avatar-change:hover{background-color:#eee}::-webkit-input-placeholder{color:#a8a8a8}.topbar{font-size:13px}.topbar .topbar-icon,.topbar .date-group-toggle,.topbar .icon-help>.triangle{background-color:transparent;background-repeat:no-repeat;background-image:url('../img/share-sprite-new.png?v=15a298c15269');background-image:url('../img/share-sprite-new.svg?')

  body {font-family:Arial, Helvetica, sans-serif;}

  a {text-decoration:none;}
  .center {text-align:center;}

  header, footer, h1, h2, h3 {font-family:QuicksandBook, Arial, Helvetica, sans-serif; font-weight:normal;}
  #standfirst, .list-heading {font-family:Arial, Helvetica, sans-serif; font-weight:normal;}
  code, pre {font-family:"Courier New", Courier, monospace;}
  code {font-weight:bold;}

  html, body {font-size:100%;}
  h1 {font-size:240%; text-transform:uppercase;}
  h2 {font-size:110%;}
  .extras h2 {font-size:180%;}
  h4 {font-size:100%; font-weight:normal;}
  p, ul {font-size:80%; line-height:1.4em;}
  footer a, #wiley-logo, .tool .chapter-ref, .newsletter, pre, .extra-content td {font-size:75%;}  
  ```

  HTML
  ```html
  <pre><code class="elixir hljs"><span class="hljs-comment"># Compute in the agent/server</span>
  <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">get_something</span>(agent) </span><span class="hljs-keyword">do</span>
    <span class="hljs-constant">Agent.</span>get(agent, <span class="hljs-keyword">fn</span> state -&gt; do_something_expensive(state) <span class="hljs-keyword">end</span>)
  <span class="hljs-keyword">end</span>

  <span class="hljs-comment"># Compute in the agent/client</span>
  <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">get_something</span>(agent) </span><span class="hljs-keyword">do</span>
    <span class="hljs-constant">Agent.</span>get(agent, &amp;(&amp;<span class="hljs-number">1</span>)) |&gt; do_something_expensive()
  <span class="hljs-keyword">end</span></code></pre>
  ```

  XML
  ```xml
<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
  <table border="2" bgcolor="yellow">
  <tr>
  <th>Title</th>
  <th>Artist</th>
  <th>Dynamic Content</th>
  </tr>
  <xsl:for-each select="CATALOG/CD">
  <tr>
  <td><xsl:value-of select="TITLE"/></td>
  <td><xsl:value-of select="ARTIST"/></td>
  <td><xsl:value-of select="ORACLE"/></td>
  </tr>
  </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

<!DOCTYPE TVSCHEDULE [ 
<!ELEMENT TVSCHEDULE (CHANNEL+)>
<!ELEMENT CHANNEL (BANNER, DAY+)>
<!ELEMENT BANNER (#PCDATA)>
<!ELEMENT DAY ((DATE, HOLIDAY) | (DATE, PROGRAMSLOT+))+>
<!ELEMENT HOLIDAY (#PCDATA)>
<!ELEMENT DATE (#PCDATA)>
<!ELEMENT PROGRAMSLOT (TIME, TITLE, DESCRIPTION?)>
<!ELEMENT TIME (#PCDATA)>
<!ELEMENT TITLE (#PCDATA)> 
<!ELEMENT DESCRIPTION (#PCDATA)>

<!ATTLIST TVSCHEDULE  NAME CDATA #REQUIRED>
<!ATTLIST CHANNEL CHAN CDATA #REQUIRED>
<!ATTLIST PROGRAMSLOT VTR CDATA #IMPLIED>
<!ATTLIST TITLE RATING CDATA #IMPLIED>
<!ATTLIST TITLE LANGUAGE CDATA #IMPLIED>
]>
  ```


  ```nohighlight
  #This should not be higligthed at all
  @doc "Checks if the task has already executed"
  def executed?(task, project) do
    item = {task, project}
    Agent.get(__MODULE__, fn set ->
      item in set
    end)
  end
  ```

  For example, in the Mix tool that ships with Elixir, we need
  to keep a set of all tasks executed by a given project. Since
  this set is shared, we can implement it with an Agent:

      defmodule Mix.TasksServer do
        def start_link do
          Agent.start_link(fn -> HashSet.new end, name: __MODULE__)
        end

        @doc "Checks if the task has already executed"
        def executed?(task, project) do
          item = {task, project}
          Agent.get(__MODULE__, fn set ->
            item in set
          end)
        end

        @doc "Marks a task as executed"
        def put_task(task, project) do
          item = {task, project}
          Agent.update(__MODULE__, &Set.put(&1, item))
        end
      end

  Note that agents still provide a segregation between the
  client and server APIs, as seen in GenServers. In particular,
  all code inside the function passed to the agent is executed
  by the agent. This distinction is important because you may
  want to avoid expensive operations inside the agent, as it will
  effectively block the agent until the request is fulfilled.

  Consider these two examples:

      # Compute in the agent/server
      def get_something(agent) do
        Agent.get(agent, fn state -> do_something_expensive(state) end)
      end

      # Compute in the agent/client
      def get_something(agent) do
        Agent.get(agent, &(&1)) |> do_something_expensive()
      end

  The first one blocks the agent while the second one copies
  all the state to the client and executes the operation in the client.
  The trade-off here is exactly if the data is small enough to be
  sent to the client cheaply or large enough to require processing on
  the server (or at least some initial processing).

  ## Name Registration

  An Agent is bound to the same name registration rules as GenServers.
  Read more about it in the `GenServer` docs.

  ## A word on distributed agents

  It is important to consider the limitations of distributed agents. Agents
  provides two APIs, one that works with anonymous functions and another
  that expects explicit module, function and arguments.

  In a distributed setup with multiple nodes, the API that accepts anonymous
  functions only works if the caller (client) and the agent have the same
  version of the caller module.

  Keep in mind this issue also shows up when performing "rolling upgrades"
  with agents. By rolling upgrades we mean the following situation: you wish
  to deploy a new version of your software by *shutting down* some of your
  nodes and replacing them with nodes running a new version of the software.
  In this setup, part of your environment will have one version of a given
  module and the other part another version (the newer one) of the same module.

  The best solution is to simply use the explicit module, function and arguments
  APIs when working with distributed agents.

  ## Hot code swapping

  An agent can have its code hot swapped live by simply passing a module,
  function and args tuple to the update instruction. For example, imagine
  you have an agent named `:sample` and you want to convert its inner state
  from some dict structure to a map. It can be done with the following
  instruction:

      {:update, :sample, {:advanced, {Enum, :into, [%{}]}}}

  The agent's state will be added to the given list as the first argument.
  '''

  @typedoc "Return values of `start*` functions"
  @type on_start :: {:ok, pid} | {:error, {:already_started, pid} | term}

  @typedoc "The agent name"
  @type name :: atom | {:global, term} | {:via, module, term}

  @typedoc "The agent reference"
  @type agent :: pid | {atom, node} | name

  @typedoc "The agent state"
  @type state :: term

  @doc """
  Starts an agent linked to the current process with the given function.

  This is often used to start the agent as part of a supervision tree.

  Once the agent is spawned, the given function is invoked and its return
  value is used as the agent state. Note that `start_link` does not return
  until the given function has returned.

  ## Options

  The `:name` option is used for registration as described in the module
  documentation.

  If the `:timeout` option is present, the agent is allowed to spend at most
  the given number of milliseconds on initialization or it will be terminated
  and the start function will return `{:error, :timeout}`.

  If the `:debug` option is present, the corresponding function in the
  [`:sys` module](http://www.erlang.org/doc/man/sys.html) will be invoked.

  If the `:spawn_opt` option is present, its value will be passed as options
  to the underlying process as in `Process.spawn/4`.

  ## Return values

  If the server is successfully created and initialized, the function returns
  `{:ok, pid}`, where `pid` is the pid of the server. If there already exists
  an agent with the specified name, the function returns
  `{:error, {:already_started, pid}}` with the pid of that process.

  If the given function callback fails with `reason`, the function returns
  `{:error, reason}`.
  """
  @spec start_link((() -> term), GenServer.options) :: on_start
  def start_link(fun, options \\ []) when is_function(fun, 0) do
    GenServer.start_link(Agent.Server, fun, options)
  end

  @doc """
  Starts an agent linked to the current process with the given module
  function and arguments.

  Same as `start_link/2` but a module, function and args are expected
  instead of an anonymous function.
  """
  @spec start_link(module, atom, [any], GenServer.options) :: on_start
  def start_link(module, fun, args, options \\ []) do
    GenServer.start_link(Agent.Server, {module, fun, args}, options)
  end

  @doc """
  Starts an agent process without links (outside of a supervision tree).

  See `start_link/2` for more information.
  """
  @spec start((() -> term), GenServer.options) :: on_start
  def start(fun, options \\ []) when is_function(fun, 0) do
    GenServer.start(Agent.Server, fun, options)
  end

  @doc """
  Starts an agent with the given module function and arguments.

  Similar to `start/2` but a module, function and args are expected
  instead of an anonymous function.
  """
  @spec start(module, atom, [any], GenServer.options) :: on_start
  def start(module, fun, args, options \\ []) do
    GenServer.start(Agent.Server, {module, fun, args}, options)
  end

  @doc """
  Gets an agent value via the given function.

  The function `fun` is sent to the `agent` which invokes the function
  passing the agent state. The result of the function invocation is
  returned.

  A timeout can also be specified (it has a default value of 5000).
  """
  @spec get(agent, (state -> a), timeout) :: a when a: var
  def get(agent, fun, timeout \\ 5000) when is_function(fun, 1) do
    GenServer.call(agent, {:get, fun}, timeout)
  end

  @doc """
  Gets an agent value via the given function.

  Same as `get/3` but a module, function and args are expected
  instead of an anonymous function. The state is added as first
  argument to the given list of args.
  """
  @spec get(agent, module, atom, [term], timeout) :: any
  def get(agent, module, fun, args, timeout \\ 5000) do
    GenServer.call(agent, {:get, {module, fun, args}}, timeout)
  end

  @doc """
  Gets and updates the agent state in one operation.

  The function `fun` is sent to the `agent` which invokes the function
  passing the agent state. The function must return a tuple with two
  elements, the first being the value to return (i.e. the `get` value)
  and the second one is the new state.

  A timeout can also be specified (it has a default value of 5000).
  """
  @spec get_and_update(agent, (state -> {a, state}), timeout) :: a when a: var
  def get_and_update(agent, fun, timeout \\ 5000) when is_function(fun, 1) do
    GenServer.call(agent, {:get_and_update, fun}, timeout)
  end

  @doc """
  Gets and updates the agent state in one operation.

  Same as `get_and_update/3` but a module, function and args are expected
  instead of an anonymous function. The state is added as first
  argument to the given list of args.
  """
  @spec get_and_update(agent, module, atom, [term], timeout) :: any
  def get_and_update(agent, module, fun, args, timeout \\ 5000) do
    GenServer.call(agent, {:get_and_update, {module, fun, args}}, timeout)
  end

  @doc """
  Updates the agent state.

  The function `fun` is sent to the `agent` which invokes the function
  passing the agent state. The function must return the new state.

  A timeout can also be specified (it has a default value of 5000).
  This function always returns `:ok`.
  """
  @spec update(agent, (state -> state), timeout) :: :ok
  def update(agent, fun, timeout \\ 5000) when is_function(fun, 1) do
    GenServer.call(agent, {:update, fun}, timeout)
  end

  @doc """
  Updates the agent state.

  Same as `update/3` but a module, function and args are expected
  instead of an anonymous function. The state is added as first
  argument to the given list of args.
  """
  @spec update(agent, module, atom, [term], timeout) :: :ok
  def update(agent, module, fun, args, timeout \\ 5000) do
    GenServer.call(agent, {:update, {module, fun, args}}, timeout)
  end

  @doc """
  Performs a cast (fire and forget) operation on the agent state.

  The function `fun` is sent to the `agent` which invokes the function
  passing the agent state. The function must return the new state.

  Note that `cast` returns `:ok` immediately, regardless of whether the
  destination node or agent exists.
  """
  @spec cast(agent, (state -> state)) :: :ok
  def cast(agent, fun) when is_function(fun, 1) do
    GenServer.cast(agent, {:cast, fun})
  end

  @doc """
  Performs a cast (fire and forget) operation on the agent state.

  Same as `cast/2` but a module, function and args are expected
  instead of an anonymous function. The state is added as first
  argument to the given list of args.
  """
  @spec cast(agent, module, atom, [term]) :: :ok
  def cast(agent, module, fun, args) do
    GenServer.cast(agent, {:cast, {module, fun, args}})
  end

  @doc """
  Stops the agent.

  Returns `:ok` if the agent is stopped within the given `timeout`.
  """
  @spec stop(agent, timeout) :: :ok
  def stop(agent, timeout \\ 5000) do
    GenServer.call(agent, :stop, timeout)
  end
end
