import strutils
import sequtils

proc parseInput(path: string): seq[seq[seq[int]]] =
    result = readFile(path).strip().splitLines().mapIt(it.split(":")[1].strip().split("|").mapIt(it.strip().splitWhitespace.mapIt(it.parseInt)))

proc cardScore(card: seq[seq[int]]): int =
  for number in card[1].items:
    if number in card[0]:
      if result == 0:
        result = 1
      else:
        result *= 2

proc partOne(input: seq[seq[seq[int]]]): int =
  for card in input:
    result += cardScore(card)

var
  sample = parseInput("sample/day04.txt")
  input = parseInput("input/day04.txt")


assert partOne(sample) == 13
echo "Part 1: ", partOne(input)
