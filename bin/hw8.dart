import 'dart:io';

void main(List<String> arguments) async {
  File file = File('./assets/all_numbers.txt');
  final numbers = await file.readAsString();

  print(numbers.split(' ').map((e) => e.trim()).join('\n'));
}

// value: int, set

// ref : Map