defmodule Cheater.Solver do

  def pick(tiles, word), do: pick(tiles, word, '')
  def pick(tiles, word, int) when tiles == '' or word == '' do
    int
  end
  def pick(tiles, [char | chars], int) do
    cond do
      Enum.member? tiles, char ->
        pick(tiles -- [char], chars, int ++ [char])
      true ->
        pick(tiles, chars, int)
    end
  end

  def suggest(tiles, dict) do
    Enum.filter(dict, fn(word) -> word == pick(tiles, word) end)
  end

end
