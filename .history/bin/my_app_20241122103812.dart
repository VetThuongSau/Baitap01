import 'package:my_app/my_app.dart' as my_app;
import 'dart:math';
import 'dart:io';

void main(List<String> arguments) {
  double a = 0, b = 0, c = 0;

  // Nhập và kiểm tra a (đảm bảo a ≠ 0)
  do {
    stdout.write('Nhập hệ số a (a ≠ 0): ');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ?? 0;
    }
    if (a == 0) {
      print('Hệ số a phải khác 0. Vui lòng nhập lại!');
    }
  } while (a == 0);

  // Nhập b
  stdout.write('Nhập hệ số b: ');
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ?? 0;
  }

  // Nhập c
  stdout.write('Nhập hệ số c: ');
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ?? 0;
  }

  // Hiển thị phương trình
  print('\nPhương trình: ${a}x² + ${b}x + $c = 0');

  // Tính delta
  double delta = b * b - 4 * a * c;
  print('Delta = $delta');

  // Giải phương trình dựa vào delta
  if (delta < 0) {
    print('Phương trình vô nghiệm');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    // Làm tròn đến 2 chữ số thập phân
    x = double.parse(x.toStringAsFixed(2));
    print('Phương trình có nghiệm kép x = $x');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    // Làm tròn đến 2 chữ số thập phân
    x1 = double.parse(x1.toStringAsFixed(2));
    x2 = double.parse(x2.toStringAsFixed(2));
    print('Phương trình có 2 nghiệm phân biệt:');
    print('x1 = $x1');
    print('x2 = $x2');
  }
}
