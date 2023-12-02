import strutils
import sequtils

proc parseInput(path: string): seq[string] =
    result = readFile(path).strip().splitLines()

proc partOne(input: seq[string]): int =
  result = input.mapIt(@[it.filterIt(it.isDigit)[0], it.filterIt(it.isDigit)[^1]].join).mapIt(it.parseInt).foldl(a+b)

proc partTwo(input: seq[string]): seq[string] =
  result = input.mapIt(it.multiReplace([
    ("oneight","18"),
    ("twone","21"),
    ("threeight","38"),
    ("fiveight","58"),
    ("sevenine","79"),
    ("eightwo","82"),
    ("eighthree","83"),
    ("nineight","98")
  ])).mapIt(it.multiReplace([
    ("one","1"),
    ("two","2"),
    ("three","3"),
    ("four","4"),
    ("five","5"),
    ("six","6"),
    ("seven","7"),
    ("eight","8"),
    ("nine","9"),
  ]))

var
  sample = parseInput("sample/day01.txt")
  sample2 = parseInput("sample/day01-2.txt")
  input = parseInput("input/day01.txt")

assert sample.partOne == 142
assert sample2.partTwo.partOne == 281

echo "Part one:"
echo input.partOne

echo "Part two:"
echo input.partTwo.partOne

