import strutils
import sequtils

proc parseInput(path: string): seq[(int, seq[(int,int,int)])] =
  for i in readFile(path).strip().splitLines().mapIt(it.split(":")).items:
    var
      tmp: (int, seq[(int,int,int)])
      draws = i[1].split(";").mapIt(it.strip().split(",").mapIt(it.strip()))
    tmp[0] = i[0].split(" ")[1].parseInt()
    for d in draws.items:
      var draw = (0,0,0)
      for b in d.items:
        case b.split(" ")[1]
        of "red": draw[0] = b.split(" ")[0].parseInt()
        of "green": draw[1] = b.split(" ")[0].parseInt()
        of "blue": draw[2] = b.split(" ")[0].parseInt()
        else: discard
      tmp[1].add(draw)
    result.add(tmp)

const max = (12,13,14)

proc gamePossible(max: (int,int,int); draws: seq[(int,int,int)]): bool =
  for d in draws:
    if d[0] > max[0] or d[1] > max[1] or d[2] > max[2]:
      return false
  return true

proc partOne(input: seq[(int, seq[(int,int,int)])]): int =
  for i in input:
    if gamePossible(max, i[1]):
      result += i[0]

proc gamePower(draws: seq[(int,int,int)]): int =
  result = 1
  var fewest: (int,int,int)
  for d in draws:
    if d[0] > fewest[0]: fewest[0] = d[0]
    if d[1] > fewest[1]: fewest[1] = d[1]
    if d[2] > fewest[2]: fewest[2] = d[2]
  result = fewest[0] * fewest[1] * fewest[2]

proc partTwo(input: seq[(int, seq[(int,int,int)])]): int =
  for i in input:
    result += gamePower(i[1])

var
  sample = parseInput("sample/day02.txt")
  input = parseInput("input/day02.txt")

assert sample.partOne() == 8
assert sample.partTwo() == 2286

echo "Part 1: ", input.partOne()
echo "Part 2: ", input.partTwo()
