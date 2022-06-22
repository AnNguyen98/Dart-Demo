import 'dart:io';

String afterSentece(String sentence) {
  final listWord = sentence.split(' ');
  var result = '';
  for (var i = 0; i < listWord.length - 1; i++) {
    if (listWord[i].compareTo(listWord[i + 1]) == 0) {
      listWord.removeAt(i);
      i--;
    } else {
      result = result + listWord[i] + ' ';
    }
  }
  return result + listWord[listWord.length - 1];
}

Future<List<dynamic>> readFile() async {
  final file = File('./assets/all_numbers.txt');
  final numbersStr = await file.readAsString();
  final regExp = RegExp('[0-9]+');
  final listStr = regExp.allMatches(numbersStr).map((e) => e.group(0)).toList();
  return listStr;
}

void main(List<String> arguments) async {
  const cau = 'Chào bạn bạn Hoa, mình là là là là là Dev Flutter';
  final parts = cau.split(' ');
  print(parts);
  for (var i = 0; i < parts.length - 1; i++) {
    for (var j = i + 1; j < parts.length; j++) {
      if (parts[i] == parts[j]) {
        parts[j] = parts[j + 1];
        parts.removeAt(j);
        j--;
      }
    }
  }

  print(parts.join(' '));

  // print(numbers.split(' ').map((e) => e.trim()).join('\n'));
}

int binarySearch(List<int> arr, int l, int r, int x) {
  if (r >= l) {
    final mid = (l + (r - l) / 2).toInt();

    // If the element is present at the middle
    // itself
    if (arr[mid] == x) {
      return mid;
    }

    // If element is smaller than mid, then
    // it can only be present in left subarray
    if (arr[mid] > x) {
      return binarySearch(arr, l, mid - 1, x);
    }

    // Else the element can only be present
    // in right subarray
    return binarySearch(arr, mid + 1, r, x);
  }

  // We reach here when element is not
  // present in array
  return -1;
}
