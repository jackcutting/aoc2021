import 'dart:io';

void main(List<String> arguments) {
  int part = 1;

  if (arguments.length > 0 && arguments.first == '2') part = 2;

  final List<String> input = File('input.txt').readAsLinesSync();
  int increased = 0;

  for (int i = 0; i < input.length; i++) {
    if (part == 1 && i > 0 && int.parse(input[i - 1]) < int.parse(input[i]))
      increased++;

    if (part == 2 && i > 0 && i < input.length - 2) {
      final int previous = int.parse(input[i - 1]) +
          int.parse(input[i]) +
          int.parse(input[i + 1]);
      final int current = int.parse(input[i]) +
          int.parse(input[i + 1]) +
          int.parse(input[i + 2]);

      if (current > previous) increased++;
    }
  }

  print(increased);
}
