The following lines are giving issues

```elixir

~R'this + i\s "a" regex too'
~w(hello #{ ["has" <> "123", '\c\d', "\123 interpol" | []] } world)s
~W(hello #{no "123" \c\d \123 interpol} world)s
~s{Escapes terminators \{ and \}, but no {balancing} # outside of sigil here }
~S"No escapes \s\t\n and no #{interpolation}"

defmodule Long.Module.Name do
  @doc ~S'''
  No #{interpolation} of any kind.
  \000 \x{ff}

  \n #{\x{ff}}
  '''
  def func(a, b \\ []), do: :ok

  @doc ~S"""
  No #{interpolation} of any kind.
  \000 \x{ff}

  \n #{\x{ff}}
  """
  def func(a, b \\ []), do: :ok
end

import Kernel, except: [spawn: 1, +: 2, /: 2, Unless: 2]

```