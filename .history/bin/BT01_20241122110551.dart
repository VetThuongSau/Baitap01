import 'dart:io';

void main() {
  // Yêu cầu người dùng nhập một số nguyên
  stdout.write("Nhập một số nguyên (n ≥ 1): ");
  int n = int.parse(stdin
      .readLineSync()!); // Đọc dữ liệu từ bàn phím và chuyển thành số nguyên

  // Kiểm tra điều kiện n ≥ 1
  if (n < 1) {
    print("Vui lòng nhập một số nguyên lớn hơn hoặc bằng 1.");
  } else {
    // Chuyển đổi số thập phân sang nhị phân
    String binary = decimalToBinary(n);
    print("Số nhị phân của $n là: $binary");
  }
}

// Hàm chuyển đổi số thập phân thành nhị phân
String decimalToBinary(int number) {
  return number.toRadixString(2); // Phương thức chuyển đổi trực tiếp trong Dart
}
