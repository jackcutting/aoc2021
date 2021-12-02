import 'dart:io';

void main(List<String> arguments) {
  int part = 1;

  if (arguments.length > 0 && arguments.first == '2') part = 2;

  final List<String> input = File('input.txt').readAsLinesSync();
  int horizontal = 0;
  int depth = 0;
  int aim = 0;

  for (int i = 0; i < input.length; i++) {
    final List<String> command = input[i].split(' ');

    switch (command.first) {
      case 'forward':
        horizontal += int.parse(command.last);
        if (part == 2) depth += aim * int.parse(command.last);
        break;
      case 'up':
        if (part == 1) depth -= int.parse(command.last);
        aim -= int.parse(command.last);
        break;
      case 'down':
        if (part == 1) depth += int.parse(command.last);
        aim += int.parse(command.last);
        break;
      default:
    }
  }

  print(horizontal * depth);
}
