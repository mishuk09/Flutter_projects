import 'dart:io';

void main() {
  print('Take value from users');
  stdout.write("Enter your value:");
  var name = stdin.readLineSync();
  print(name);
}
