import 'dart:io';

void main(List<String> arguments) {
  int part = 1;

  if (arguments.length > 0 && arguments.first == '2') part = 2;

  final List<String> input = File(
          (arguments.length > 1 && arguments[1] == 'sample')
              ? 'input.sample.txt'
              : 'input.txt')
      .readAsLinesSync();

  int length = input.first.length;

  if (part == 1) {
    String gamma = '';
    String epsilon = '';

    for (int j = 0; j < length; j++) {
      int ones = 0;
      int zeros = 0;

      for (int i = 0; i < input.length; i++) {
        (input[i].substring(j, j + 1) == '1') ? ones++ : zeros++;
      }

      if (ones > zeros) {
        gamma += '1';
        epsilon += '0';
      } else {
        gamma += '0';
        epsilon += '1';
      }
    }

    final gammaInt = int.parse(gamma, radix: 2);
    final epsilonInt = int.parse(epsilon, radix: 2);

    print(gammaInt * epsilonInt);
  } else {
    List<String> oxygen = getRating(input, 0);
    List<String> co2 = getRating(input, 0, true);

    final oxygenInt = int.parse(oxygen.first, radix: 2);
    final co2Int = int.parse(co2.first, radix: 2);

    print('$oxygen | $oxygenInt');
    print('$co2 | $co2Int');
    print(oxygenInt * co2Int);
  }
}

List<String> getRating(List<String> input, int position, [bool co2 = false]) {
  int ones = 0;
  int zeros = 0;

  for (int i = 0; i < input.length; i++) {
    (input[i].substring(position, position + 1) == '1') ? ones++ : zeros++;
  }

  if (ones >= zeros) {
    input = input
        .where((element) =>
            element.substring(position, position + 1) == (co2 ? '0' : '1'))
        .toList();
  } else {
    input = input
        .where((element) =>
            element.substring(position, position + 1) == (co2 ? '1' : '0'))
        .toList();
  }

  if (input.length > 1) return getRating(input, position + 1, co2);

  return input;
}
